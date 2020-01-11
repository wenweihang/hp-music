package com.cjj.controller;

import com.cjj.entity.MemberInfo;
import com.cjj.entity.Page;
import com.cjj.service.InfAdminMemberInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;

@Controller
@RequestMapping("/adminMemberInfo")
public class AdminMemberInfoController {
    @Autowired
    private InfAdminMemberInfoService adminMemberInfoService;

    /**
     * 根据分页查询所有用户
     *
     * @param currPage
     * @param req
     * @return
     */
    @RequestMapping("/selectAllMemberInfo")
    public @ResponseBody
    Object selectAllMemberInfo(int currPage, HttpServletRequest req) {
        HashMap<String, Page<MemberInfo>> hm = new HashMap<>();
        Page<MemberInfo> page = adminMemberInfoService.getMemberInfoPage(currPage, req);
        System.out.println("会员信息页面：" + page);
        hm.put("page", page);
        return hm;
    }
}
