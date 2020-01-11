package com.cjj.service;

import com.cjj.entity.AdminUser;
import com.cjj.entity.Page;
import com.cjj.entity.User;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.text.ParseException;

public interface InfAdminUserService {
    /**
     * 判断是否存在该账号
     * @param admuer_act
     * @return
     */
    public int isExist(String admuer_act);

    /**
     * 登录用户
      * @param regAdminUser
     * @param verifContent
     * @param req
     * @return
     * @throws IOException
     * @throws ParseException
     */
    public Object loginAdminUser(AdminUser regAdminUser, String verifContent, HttpServletRequest req) throws IOException, ParseException;

    /**
     * 获取用户页面数
     * @param currPage
     * @param req
     * @return
     */
    public Page<User> getUserPage(int currPage, HttpServletRequest req);

    /**
     * 删除用户
     * @param uer_act
     * @return
     */
    public Object deleteUser(String uer_act);

    /**
     * 获取所有管理员账号
     * @param req
     * @return
     */
    public Object getAllAdmUser(HttpServletRequest req);


    /**
     * 删除管理员用户
     * @param admuer_act
     * @return
     */
    public Object deleteAdmUser(String admuer_act);

}
