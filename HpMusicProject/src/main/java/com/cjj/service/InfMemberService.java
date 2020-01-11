package com.cjj.service;

import com.cjj.entity.MemberInfo;
import com.cjj.entity.UserOrder;
import com.cjj.entity.MemberPrice;

import javax.servlet.http.HttpServletRequest;
import java.text.ParseException;
import java.util.List;

public interface InfMemberService {
    /**
     * 查看该用户是否存在订单
     * @param uer_act
     * @return
     */
    public List<UserOrder> isExistMemOrder(String uer_act);

    /**
     * 通过单号查询用户订单信息
     * @param uor_orderNumber
     * @return
     */
    public UserOrder findMemOrderByNumber(String uor_orderNumber);
    /**
     * 会员下单
     * @param memberOrder
     * @param req
     * @return
     * @throws ParseException
     */
    public Object memOrder(UserOrder memberOrder, HttpServletRequest req) throws ParseException;

    /**
     * 用户付款完成
     * @param userOrder
     * @param memberInfo
     * @param payCode
     * @param req
     * @return
     * @throws ParseException
     */
    public Object updMemOrder(UserOrder userOrder,MemberInfo memberInfo,String payCode,HttpServletRequest req)throws ParseException;
    /**
     * 该用户是否存在VIP
     * @param uer_act
     * @return
     */
    public List<MemberInfo> isExistVIP(String uer_act);

    /**
     * 判断用户是否存在会员等
     * @param memberInfo
     * @param req
     * @return
     * @throws ParseException
     */
    public Object toUserPayVIP(MemberInfo memberInfo,HttpServletRequest req) throws ParseException;

}
