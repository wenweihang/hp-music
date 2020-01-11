package com.cjj.dao;

import com.cjj.entity.MemberInfo;
import com.cjj.entity.Page;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface InfAdminMemberInfoDao {
    /**
     * 查询所有会员总数
     * @return
     */
    public int selectSumMemberInfo();

    /**
     * 根据当前页获取会员信息
     * @param page
     * @return
     */
    public List<MemberInfo> getMemberInfoPage(Page<MemberInfo> page);
}
