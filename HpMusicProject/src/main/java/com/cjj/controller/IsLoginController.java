package com.cjj.controller;

import com.cjj.entity.AdminUser;
import com.cjj.entity.User;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;

@Controller
public class IsLoginController {
    @RequestMapping("/isLogin")
    public @ResponseBody Object isLogin(HttpServletRequest req) {
        HashMap<String,String> hm=new HashMap<>();
        AdminUser adminUser= (AdminUser) req.getSession().getAttribute("logAdminUser");
        if(adminUser==null){
            System.out.println("管理员session不存在");
            hm.put("stateIsLogin", "0");
            return hm;
        }
        System.out.println("管理员session存在");
        hm.put("stateIsLogin", "1");
        return hm;
    }
}
