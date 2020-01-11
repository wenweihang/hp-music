package com.cjj.dao;

import com.cjj.entity.AdminUser;
import com.cjj.entity.Page;
import com.cjj.entity.User;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface InfAdminUserDao {
    /**
     * 验证账号是否存在
     * @param admuer_act
     */
    public int findByAct(String admuer_act);

    /**
     * 核实用户账号密码是否正确
     *
     * @param admuer_act
     * @param admuer_pwd
     * @return
     */
    public AdminUser findAdminUser(@Param("admuer_act") String admuer_act, @Param("admuer_pwd") String admuer_pwd);

    /**
     * 更新头像
     * @param updImgAdminUser
     * @return
     */
    public int updateImgAdminUser(AdminUser updImgAdminUser);

    /**
     * 查询所有用户总数
     * @return
     */
    public int selectSumUser();

    /**
     * 查询用户所有信息
     * @param page
     * @return
     */
    public List<User> selectAllUser(Page<User> page);

    /**
     * 根据用户账号删除用户
     * @param uer_act
     * @return
     */
    public void deleteUser(String uer_act);

    /**
     * 查询所有管理员账号
     * @return
     */
    public List<AdminUser> selectAllAdmUser();

    /**
     * 根据管理员账号删除管理员用户
     * @param admuer_act
     * @return
     */
    public int deleteAdmUser(String admuer_act);
}
