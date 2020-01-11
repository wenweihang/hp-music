package com.cjj.dao;

import com.cjj.entity.UserSignIn;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface InfCookiesDao {
    /**
     * 根据用户帐号查询该用户登录的记录
     * @param uer_act
     * @return
     */
    public UserSignIn selectSignInByAct(String uer_act);

    /**
     * 添加用户连续登录信息
     * @param userSignIn
     */
    public void addUserSignIn(UserSignIn userSignIn);

    /**
     * 更新用户连续登录中断信息
     * @return
     */
    public int updateNoContinueSignIn(UserSignIn userSignIn);
    /**
     * 更新用户连续登录信息
     * @return
     */
    public int updateContinueSignIn(UserSignIn userSignIn);

    /**
     * 获取签到天数
     * @param uer_act
     * @return
     */
    public String selectSignInDay(String uer_act);
}
