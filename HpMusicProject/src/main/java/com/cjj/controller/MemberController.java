package com.cjj.controller;

import com.cjj.entity.MemberInfo;
import com.cjj.entity.UserOrder;
import com.cjj.entity.MemberPrice;
import com.cjj.service.InfMemberService;
import com.cjj.service.InfUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.text.ParseException;
import java.util.HashMap;

@Controller
@RequestMapping("/member")
public class MemberController {
    @Autowired
    private InfMemberService memberService;
    /**
     * 会员下单
     * @param memberOrder
     * @param req
     * @return
     */
    @RequestMapping("/memOrder")
    public @ResponseBody
    Object memOrder(UserOrder memberOrder, HttpServletRequest req) throws ParseException {
        HashMap<String, String> hm = new HashMap<>();
        hm= (HashMap<String, String>) memberService.memOrder(memberOrder,req);
        System.out.println("下单状态:"+hm);
        return hm;
    }
    /**
     * 订单支付后更新会员订单
     * @param updUserOrder
     * @param req
     * @return
     */
    @RequestMapping("/updMemOrder")
    public @ResponseBody
    Object updMemOrder(UserOrder updUserOrder,MemberInfo memberInfo,String payCode, HttpServletRequest req) throws ParseException {
        HashMap<String, String> hm = new HashMap<>();
        hm= (HashMap<String, String>) memberService.updMemOrder(updUserOrder,memberInfo,payCode,req);
        System.out.println("更新会员订单状态:"+hm);
        return hm;
    }

    /**
     * 支付会员订单
     * @param memberInfo
     * @return
     * @throws ParseException
     */
    @RequestMapping("/toUserPayVIP")
    public @ResponseBody
    Object toUserPayVIP(MemberInfo memberInfo,HttpServletRequest req) throws ParseException {
        HashMap<String, String> hm = new HashMap<>();
        hm= (HashMap<String, String>) memberService.toUserPayVIP(memberInfo,req);
        System.out.println("充值状态:"+hm);
        return hm;
    }
}
