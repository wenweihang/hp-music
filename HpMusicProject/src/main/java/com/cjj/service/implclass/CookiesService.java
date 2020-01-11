package com.cjj.service.implclass;

import com.cjj.dao.InfCookiesDao;
import com.cjj.entity.User;
import com.cjj.entity.UserSignIn;
import com.cjj.service.InfCookiesService;
import com.cjj.utils.GetYMDUtil;
import com.cjj.utils.TimeFormatUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.text.ParseException;
import java.util.Date;
import java.util.HashMap;

@Service
public class CookiesService implements InfCookiesService {
    @Autowired
    private InfCookiesDao cookiesDao;

    @Override
    public Object judgeContinueLog(HttpServletRequest req, HttpServletResponse resp) throws ParseException {
        System.out.println("---------用户签到API开始执行----------");
        HashMap<String, UserSignIn> hm = new HashMap<>();
        //获取用户帐号
        User logUser = (User) req.getSession().getAttribute("logUser");
        String uer_act = logUser.getUer_act();
        if(uer_act.contains("@")||uer_act.contains(".")){
            uer_act=uer_act.replace("@","" ).replace(".","" );
        }
        //获取数据库中的签到信息
        UserSignIn userSignInDao = cookiesDao.selectSignInByAct(uer_act);
        Cookie[] cookies = req.getCookies();
        boolean isExist = false;
        //判断cookies存在时,默认有一个JSESSIONID
            if (cookies != null && cookies.length > 0) {
                for (Cookie c : cookies) {
                    String name = c.getName();
                    System.out.println("名字:" + name);
                    System.out.println("cookies的长度为:" + cookies.length);
                    //判断是否存在cookies的用户
                    if (cookies.length > 1) {
                        //判断该用户是否存在签到信息,当存在时,说明已经注册登录过了,如过不存在,说明可能没注册或注册没有登录。
                        if (userSignInDao != null) {
                            //存在该用户
                            //获取数据库的最后一天签到时间
                            String usi_nextDayDao = userSignInDao.getUsi_nextDay();
                            String dayDao = GetYMDUtil.getDay(usi_nextDayDao);
                            int idayDao = Integer.parseInt(dayDao);
                            System.out.println("用户为:" + uer_act);
                            //获取数据库中的cookies和nextDay
                            String usi_cookiesDao = userSignInDao.getUsi_cookies();
                            //获取今天的日期
                            String usi_nextDay = TimeFormatUtil.getTimeFormat2(new Date());
                            String day = GetYMDUtil.getDay(usi_nextDay);
                            int iday = Integer.parseInt(day);
                            //如果浏览器中存在和数据库中用户的cookies一致并且今天没有登录,那么执行连续登录操作
                            if (name.equals(usi_cookiesDao) && idayDao + 1 == iday) {
                                isExist = true;
                                int usi_continueDayDao = userSignInDao.getUsi_continueDay();
                                int usi_continueDay = usi_continueDayDao + 1;
                                //创建更新对象
                                UserSignIn userSignIn = new UserSignIn();
                                userSignIn.setUsi_continueDay(usi_continueDay);
                                userSignIn.setUer_act(uer_act);
                                userSignIn.setUsi_nextDay(usi_nextDay);
                                int result = cookiesDao.updateContinueSignIn(userSignIn);
                                if (result > 0) {
                                    System.out.println("连续登录更新完成!");
                                    System.out.println("更新连续登录的信息:" + userSignIn);
                                    hm.put("userSignIn", userSignIn);
                                    return hm;
                                }
                                System.out.println("修改数据库失败!");
                            }
                        }
                    }
                }
            }

        //当该用户的cookies消失或用户不存在时
        if (cookies == null || cookies.length == 0 || isExist == false) {
            System.out.println("----------用户第一次签到或中断签到开始执行----------");
            System.out.println("用户账号为："+uer_act);
            Cookie cookie = new Cookie(uer_act, uer_act);
            //获取从现在开始cookies消失时间
            int cookiesTime = TimeFormatUtil.countNowToNDay(2);
            cookie.setMaxAge(cookiesTime);
            cookie.setPath(req.getContextPath());
            resp.addCookie(cookie);
            //封装签到信息
            String usi_startDay = TimeFormatUtil.getTimeFormat2(new Date());
            String usi_nextDay = TimeFormatUtil.getTimeFormat2(new Date());
            //创建用户签到对象并进行封装
            UserSignIn userSignIn = new UserSignIn();
            userSignIn.setUer_act(uer_act);
            userSignIn.setUsi_startDay(usi_startDay);
            userSignIn.setUsi_nextDay(usi_nextDay);
            userSignIn.setUsi_continueDay(1);
            //当用户不存在时为第一次登录签到
            if (userSignInDao == null) {
                System.out.println("用户为空，第一次登录签到");
                userSignIn.setUsi_cookies(cookie.getName());
                cookiesDao.addUserSignIn(userSignIn);
                System.out.println("第一次插入成功!");
                hm.put("userSignIn", userSignIn);
                return hm;
            }
            //当用户存在时为中断签到或浏览器cookies可能被手动删除了
            if (userSignInDao != null) {
                System.out.println("用户不为空");
                //获取数据库的最后一天签到时间
                String usi_nextDayDao = userSignInDao.getUsi_nextDay();
                String dayDao = GetYMDUtil.getDay(usi_nextDayDao);
                int idayDao = Integer.parseInt(dayDao);
                //获取今天的day
                String day = GetYMDUtil.getDay(usi_nextDay);
                int iday = Integer.parseInt(day);
                if (idayDao == iday ) {
                    System.out.println("浏览器cookies可能被手动删除了,用户为:" + uer_act + ",重新获取数据!");
                    hm.put("userSignIn", userSignInDao);
                    return hm;
                }
                if(idayDao + 1 == iday){
                    System.out.println("浏览器cookies可能被手动删除了,用户为:" + uer_act + ",但今天登录为连续登录");
                    int reusi_continueDayDao = userSignInDao.getUsi_continueDay();
                    int reusi_continueDay = reusi_continueDayDao + 1;
                    //创建重新更新对象
                    UserSignIn reuserSignIn = new UserSignIn();
                    reuserSignIn.setUsi_continueDay(reusi_continueDay);
                    reuserSignIn.setUer_act(uer_act);
                    reuserSignIn.setUsi_nextDay(usi_nextDay);
                    int result = cookiesDao.updateContinueSignIn(reuserSignIn);
                    if (result > 0) {
                            System.out.println("重新连续登录更新完成!");
                            System.out.println("重新更新连续登录的信息:" + reuserSignIn);
                            hm.put("userSignIn", reuserSignIn);
                            return hm;
                    }
                    System.out.println("重新修改数据库失败!");
                }
                //该用户中断了连续登录,这步操作和第一次操作一致
                int result = cookiesDao.updateNoContinueSignIn(userSignIn);
                if (result > 0) {
                    System.out.println("您已断了连续登录,正在为您重新计算签到天数!");
                    hm.put("userSignIn", userSignIn);
                    return hm;
                }
                System.out.println("未知错误!");
                hm.put("userSignIn", null);
                return hm;
            }
        }
        //连续签到方法
        System.out.println("cookies未知错误!");
        hm.put("userSignIn", null);
        return hm;
    }

    @Override
    public Object getSignInDay(HttpServletRequest req) {
        HashMap<String, String> hm = new HashMap<>();
        //获取用户帐号
        User logUser = (User) req.getSession().getAttribute("logUser");
        String uer_act = logUser.getUer_act();
        String usi_continueDay=cookiesDao.selectSignInDay(uer_act);
        hm.put("usi_continueDay", usi_continueDay);
        return hm;
    }

}
