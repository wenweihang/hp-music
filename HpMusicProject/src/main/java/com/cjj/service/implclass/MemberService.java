package com.cjj.service.implclass;

import com.cjj.dao.InfMemberDao;
import com.cjj.dao.InfUserDao;
import com.cjj.entity.MemberInfo;
import com.cjj.entity.User;
import com.cjj.entity.UserOrder;
import com.cjj.entity.MemberPrice;
import com.cjj.service.InfMemberService;
import com.cjj.utils.MemberTypeUtil;
import com.cjj.utils.TimeFormatUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import java.sql.Time;
import java.text.ParseException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

@Service
public class MemberService implements InfMemberService {
    @Autowired
    private InfMemberDao memberDao;
    @Autowired
    private RedisTemplate redisTemplate;
    @Override
    public List<UserOrder> isExistMemOrder(String uer_act) {
        return memberDao.findMemOrder(uer_act);
    }

    @Override
    public UserOrder findMemOrderByNumber(String uor_orderNumber) {
        return memberDao.findMemOrderByNumber(uor_orderNumber);
    }

    @Override
    public Object memOrder(UserOrder memberOrder, HttpServletRequest req) throws ParseException {
        //myVip下单
        HashMap<String, String> hm = new HashMap<>();
        String uer_act = memberOrder.getUer_act();
        String uor_orderNumber = UUID.randomUUID().toString().toUpperCase().replace("-", "").substring(0, 24);
        String uor_state = "等待买家付款";
        String uor_commodityType = "VIP";
        String uor_detail = "Qiaole黑怕VIP-" + memberOrder.getUor_type();
        String uor_orderTime= TimeFormatUtil.getTimeFormat2(new Date());
        memberOrder.setUor_orderNumber(uor_orderNumber);
        memberOrder.setUor_state(uor_state);
        memberOrder.setUor_detail(uor_detail);
        memberOrder.setUor_commodityType(uor_commodityType);
        memberOrder.setUor_orderTime(uor_orderTime);
        //查找数据库是否有该用户的订单
        List<UserOrder> orderList = isExistMemOrder(uer_act);
        if (orderList.size() == 0 || orderList == null) {
            //该用户没有订单
            //第一次下单
            System.out.println("用户会员下单信息第1次:" + memberOrder);
            memberDao.addMemOrder(memberOrder);
            req.getSession().setAttribute("memberOrder", memberOrder);
            hm.put("stateOrder", "1");
            return hm;
        }
        if (orderList.size() != 0 && orderList != null) {
            //该用户有订单
            int i = 0;
            //遍历所有订单
            for (UserOrder orderDao : orderList) {
                String commodityTypeDao = orderDao.getUor_commodityType();
                String stateDao = orderDao.getUor_state();
                //判断是否为开通会员的订单
                if ("VIP".equals(commodityTypeDao)) {
                    if ("已付款".equals(stateDao)) {
                        i++;
                    }
                    //判断该用户是否有未付款的订单
                    if ("等待买家付款".equals(stateDao)) {
                        //如果是,返回
//                        req.getSession().setAttribute("memberOrder", orderDao);//本次订单信息,用于显示orderSuccess页面的数据显示。
                        hm.put("stateOrder", "0");
                        return hm;
                    }
                }
            }
            //订单中的VIP订单都已付款,继续下单...
            System.out.println("用户会员下单信息第" + (i + 1) + "次:" + memberOrder);
            memberDao.addMemOrder(memberOrder);
            req.getSession().setAttribute("memberOrder", memberOrder);//本次订单信息,用于显示orderSuccess页面的数据显示。
            req.getSession().removeAttribute("updUserOrder");
            hm.put("stateOrder", "1");
            return hm;
        }
        hm.put("stateOrder", "404");
        return hm;
    }

