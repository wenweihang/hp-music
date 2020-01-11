package com.cjj.controller;

import com.cjj.entity.UserSignIn;
import com.cjj.service.InfCookiesService;
import com.cjj.utils.GetYMDUtil;
import com.cjj.utils.TimeFormatUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.text.ParseException;
import java.util.Date;
import java.util.HashMap;

@Controller
@RequestMapping("/cookies")
public class CookiesController {
    @Autowired
    private InfCookiesService cookiesService;

    /**
     * 用户签到
     * @param req
     * @param resp
     * @return
     * @throws ParseException
     */
    @RequestMapping("/signInDay")
    public @ResponseBody
    Object signInDay(HttpServletRequest req, HttpServletResponse resp) throws ParseException {
        HashMap<String, UserSignIn> hm = new HashMap<>();
        hm= (HashMap<String, UserSignIn>) cookiesService.judgeContinueLog(req,resp);
        System.out.println("用户签到信息:"+hm);
        return hm;
    }

    /**
     * 获取签到天数
     * @param req
     * @return
     * @throws ParseException
     */
    @RequestMapping("/getSignInDay")
    public @ResponseBody
    Object getSignInDay(HttpServletRequest req) throws ParseException {
        HashMap<String, String> hm = new HashMap<>();
        hm= (HashMap<String, String>) cookiesService.getSignInDay(req);
        System.out.println("用户签到天数为:"+hm);
        return hm;
    }
}
