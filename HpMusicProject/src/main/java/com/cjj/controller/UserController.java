package com.cjj.controller;

import com.cjj.entity.LogHistory;
import com.cjj.entity.Page;
import com.cjj.entity.User;
import com.cjj.entity.UserOrder;
import com.cjj.service.InfUserService;
import com.cjj.utils.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.ParseException;
import java.util.Date;
import java.util.HashMap;

@Controller
@RequestMapping("/user")
public class UserController {
    @Autowired
    private InfUserService service;
    /**
     * 用户注册
     *
     * @param uer_act
     * @param uer_pwd
     * @param verifContent
     * @param req
     * @return
     */
    @RequestMapping("/registerUser")
    public @ResponseBody
    Object registerUser(String uer_act, String uer_pwd, String verifContent, HttpServletRequest req) {
        HashMap<String, String> hm = new HashMap<>();
        //System.out.println(uer_act);
        String account = service.isExist(uer_act);
        if (account != null) {
            hm.put("stateCode", "0");
            System.out.println("account is exist!");
            return hm;
        } else {
            String vContent = (String) req.getSession().getAttribute("vContent");
            if (vContent.equalsIgnoreCase(verifContent)) {
                hm.put("stateCode", "1");
                //设置用户信息默认值
                User regUser = new User();
                regUser.setUer_act(uer_act);
                regUser.setUer_pwd(uer_pwd);
                regUser.setUer_signature("我还没想好写点什么...");
                regUser.setUer_name(uer_act);
                regUser.setUer_sex("保密");
                regUser.setUer_birthday("2019年1月1日");
                regUser.setUer_constellation("摩羯座");
                regUser.setUer_create(TimeFormatUtil.getTimeFormat(new Date()));
                regUser.setUer_address("北京东城区");
                regUser.setUer_headImg("http://localhost:774/uploads/defaultUserImg.png");
                System.out.println("注册时的用户信息:" + regUser);
                service.addUser(regUser);
                return hm;
            } else {
                hm.put("stateCode", "codeError");
                return hm;
            }
        }
    }

    /**
     * 用户登录
     *
     * @param uer_act
     * @param uer_pwd
     * @param verifContent
     * @param req
     * @param resp
     * @return
     * @throws IOException
     */
    @RequestMapping("/loginUser")
    public @ResponseBody
    Object loginUser(String uer_act, String uer_pwd, String verifContent, HttpServletRequest req, HttpServletResponse resp) throws IOException, ParseException {
        HashMap<String, String> hm = new HashMap<>();
        hm= (HashMap<String, String>) service.loginUser(uer_act, uer_pwd, verifContent,req ,resp );
        System.out.println("用户登录状态："+hm);
        return hm;
    }