    @Override
    public Object updMemOrder(UserOrder updUserOrder, MemberInfo memberInfo,String payCode, HttpServletRequest req) throws ParseException {
        //orderPay付款
        HashMap<String, String> hm = new HashMap<>();
        //封装用户付款信息
        String uor_orderNumber = updUserOrder.getUor_orderNumber();
        String uor_state = "已付款";
        String uor_finishTime=TimeFormatUtil.getTimeFormat2(new Date());
        updUserOrder.setUor_state(uor_state);
        updUserOrder.setUor_orderNumber(uor_orderNumber);
        updUserOrder.setUor_finishTime(uor_finishTime);
        //通过订单号来验证是否付款
        if(payCode.equals("972550")){
            int result = memberDao.updMemOrder(updUserOrder);
            if (result > 0) {
                //支付成功
                //查找该用户的订单
                UserOrder memOrder = findMemOrderByNumber(uor_orderNumber);
                System.out.println("付款获取用户vip订单信息:" + memOrder);
                memberInfo.setUer_act(memOrder.getUer_act());
                memberInfo.setMif_type(memOrder.getUor_type());
                toUserPayVIP(memberInfo,req);
                hm.put("statePay", "1");
                System.out.println("更新会员订单信息:" + updUserOrder);
//                req.getSession().setAttribute("updMemberOrder", updUserOrder);
                return hm;
            }
        }
        System.out.println("订单号:" + uor_orderNumber);
        hm.put("statePay", "0");
        return hm;
    }

    @Override
    public List<MemberInfo> isExistVIP(String uer_act) {
        return memberDao.findByAct(uer_act);
    }

    @Override
    public Object toUserPayVIP(MemberInfo memberInfo,HttpServletRequest req) throws ParseException {
        HashMap<String, String> hm = new HashMap<>();
        String uer_act = memberInfo.getUer_act();
        List<MemberInfo> list = isExistVIP(uer_act);
        String mtype = memberInfo.getMif_type();
        System.out.println(uer_act + "用户是否为会员:" + list);
        //判断list集合大小是否为0,不能为list==null或""
        if (list.size() == 0 || list == null) {
            //第一次充值会员,所以为空,之前都没有相关记录
            String startTime = TimeFormatUtil.getTimeFormat(new Date());
            String expireTime = MemberTypeUtil.getMemberType("", mtype);
            memberInfo.setStart_time(startTime);
            memberInfo.setEnd_time(expireTime);
            System.out.println("获取用户充值会员的信息:" + memberInfo);
            memberDao.addMemberUser(memberInfo);
            req.getSession().setAttribute("updMemberInfo", memberInfo);
            hm.put("statePayVIP", "1");
            return hm;
        } else {
            for (MemberInfo member : list) {
                //判断用户会员是否到期
                String startTime = member.getStart_time();
                String endTime = member.getEnd_time();
                System.out.println("到期时间为:" + endTime);
                Date endDate = TimeFormatUtil.getDate(endTime);
                Date today = new Date();
                long lEnd = endDate.getTime();
                long lToday = today.getTime();
                if (lEnd > lToday) {
                    //没有过期
                    if (member == list.get(list.size() - 1)) {
                        System.out.println("尊贵的黑怕会员,你正在续费会员...");
                        String expireTime = MemberTypeUtil.getMemberType(endTime, mtype);
                        memberInfo.setStart_time(startTime);
                        memberInfo.setEnd_time(expireTime);
                        System.out.println("获取没过期用户续费会员的信息:" + memberInfo);
                        memberDao.addMemberUser(memberInfo);
                        req.getSession().setAttribute("updMemberInfo", memberInfo);
                        hm.put("statePayVIP", "1");
                        return hm;
                    }
                } else {
                    //过期了
                    if (member == list.get(list.size() - 1)) {
                        System.out.println("您的会员已过期!正在为您续费哦");
                        //设置到期时间
                        String sToday = TimeFormatUtil.getTimeFormat(new Date());
                        String expireTime = MemberTypeUtil.getMemberType("", mtype);
                        memberInfo.setStart_time(sToday);
                        memberInfo.setEnd_time(expireTime);
                        System.out.println("获取过期用户续费会员的信息:" + memberInfo);
                        memberDao.addMemberUser(memberInfo);
                        req.getSession().setAttribute("updMemberInfo", memberInfo);
                        hm.put("statePayVIP", "1");
                        return hm;
                    }
                }
            }
        }
        return hm;
    }

}
