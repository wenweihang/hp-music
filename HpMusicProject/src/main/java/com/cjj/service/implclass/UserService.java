package com.cjj.service.implclass;

import com.cjj.dao.InfMemberDao;
import com.cjj.dao.InfUserDao;
import com.cjj.entity.*;
import com.cjj.service.InfUserService;
import com.cjj.utils.*;
import com.sun.jersey.api.client.Client;
import com.sun.jersey.api.client.WebResource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MaxUploadSizeExceededException;
import org.springframework.web.multipart.MultipartFile;
import redis.clients.jedis.Jedis;
import redis.clients.jedis.exceptions.JedisConnectionException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Time;
import java.text.ParseException;
import java.util.*;

@Service
public class UserService implements InfUserService {
    @Autowired
    private InfUserDao userDao;
    @Autowired
    private InfMemberDao memberDao;
    @Autowired
    private RedisTemplate redisTemplate;

    @Override
    public String isExist(String uer_act) {
        return userDao.findByAct(uer_act);
    }

    @Override
    public void addUser(User regUser) {
        userDao.addUser(regUser);
    }

    @Override
    public Object loginUser(String uer_act, String uer_pwd, String verifContent, HttpServletRequest req, HttpServletResponse resp) throws IOException, ParseException {
        HashMap<String, String> hm = new HashMap<>();
        //判断是否存在该用户
        String account = isExist(uer_act);
        System.out.println("uer_act=" + account);
        if (account == null) {
            hm.put("stateCode", "null");
//            System.out.println("account is not exist!");
            return hm;
        } else {
            //验证用户登录的账号和密码
            User logUser = checkUser(uer_act, uer_pwd);
            if (logUser == null) {
                hm.put("stateCode", "0");
                return hm;
            } else {
                // CheckCodeUtil.getImage(req,resp);  这句是毒瘤
                String vContent = (String) req.getSession().getAttribute("vContent");
                if (vContent.equalsIgnoreCase(verifContent)) {
                    String birthday = logUser.getUer_birthday();
                    System.out.println("生日:" + birthday);
                    if (birthday == null) {
                        hm.put("stateCode", "404");
                        return hm;
                    }
                    //通过数据库中的生日获取年月日各个值
                    String year = GetYMDUtil.getYear(birthday);
                    String mouth = GetYMDUtil.getMouth(birthday);
                    String day = GetYMDUtil.getDay(birthday);
                    logUser.setYear(year);
                    logUser.setMouth(mouth);
                    logUser.setDay(day);

                    String address = logUser.getUer_address();
                    if (address == null) {
                        hm.put("stateCode", "404");
                        return hm;
                    }
                    //通过数据库中的地址获取省市区县各个值
                    String shen = AddressUtil.getShen(address);
                    String shi = AddressUtil.getShi(address);
                    String quxian = AddressUtil.getQuxian(address);
                    logUser.setShen(shen);
                    logUser.setShi(shi);
                    logUser.setQuxian(quxian);
                    //封装用户登录记录信息
                    LogHistory logHistory = new LogHistory();
                    String ulh_ip = IpUtil.getIpAddress();
                    String ulh_address = AddressUtil.getAddressByIP(ulh_ip);
                    String ulh_time = TimeFormatUtil.getTimeFormat2(new Date());
                    logHistory.setUer_act(uer_act);
                    logHistory.setUlh_ip(ulh_ip);
                    logHistory.setUlh_address(ulh_address);
                    logHistory.setUlh_time(ulh_time);
                    //判断用户是否为会员
                    List<MemberInfo> memberInfoList = memberDao.findByAct(uer_act);
                    System.out.println(memberInfoList+"大小="+memberInfoList.size());
                    if (memberInfoList.size() != 0) {
                        //该用户充值过会员
                        //取出最后一条数据的信息
                        String end_timeDao = memberInfoList.get(memberInfoList.size()-1).getEnd_time();
                        long lend_timeDao = TimeFormatUtil.getDate(end_timeDao).getTime();
                        long ltoDay = new Date().getTime();
                        //判断如果到期时间大于今天,就说明是会员
                        if (lend_timeDao > ltoDay) {
                            req.getSession().setAttribute("end_timeDao",end_timeDao);
                            req.getSession().setAttribute("memberInfoList",memberInfoList );
                            System.out.println("该用户的会员信息为:"+memberInfoList);
                        }
                    }
                    //获取用户历史记录
                    List<LogHistory> historyList = selectAllHistory(uer_act);
                    System.out.println("该用户的历史记录为："+historyList.size());
                    if (historyList.size() == 0) {
                        System.out.println(uer_act+"用户第一次登录");
                        addLogHistory(logHistory); //添加记录
                    } else {
                        for (LogHistory lh : historyList) {
                            //获取最后一条记录
                            if (lh == historyList.get(historyList.size() - 1)) {
                                String ulh_timeDao = lh.getUlh_time();
                                System.out.println("最后登录时间为:" + ulh_timeDao);
                                boolean b = TimeFormatUtil.countNewDay(ulh_timeDao);
                                if (b == true) {
                                    System.out.println("又是新的一天咯!");
                                    addLogHistory(logHistory); //添加记录
                                }
                            }
                        }
                    }
                    //将用户信息存入session当中
                    req.getSession().setAttribute("logUser", logUser);
//                    System.out.println("登录的用户订单信息:" + req.getSession().getAttribute("orderList"));
                    System.out.println("登录的用户信息:" + req.getSession().getAttribute("logUser"));
                    hm.put("stateCode", "1");
                    return hm;
                } else {
                    hm.put("stateCode", "codeError");
                    return hm;
                }
            }
        }
    }