    /**
     * 用户退出
     * @param req
     * @return
     */
    @RequestMapping("/loginOut")
    public String loginOut(HttpServletRequest req) {
        req.getSession().invalidate();
        return "redirect:/page/main.jsp";
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
     * 上传更新用户头像
     *
     * @param req
     * @param uer_headImg
     * @return
     * @throws IOException
     */
    @RequestMapping("/uploadHeadImg")
    public @ResponseBody
    Object uploadHeadImg(HttpServletRequest req, @RequestParam("uer_headImg") MultipartFile uer_headImg) throws IOException {
        HashMap<String, String> hm = new HashMap<>();
        hm = (HashMap<String, String>) service.uploadHeadImg(req, uer_headImg);
        System.out.println("stateUpHeadImg:" + hm);
        return hm;
    }

    /**
     * 更新用户个人信息
     *
     * @param updUser
     * @param req
     * @return
     */
    @RequestMapping("/updateUser")
    public @ResponseBody
    Object updUser(User updUser, HttpServletRequest req) {
        HashMap<String, String> hm = new HashMap<>();
        hm = (HashMap<String, String>) service.updateUser(updUser, req);
        System.out.println("stateUpdate:" + hm);
        return hm;
    }

    /**
     * 获取邮箱验证码
     *
     * @param uer_emailAddress
     * @return
     */
    @RequestMapping("/emailCheckCode")
    public @ResponseBody
    Object emailCheckCode(String uer_emailAddress) {
        HashMap<String, String> hm = new HashMap<>();
        hm = (HashMap<String, String>) service.sendEmail(uer_emailAddress);
        System.out.println("changePwd:" + hm);
        return hm;
    }

    /**
     * 修改用户密码
     *
     * @param emailCode
     * @param uer_pwd
     * @param req
     * @return
     */
    @RequestMapping("/changePwdByEm")
    public @ResponseBody
    Object changePwdByEm(String emailCode, String uer_pwd, HttpServletRequest req) {
        HashMap<String, String> hm = new HashMap<>();
        System.out.println("emailCode:" + emailCode);
        System.out.println("uer_pwd:" + uer_pwd);
        hm = (HashMap<String, String>) service.changePwdByEmail(emailCode, uer_pwd, req);
        System.out.println("stateChgPwdByEm:" + hm);
        return hm;
    }

    /**
     * 获取绑定邮件验证码
     *
     * @param uer_emailAddress
     * @param req
     * @return
     */
    @RequestMapping("/emailBindCheckCode")
    public @ResponseBody
    Object emailBindCheckCode(String uer_emailAddress, HttpServletRequest req) {
        HashMap<String, String> hm = new HashMap<>();
        hm = (HashMap<String, String>) service.sendEmailBind(uer_emailAddress, req);
        System.out.println("emBindCode:" + hm);
        return hm;
    }

    /**
     * 绑定邮箱
     *
     * @param emailBindCode
     * @param uer_emailAddress
     * @param req
     * @return
     */
    @RequestMapping("/emailBind")
    public @ResponseBody
    Object emailBind(String emailBindCode, String uer_emailAddress, HttpServletRequest req) {
        HashMap<String, String> hm = new HashMap<>();
        System.out.println("emailBindCode:" + emailBindCode);
        hm = (HashMap<String, String>) service.emailBind(emailBindCode, uer_emailAddress, req);
        if (hm.get("stateEmBind") == "1") {
            req.getSession().removeAttribute("stateEmUnBid");
            req.getSession().removeAttribute("emUnBindUser");
        }
        System.out.println("stateEmailBind:" + hm);
        return hm;
    }

    /**
     * 获取解绑邮件验证码
     *
     * @param uer_emailAddress
     * @return
     */
    @RequestMapping("/emailUnBindCheckCode")
    public @ResponseBody
    Object emailUnBindCheckCode(String uer_emailAddress) {
        HashMap<String, String> hm = new HashMap<>();
        hm = (HashMap<String, String>) service.sendEmailUnBind(uer_emailAddress);
        System.out.println("emUnBindCode:" + hm);
        return hm;
    }

    /**
     * 解绑邮箱
     *
     * @param emailUnBindCode
     * @param req
     * @return
     */
    @RequestMapping("/emailUnBind")
    public @ResponseBody
    Object emailUnBind(String emailUnBindCode, HttpServletRequest req) {
        HashMap<String, String> hm = new HashMap<>();
        System.out.println("emailUnBindCode:" + emailUnBindCode);
        hm = (HashMap<String, String>) service.emailUnBind(emailUnBindCode, req);
        if (hm.get("stateEmUnBind") == "1") {
            req.getSession().removeAttribute("stateEmBid");
            req.getSession().removeAttribute("emBindUser");
        }
        System.out.println("stateEmailUnBind:" + hm);
        return hm;
    }

    /**
     * 旧密码修改密码
     *
     * @param uer_oldPwd
     * @param uer_pwd
     * @param req
     * @return
     */
    @RequestMapping("/changePwdByOld")
    public @ResponseBody
    Object changePwdByOld(String uer_oldPwd, String uer_pwd, HttpServletRequest req) {
        HashMap<String, String> hm = new HashMap<>();
        hm = (HashMap<String, String>) service.changePwdByOld(uer_oldPwd, uer_pwd, req);
        System.out.println("stateChgPwdByOld:" + hm);
        return hm;
    }

    /**
     * 获取历史记录分页
     * @param currPage
     * @param req
     * @return
     */
    @RequestMapping("/paging")
    public @ResponseBody
    Object paging(int currPage, HttpServletRequest req) {
        HashMap<String, Page<LogHistory>> hm = new HashMap<>();
        Page<LogHistory> page=service.getHistoryPages(currPage,req);
//        req.getSession().setAttribute("page",page);
        System.out.println("page:"+page);
        hm.put("page",page);
        return hm;
    }
    @RequestMapping("/orderPaging")
    public @ResponseBody
    Object orderPaging(int currPage, HttpServletRequest req) {
        HashMap<String, Page<UserOrder>> hm = new HashMap<>();
        Page<UserOrder> page=service.getOrderPages(currPage,req);
//        req.getSession().setAttribute("page",page);
        System.out.println("orderpage:"+page);
        hm.put("page",page);
        return hm;
    }
}
