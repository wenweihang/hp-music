package com.cjj.dao;

import com.cjj.entity.Page;
import com.cjj.entity.SingerInfo;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Repository
public interface InfAdminSingerInfoDao {
    /**
     * 更新歌手信息
     * @param sgr_id
     * @param sgr_hot
     * @return
     */
    public int updateSingerInfo(@Param("sgr_id") int sgr_id,@Param("sgr_hot") String sgr_hot);
    /**
     * 添加歌手信息
     * @param singerInfo
     * @return
     */
    public int addSingerInfo(SingerInfo singerInfo);

    /**
     * 添加歌手封面图
     * @param sgr_imgAddress
     * @param sgr_name
     * @return
     */
    public int addSingerInfoImg(@Param("sgr_imgAddress") String sgr_imgAddress, @Param("sgr_name") String sgr_name);

    /**
     * 根据搜索内容查询歌手总数
     * @param text
     * @return
     */
    public int selectSumSingerInfoByText(String text);

    /**
     * 根据搜索内容查询歌手
     * @param page
     * @return
     */
    public List<SingerInfo> selectSingerInfoByText(Page<SingerInfo> page);
}
