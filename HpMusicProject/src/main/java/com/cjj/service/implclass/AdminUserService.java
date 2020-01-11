package com.cjj.service.implclass;

import com.cjj.dao.InfAdminUserDao;
import com.cjj.entity.AdminUser;
import com.cjj.entity.Page;
import com.cjj.entity.User;
import com.cjj.service.InfAdminUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.ParseException;
import java.util.HashMap;
import java.util.List;

@Service
public class AdminUserService implements InfAdminUserService {
    @Autowired
    private InfAdminUserDao adminUserDao;

    @Override
    public int isExist(String admuer_act) {
        return adminUserDao.findByAct(admuer_act);
    }

    @Override
    public Object loginAdminUser(AdminUser adminUser, String verifContent, HttpServletRequest req) throws IOException, ParseException {
        HashMap<String, String> hm = new HashMap<>();
        String admuer_act = adminUser.getAdmuer_act();
        String admuer_pwd=adminUser.getAdmuer_pwd();
        System.out.println(admuer_act+"----"+admuer_pwd);
        int result = isExist(admuer_act);
        System.out.println("查询该用户是否存在的结果:" + result);
        if (result == 0) {
            hm.put("stateCode", "null");
            System.out.println("account is not exist!");
            return hm;
        } else {
            AdminUser logAdminUser= adminUserDao.findAdminUser(admuer_act, admuer_pwd);
            if (logAdminUser == null) {
                System.out.println("管理员帐号或密码错误!");
                hm.put("stateCode", "0");
                return hm;
            } else {
                // CheckCodeUtil.getImage(req,resp);  这句是毒瘤
                String vContent = (String) req.getSession().getAttribute("vContent");
                if (vContent.equalsIgnoreCase(verifContent)) {
                    req.getSession().setAttribute("logAdminUser", logAdminUser);
                    System.out.println("登录的管理员信息:" + req.getSession().getAttribute("logAdminUser"));
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
    public Page<User> getUserPage(int currPage, HttpServletRequest req) {
        Page<User> page = new Page<>();
        //封装当前页
        page.setCurrPage(currPage);
        //封装每页显示的行数
        int pageRows = 5;
        page.setPageRows(pageRows);
        //获取订单总数
        int sumCount = adminUserDao.selectSumUser();
        page.setSumCount(sumCount);
        System.out.println("一共" + sumCount + "个用户");
        //封装页面总数
        double num = sumCount;
        Double dNum = Math.ceil(num / pageRows);
        page.setSumPage(dNum.intValue());
        System.out.println("用户一共" + page.getSumPage() + "页");
        //封装每页显示的数据
        int index = (currPage - 1) * pageRows;
        page.setIndex(index);
        List<User> lists = adminUserDao.selectAllUser(page);
        page.setLists(lists);
        return page;
    }

    @Override
    public Object deleteUser(String uer_act) {
        HashMap<String, String> hm = new HashMap<>();
        adminUserDao.deleteUser(uer_act);
        hm.put("stateDel","1" );
        return hm;
    }

    @Override
    public Object getAllAdmUser(HttpServletRequest req) {
        HashMap<String, String> hm = new HashMap<>();
        List<AdminUser> adminUserList=adminUserDao.selectAllAdmUser();
        System.out.println("管理员账号信息为："+adminUserList);
        req.getSession().setAttribute("adminUserList", adminUserList);
        hm.put("stateGetAllAdmUser","1" );
        return hm;
    }

    @Override
    public Object deleteAdmUser(String admuer_act) {
        HashMap<String, String> hm = new HashMap<>();
        int result=adminUserDao.deleteAdmUser(admuer_act);
        if(result>0){
            System.out.println("管理员删除成功！");
            hm.put("stateDel","1" );
            return hm;
        }
        System.out.println("管理员删除失败！");
        hm.put("stateDel","0" );
        return hm;
    }
}
