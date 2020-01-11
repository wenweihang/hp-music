package com.cjj.service.implclass;

import com.cjj.dao.InfAdminMemberInfoDao;
import com.cjj.entity.MemberInfo;
import com.cjj.entity.Page;
import com.cjj.service.InfAdminMemberInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Service
public class AdminMemberInfoService implements InfAdminMemberInfoService {
    @Autowired
    private InfAdminMemberInfoDao adminMemberInfoDao;
    @Override
    public Page<MemberInfo> getMemberInfoPage(int currPage, HttpServletRequest req) {
        Page<MemberInfo> page = new Page<>();
        //封装当前页
        page.setCurrPage(currPage);
        //封装每页显示的行数
        int pageRows = 10;
        page.setPageRows(pageRows);
        //获取订单总数
        int sumCount = adminMemberInfoDao.selectSumMemberInfo();
        page.setSumCount(sumCount);
        System.out.println("一共" + sumCount + "个会员信息");
        //封装页面总数
        double num = sumCount;
        Double dNum = Math.ceil(num / pageRows);
        page.setSumPage(dNum.intValue());
        System.out.println("会员信息一共" + page.getSumPage() + "页");
        //封装每页显示的数据
        int index = (currPage - 1) * pageRows;
        page.setIndex(index);
        List<MemberInfo> lists = adminMemberInfoDao.getMemberInfoPage(page);
        page.setLists(lists);
        return page;
    }
}