    @Override
    public User checkUser(String uer_act, String uer_pwd) {
        return userDao.findUser(uer_act, uer_pwd);
    }

    @Override
    public Object uploadHeadImg(HttpServletRequest req, MultipartFile uer_headImg) throws IOException {
        HashMap<String, String> hm = new HashMap<>();
        String msg = null;
        //上传头像
        if (uer_headImg != null || !uer_headImg.isEmpty()) {
            try {
                String path = "http://localhost:774/uploads/";
                String filename = uer_headImg.getOriginalFilename();
                System.out.println("文件名:" + filename);
                System.out.println("文件大小:" + uer_headImg.getBytes());
                String sessionPath = (String) req.getSession().getAttribute("serverPath");
                if (sessionPath != null) {
                    if (sessionPath.contains(filename)) {
                        System.out.println("未更改状态!");
                        hm.put("stateUpHeadImg", "0");
                        return hm;
                    }
                }
                if (filename == "") {
                    System.out.println("未更改状态!");
                    hm.put("stateUpHeadImg", "0");
                    return hm;
                }
                String uuid = UUID.randomUUID().toString().replace("-", "");
                filename = uuid + "_" + filename;
                //创建客户端对象
                Client client = Client.create();
                //和服务器连接
                WebResource webResource = client.resource(path + filename);
                webResource.put(uer_headImg.getBytes());
                //获取服务器图片地址
                String serverPath = path + filename;
                //将地址存入数据库
                User us = (User) req.getSession().getAttribute("logUser");
                User updImgUser = new User();
                updImgUser.setUer_id(us.getUer_id());
                updImgUser.setUer_headImg(serverPath);
                System.out.println("更新头像:" + updImgUser);
                userDao.updateImgUser(updImgUser);
                req.getSession().setAttribute("serverPath", serverPath);
                msg = "上传成功";
                req.getSession().setAttribute("stateUpHeImg", msg);
                hm.put("stateUpHeadImg", "1");
                return hm;
            } catch (MaxUploadSizeExceededException e) {
                hm.put("stateUpHeadImg", "oversize");
                return hm;
            }
        }
        req.getSession().setAttribute("stateUpHeImg", msg);
        hm.put("stateUpHeadImg", "0");
        return hm;
    }

    @Override
    public Object updateUser(User updUser, HttpServletRequest req) {
        HashMap<String, String> hm = new HashMap<>();
        //获取存在session中的id
        User us = (User) req.getSession().getAttribute("logUser");
        updUser.setUer_id(us.getUer_id());
        //获取传过来的年月日各个值
        String year = updUser.getYear();
        String mouth = updUser.getMouth();
        String day = updUser.getDay();
        String birthday = year + "年" + mouth + "月" + day + "日";
        updUser.setUer_birthday(birthday);
        //匹配对应的星座
        String consl = ConstellationUtil.getConsl(birthday);
        updUser.setUer_constellation(consl);
        //获取传过来的省市区县各个值
        String shen = updUser.getShen();
        String shi = updUser.getShi();
        String quxian = updUser.getQuxian();
        if (shi == null) {
            shi = "";
            quxian = "";
        }
        if (quxian == null) {
            quxian = "";
        }
        String address = shen + shi + quxian;
        updUser.setUer_address(address);

        System.out.println("更新用户的信息:" + updUser);
        int result = userDao.updateUser(updUser);
        String state = null;
        if (result > 0) {
            hm.put("stateUpdate", "1");
            state = "修改成功";
            req.getSession().setAttribute("updUser", updUser);
            req.getSession().setAttribute("stateUpd", state);
            return hm;
        }
        hm.put("stateUpdate", "0");
        req.getSession().setAttribute("stateUpd", state);
        return hm;
    }

