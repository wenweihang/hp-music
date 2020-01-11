package com.cjj.dao;

import com.cjj.entity.MemberInfo;
import com.cjj.entity.UserOrder;
import com.cjj.entity.MemberPrice;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface InfMemberDao {
    /**
     * 查找该用户是否存在订单
     * @param uer_act
     * @return
     */
    public List<UserOrder> findMemOrder(String uer_act);
    /**
     *通过单号查询用户订单信息
     * @return
     */
    public UserOrder findMemOrderByNumber(String uor_orderNumber);
    /**
     * 添加用户会员下单信息
     * @param memberOrder
     */
    public void addMemOrder(UserOrder memberOrder);
    /**
     * 添加会员用户
     * @param memberInfo
     */
    public void addMemberUser(MemberInfo memberInfo);
    /**
     * 更新会员订单信息
     * @param updUserOrder
     * @return
     */
    public int updMemOrder(UserOrder updUserOrder);

    /**
     * 查找该账户是否为会员
     * @param uer_act
     * @return
     */
    public List<MemberInfo> findByAct(String uer_act);

}
