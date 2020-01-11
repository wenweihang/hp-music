package com.cjj.dao;

import com.cjj.entity.Page;
import com.cjj.entity.SongZJ;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface InfAdminSongZJDao {
    /**
     * 获取专辑总数
     * @return
     */
    public int selectSumSongZJ();
    /**
     * 获取所有专辑
     * @return
     */
    public List<SongZJ> selectSongZJ(Page<SongZJ> page);

    /**
     * 添加专辑
     * @param songZJ
     * @return
     */
    public int addSongZJ(SongZJ songZJ);

    /**
     * 根据专辑标题查询专辑ID
     * @param szj_title
     * @return
     */
    public int selectSongZJIDByTitle(String szj_title);
    /**
     * 添加歌单封面
     * @param szj_imgAddress
     * @param szj_title
     * @return
     */
    public int addSongZJImg(@Param("szj_imgAddress") String szj_imgAddress, @Param("szj_title") String szj_title);
}
