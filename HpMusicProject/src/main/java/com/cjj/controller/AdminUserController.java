package com.cjj.controller;

import com.cjj.entity.AdminUser;
import com.cjj.entity.Page;
import com.cjj.entity.User;
import com.cjj.service.InfAdminUserService;

import com.cjj.utils.CheckCodeUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.ParseException;
import java.util.HashMap;

@Controller
@RequestMapping("/admin")
public class AdminUserController {
    @Autowired
    private InfAdminUserService adminUserService;

    /**
     * 管理员登录
     * @param adminUser
     * @param verifContent
     * @param req
     * @return
     * @throws IOException
     * @throws ParseException
     */
    @RequestMapping("/loginAdminUser")
    public @ResponseBody
    Object loginAdminUser(AdminUser adminUser, String verifContent, HttpServletRequest req) throws IOException, ParseException {
        HashMap<String, String> hm = new HashMap<>();
        hm= (HashMap<String, String>) adminUserService.loginAdminUser(adminUser, verifContent,req );
        System.out.println("管理员登录状态："+hm);
        return hm;
    }

    /**
     * 管理员退出
     * @param req
     * @return
     */
    @RequestMapping("/loginAdminOut")
    public String loginAdminOut(HttpServletRequest req) {
        req.getSession().invalidate();
        return "redirect:/page/admin/pages/admLogin.jsp";
    }
    /**
     * 刷新验证码
     * @param req
     * @param resp
     * @throws IOException
     */
    @RequestMapping("/CheckCode")
    public void verificationCode(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        CheckCodeUtil.getImage(req, resp);
    }
    /**
     * 根据分页查询所有用户
     * @param currPage
     * @param req
     * @return
     */
    @RequestMapping("/getAllUser")
    public @ResponseBody Object getAllUser(int currPage, HttpServletRequest req) {
        HashMap<String, Page<User>> hm = new HashMap<>();
        Page<User> page= adminUserService.getUserPage(currPage,req );
        System.out.println("用户页面："+page);
        hm.put("page",page);
        return hm;
    }

    /**
     * 删除用户
     * @param uer_act
     * @param req
     * @return
     */
    @RequestMapping("/deleteUser")
    public @ResponseBody Object deleteUser(String uer_act, HttpServletRequest req) {
        HashMap<String, String> hm = new HashMap<>();
        hm= (HashMap<String, String>) adminUserService.deleteUser(uer_act);
        System.out.println("删除的用户为："+uer_act);
        return hm;
    }

    /**
     * 获取所有管理员账号
     * @param req
     * @return
     */
    @RequestMapping("/getAllAdmUser")
    public @ResponseBody Object getAllAdmUser(HttpServletRequest req) {
        HashMap<String, String> hm = new HashMap<>();
        hm= (HashMap<String, String>) adminUserService.getAllAdmUser(req);
        System.out.println("获取的管理员用户的状态为："+hm);
        return hm;
    }
    /**
     * 删除管理员用户
     * @param admuer_act
     * @param req
     * @return
     */
    @RequestMapping("/deleteAdmUser")
    public @ResponseBody Object deleteAdmUser(String admuer_act, HttpServletRequest req) {
        HashMap<String, String> hm = new HashMap<>();
        hm= (HashMap<String, String>) adminUserService.deleteAdmUser(admuer_act);
        System.out.println("删除的管理员用户为："+admuer_act);
        return hm;
    }
}
