package com.cjj.service;

import com.cjj.entity.LogHistory;
import com.cjj.entity.Page;
import com.cjj.entity.User;
import com.cjj.entity.UserOrder;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.ParseException;
import java.util.List;


public interface InfUserService {
    /**
     * 判断是否存在该账号
     * @param uer_act
     * @return
     */
    public String isExist(String uer_act);

    /**
     * 添加用户
     * @param regUser
     */
    public void addUser(User regUser);

    /**
     * 登录用户
     * @param uer_act
     * @param uer_pwd
     * @param verifContent
     * @param req
     * @param resp
     * @return
     */
    public Object loginUser(String uer_act, String uer_pwd, String verifContent, HttpServletRequest req, HttpServletResponse resp) throws IOException, ParseException;
    /**
     * 核实用户
     * @param uer_act
     * @param uer_pwd
     * @return
     */
    public User checkUser(String uer_act,String uer_pwd);

    /**
     * 更新用户头像
     * @param req
     * @param uer_headImg
     * @return
     * @throws IOException
     */
    public Object uploadHeadImg(HttpServletRequest req,MultipartFile uer_headImg) throws IOException;
    /**
     * 更新用户信息
     * @param updUser
     */
    public Object updateUser(User updUser,HttpServletRequest req);

    /**
     * 发送邮件
     * @param uer_emailAddress
     */
    public Object sendEmail(String uer_emailAddress);

    /**
     * 修改密码
     * @param emailCode
     * @param uer_pwd
     * @param req
     * @return
     */
    public Object changePwdByEmail(String emailCode,String uer_pwd, HttpServletRequest req);

    /**
     * 发送绑定邮件
     * @param uer_emailAddress
     * @param req
     * @return
     */
    public Object sendEmailBind(String uer_emailAddress, HttpServletRequest req);
    /**
     * 绑定邮箱
     * @param emailBindCode
     * @param req
     * @return
     */
    public Object emailBind(String emailBindCode,String uer_emailAddress, HttpServletRequest req);
    /**
     * 发送解绑邮件
     * @param uer_emailAddress
     * @return
     */
    public Object sendEmailUnBind(String uer_emailAddress);
    /**
     * 解绑邮箱
     * @param emailUnBindCode
     * @param req
     * @return
     */
    public Object emailUnBind(String emailUnBindCode, HttpServletRequest req);

    /**
     * 通过旧密码修改用户密码
     * @param uer_oldPwd
     * @param uer_pwd
     * @param req
     * @return
     */
    public Object changePwdByOld(String uer_oldPwd,String uer_pwd, HttpServletRequest req);

    /**
     * 添加用户登录记录
     * @param logHistory
     */
    public void addLogHistory(LogHistory logHistory);

    /**
     * 查询用户所有历史记录
     * @param uer_act
     * @return
     */
    public List<LogHistory> selectAllHistory(String uer_act);

    /**
     * 根据当前页数获取历史记录
     * @param currPage
     * @param req
     * @return
     */
    public Page<LogHistory> getHistoryPages(int currPage,HttpServletRequest req);

    /**
     * 根据当前页获取用户订单
     * @param currPage
     * @param req
     * @return
     */
    public Page<UserOrder> getOrderPages(int currPage, HttpServletRequest req);
}