    @Override
    public Object sendEmail(String uer_emailAddress) {
        HashMap<String, String> hm = new HashMap<>();
        String uer_name = userDao.findByEmailAddress(uer_emailAddress);
        Random r = new Random();
        //获取4位随机码
        int ucode = r.nextInt(9999);
        if (ucode < 1000) {
            ucode = ucode + 1000;
        }
        //判断用户是否存在
        if (uer_name != null) {
            try {
                Jedis jedis = JedisUtil.getJedis();
                String uto = uer_emailAddress;
                String uscode = String.valueOf(ucode);
                String utext = "您好 " + uer_name + "!<br><br>" +
                        "您正在通过qiaole黑怕修改您的密码,您的验证码是:" +
                        "<span style='color:blue'>" + uscode + "</span>" + ",如果不是本人操作,请忽略。" +
                        "<br><br>" + "感谢," + "<br>" + "来自Qiaole黑怕团队";
                System.out.println("verificationCode:" + uscode);
                String utitle = "[Qiaole黑怕]用户修改密码";
                boolean b = MailUtil.sendMail(uto, utext, utitle);
                if (b == false) {
                    System.out.println("Mail连接失败!检查是否联网");
                    hm.put("stateSendEm", "404");
                    return hm;
                }
                //将验证码存入redis
                jedis.setex("uscode", 60, uscode);
                hm.put("stateSendEm", "1");
                JedisUtil.close(jedis);
                return hm;
            } catch (JedisConnectionException e) {
                hm.put("stateSendEm", "404");
                System.out.println("redis连接失败!");
                return hm;
            }
        }
        hm.put("stateSendEm", "0");
        return hm;
    }

    @Override
    public Object changePwdByEmail(String emailCode, String uer_pwd, HttpServletRequest req) {
        HashMap<String, String> hm = new HashMap<>();
        try {
            Jedis jedis = JedisUtil.getJedis();
            String uscode = jedis.get("uscode");
            System.out.println("jedisCode:" + uscode);

            if (uscode.equals(emailCode)) {
                //获取存在session中的id
                User us = (User) req.getSession().getAttribute("logUser");
                User chgPwdUser = new User();
                chgPwdUser.setUer_pwd(uer_pwd);
                chgPwdUser.setUer_id(us.getUer_id());
                System.out.println("chgPwdUser:" + chgPwdUser);
                int result = userDao.changePwd(chgPwdUser);
                String state = null;
                if (result > 0) {
                    hm.put("stateChgPwd", "1");
                    req.getSession().setAttribute("logUser", state);
                    System.out.println("修改成功");
                    return hm;
                }
                state = "修改密码失败";
                System.out.println("修改失败");
                return hm;
            }
        } catch (JedisConnectionException e) {
            hm.put("stateChgPwd", "404");
            System.out.println("redis连接失败!");
            return hm;
        }
        hm.put("stateChgPwd", "0");
        return hm;
    }

    @Override
    public Object sendEmailBind(String uer_emailAddress, HttpServletRequest req) {
        HashMap<String, String> hm = new HashMap<>();
        String uer_name = userDao.findByEmailAddress(uer_emailAddress);
        Random r = new Random();
        int bcode = r.nextInt(999999);
        if (bcode < 100000) {
            bcode = bcode + 100000;
        }
        //判断该邮箱是否被绑定
        if (uer_name == null) {
            try {
                Jedis jedis = JedisUtil.getJedis();
                //获取6位随机码
                User logUser = (User) req.getSession().getAttribute("logUser");
                String bto = uer_emailAddress;
                String bscode = String.valueOf(bcode);
                String btext = "您好 " + logUser.getUer_name() + "!<br><br>" +
                        "您正在通过qiaole黑怕绑定您的邮箱,您的验证码是:" +
                        "<span style='color:blue'>" + bscode + "</span>" + ",如果不是本人操作,请忽略。" +
                        "<br><br>" + "感谢," + "<br>" + "来自Qiaole黑怕团队";
                System.out.println("verificationCode:" + bscode);
                String btitle = "[Qiaole黑怕]用户绑定";
                boolean b = MailUtil.sendMail(bto, btext, btitle);
                if (b == false) {
                    System.out.println("Mail连接失败!检查是否联网");
                    hm.put("stateSendEm", "404");
                    return hm;
                }
                //将验证码存入redis
                jedis.setex("bscode", 60, bscode);
                hm.put("stateSendEm", "1");
                return hm;
            } catch (JedisConnectionException e) {
                hm.put("stateChgPwd", "404");
                System.out.println("redis连接失败!");
                return hm;
            }
        }
        hm.put("stateSendEm", "0");
        return hm;
    }

