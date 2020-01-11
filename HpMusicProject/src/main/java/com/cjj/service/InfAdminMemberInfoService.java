package com.cjj.service;


import com.cjj.entity.MemberInfo;
import com.cjj.entity.Page;

import javax.servlet.http.HttpServletRequest;

public interface InfAdminMemberInfoService {
    /**
     * 根据当前页获取会员信息
     * @param currPage
     * @param req
     * @return
     */
    public Page<MemberInfo> getMemberInfoPage(int currPage, HttpServletRequest req);
}
