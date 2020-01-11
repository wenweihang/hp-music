package com.cjj.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.text.ParseException;

public interface InfCookiesService {
    /**
     * 判断用户是否连续登录
     * @return
     */
    public Object judgeContinueLog(HttpServletRequest req, HttpServletResponse resp) throws ParseException;

    /**
     * 获取签到天数
     * @param req
     * @return
     */
    public Object getSignInDay(HttpServletRequest req);
}