    @Override
    public Object emailBind(String emailBindCode, String uer_emailAddress, HttpServletRequest req) {
        HashMap<String, String> hm = new HashMap<>();
        try {
            Jedis jedis = JedisUtil.getJedis();
            String bscode = jedis.get("bscode");
            System.out.println("jedisCode:" + bscode);
            if (bscode.equals(emailBindCode)) {
                //获取存在session中的id
                User us = (User) req.getSession().getAttribute("logUser");
                User emBindUser = new User();
                emBindUser.setUer_emailAddress(uer_emailAddress);
                emBindUser.setUer_id(us.getUer_id());
                System.out.println("emBindUser:" + emBindUser);
                int result = userDao.emailBind(emBindUser);
                String state = null;
                if (result > 0) {
                    hm.put("stateEmBind", "1");
                    state = "绑定成功";
                    req.getSession().setAttribute("emBindUser", emBindUser);
                    req.getSession().setAttribute("stateEmBid", state);
                    return hm;
                }
                System.out.println("绑定失败");
                req.getSession().setAttribute("stateEmBid", state);
                return hm;
            }
        } catch (JedisConnectionException e) {
            hm.put("stateChgPwd", "404");
            System.out.println("redis连接失败!");
            return hm;
        }
        hm.put("stateEmBind", "0");
        return hm;
    }

    @Override
    public Object sendEmailUnBind(String uer_emailAddress) {
        HashMap<String, String> hm = new HashMap<>();
        String uer_name = userDao.findByEmailAddress(uer_emailAddress);
        Random r = new Random();
        int bcode = r.nextInt(999999);
        if (bcode < 100000) {
            bcode = bcode + 100000;
        }
        //判断该
        if (uer_name != null) {
            try {
                Jedis jedis = JedisUtil.getJedis();
                //获取6位随机码
                String ubto = uer_emailAddress;
                String ubscode = String.valueOf(bcode);
                String ubtext = "您好 " + uer_name + "!<br><br>" +
                        "您正在通过qiaole黑怕解绑您的邮箱,您的验证码是:" +
                        "<span style='color:blue'>" + ubscode + "</span>" + ",如果不是本人操作,请忽略。" +
                        "<br><br>" + "感谢," + "<br>" + "来自Qiaole黑怕团队";
                System.out.println("verificationCode:" + ubscode);
                String btitle = "[Qiaole黑怕]用户解绑";
                boolean b = MailUtil.sendMail(ubto, ubtext, btitle);
                if (b == false) {
                    System.out.println("Mail连接失败!检查是否联网");
                    hm.put("stateSendEm", "404");
                    return hm;
                }
                //将验证码存入redis
                jedis.setex("ubscode", 60, ubscode);
                hm.put("stateSendEm", "1");
                return hm;
            } catch (JedisConnectionException e) {
                hm.put("stateChgPwd", "404");
                System.out.println("redis连接失败!");
                return hm;
            }
        }
        hm.put("stateSendEm", "0");
        return hm;
    }

    @Override
    public Object emailUnBind(String emailUnBindCode, HttpServletRequest req) {
        HashMap<String, String> hm = new HashMap<>();
        try {
            Jedis jedis = JedisUtil.getJedis();
            String ubscode = jedis.get("ubscode");
            System.out.println("jedisCode:" + ubscode);
            if (ubscode.equals(emailUnBindCode)) {
                String uer_emailAddress = null;
                //获取存在session中的id
                User us = (User) req.getSession().getAttribute("logUser");
                User emUnBindUser = new User();
                emUnBindUser.setUer_emailAddress(uer_emailAddress);
                emUnBindUser.setUer_id(us.getUer_id());
                System.out.println("emUnBindUser:" + emUnBindUser);
                int result = userDao.emailBind(emUnBindUser);
                String state = null;
                if (result > 0) {
                    hm.put("stateEmUnBind", "1");
                    state = "解绑成功";
                    req.getSession().setAttribute("emUnBindUser", emUnBindUser);
                    req.getSession().setAttribute("stateEmUnBid", state);
                    return hm;
                }
                System.out.println("解绑失败");
                req.getSession().setAttribute("stateEmUnBid", state);
                return hm;
            }
        } catch (JedisConnectionException e) {
            hm.put("stateChgPwd", "404");
            System.out.println("redis连接失败!");
            return hm;
        }
        hm.put("stateEmUnBind", "0");
        return hm;
    }

