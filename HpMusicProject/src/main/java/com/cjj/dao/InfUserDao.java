package com.cjj.dao;

import com.cjj.entity.LogHistory;
import com.cjj.entity.Page;
import com.cjj.entity.User;
import com.cjj.entity.UserOrder;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;

@Repository
public interface InfUserDao {
    /**
     * 获取用户订单总数
     * @param uer_act
     * @return
     */
    public int selectSumOrder(String uer_act);

    /**
     * 查询所有订单信息
     * @return
     */
    public List<UserOrder> selectAllOrder();

    /**
     * 根据用户帐号查询订单信息
     * @param uer_act
     * @return
     */
    public List<UserOrder> selectOrderByAct(String uer_act);
    /**
     * 根据分页数据index和显示的行数获取订单信息
     * @param page
     * @return
     */
    public List<UserOrder> selectOrderPages(Page<UserOrder> page);
    /**
     * 验证账号是否存在
     *
     * @param uer_act
     */
    public String findByAct(String uer_act);

    /**
     * 添加用户
     *
     * @param regUser
     */
    public void addUser(User regUser);

    /**
     * 核实用户账号密码是否正确
     *
     * @param uer_act
     * @param uer_pwd
     * @return
     */
    public User findUser(@Param("uer_act") String uer_act, @Param("uer_pwd") String uer_pwd);

    /**
     * 更新头像
     * @param updImgUser
     * @return
     */
    public int updateImgUser(User updImgUser);
    /**
     * 更新用户信息
     *
     * @param updUser
     */
    public int updateUser(User updUser);

    /**
     * 通过邮件地址查找
     *
     * @return
     */
    public String findByEmailAddress(String uer_emailAddress);

    /**
     * 修改用户密码
     *
     * @param chgPwdUser
     * @return
     */
    public int changePwd(User chgPwdUser);

    /**
     * 绑定邮箱
     *
     * @param emBindUser
     * @return
     */
    public int emailBind(User emBindUser);

    /**
     * 添加用户登录记录
     * @param logHistory
     */
    public void addLogHistory(LogHistory logHistory);

    /**
     * 通过帐号查询用户所有历史记录
     * @param uer_act
     * @return
     */
    public List<LogHistory> selectAllHistoryByAct(String uer_act);

    /**
     * 获取用户历史记录总数
     * @param uer_act
     * @return
     */
    public int selectSumHisory(String uer_act);

    /**
     * 根据分页数据index和显示的行数获取历史记录
     * @param page
     * @return
     */
    public List<LogHistory> selectHistoryPages(Page<LogHistory> page);
}