    @Override
    public Object changePwdByOld(String uer_oldPwd, String uer_pwd, HttpServletRequest req) {
        HashMap<String, String> hm = new HashMap<>();
        User us = (User) req.getSession().getAttribute("logUser");
        System.out.println("logUserPwd:" + us.getUer_pwd());
        System.out.println("uer_oldPwd:" + uer_oldPwd);
        //验证旧密码和登录密码是否相同
        if (us.getUer_pwd().equals(uer_oldPwd)) {
            if (uer_oldPwd.equals(uer_pwd)) {
                hm.put("stateChgPwd", "re");
                return hm;
            }
            User chgPwdUser = new User();
            chgPwdUser.setUer_pwd(uer_pwd);
            chgPwdUser.setUer_id(us.getUer_id());
            System.out.println("chgPwdByOld User:" + chgPwdUser);
            int result = userDao.changePwd(chgPwdUser);
            String state = null;
            if (result > 0) {
                hm.put("stateChgPwd", "1");
                req.getSession().setAttribute("logUser", state);
                System.out.println("修改成功");
                return hm;
            }
            state = "修改密码失败";
            System.out.println("修改失败");
            return hm;
        }
        hm.put("stateChgPwd", "0");
        return hm;
    }

    @Override
    public void addLogHistory(LogHistory logHistory) {
        userDao.addLogHistory(logHistory);
    }

    @Override
    public List<LogHistory> selectAllHistory(String uer_act) {
        return userDao.selectAllHistoryByAct(uer_act);
    }

    @Override
    public Page<LogHistory> getHistoryPages(int currPage, HttpServletRequest req) {
        System.out.println("当前页数:" + currPage);
        Page<LogHistory> page = new Page<>();

        //封装当前页数
        page.setCurrPage(currPage);
        //每页显示的行数
        int pageRows = 5;
        page.setPageRows(pageRows);
        //封装用户帐号
        User logUser = (User) req.getSession().getAttribute("logUser");
        String uer_act = logUser.getUer_act();
        page.setUer_act(uer_act);
        //封装总记录数
        int sumCount = userDao.selectSumHisory(uer_act);
        page.setSumCount(sumCount);
        System.out.println("一共" + sumCount + "条历史记录");
        //封装总页数
        double sc = sumCount; //如果整数除整数,直接去余
        Double num = Math.ceil(sc / pageRows);//向上取整
        page.setSumPage(num.intValue());
        System.out.println("一共" + page.getSumPage() + "页");
        //封装每页显示的数据
        int index = (currPage - 1) * pageRows;
        page.setIndex(index);
        List<LogHistory> lists = userDao.selectHistoryPages(page);
        page.setLists(lists);
        return page;
    }

    @Override
    public Page<UserOrder> getOrderPages(int currPage, HttpServletRequest req) {
        Page<UserOrder> page = new Page<>();
        //封装当前页
        page.setCurrPage(currPage);
        //封装每页显示的行数
        int pageRows = 7;
        page.setPageRows(pageRows);
        //获取封装用户订单总数
        User logUser = (User) req.getSession().getAttribute("logUser");
        String uer_act = logUser.getUer_act();
        page.setUer_act(uer_act);
        int sumCount = userDao.selectSumOrder(uer_act);
        page.setSumCount(sumCount);
        System.out.println("一共" + sumCount + "条订单");
        //封装页面总数
        double num = sumCount;
        Double dNum = Math.ceil(num / pageRows);
        page.setSumPage(dNum.intValue());
        System.out.println("订单一共" + page.getSumPage() + "页");
        //封装每页显示的数据
        int index = (currPage - 1) * pageRows;
        page.setIndex(index);
        List<UserOrder> lists = userDao.selectOrderPages(page);
        page.setLists(lists);
        return page;
    }
}
