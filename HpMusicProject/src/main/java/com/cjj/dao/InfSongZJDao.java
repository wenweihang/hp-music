package com.cjj.dao;

import com.cjj.entity.SongZJ;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface InfSongZJDao {
    /**
     * 根据专辑ID查询专辑标题
     * @param szj_id
     * @return
     */
    public String selectZJtitleByID(int szj_id);

    /**
     * 根据专辑ID查询专辑介绍
     * @param szj_id
     * @return
     */
    public String  selectZJdetailByID(int szj_id);

    /**
     * 根据歌手名称查询专辑
     * @param szj_author
     * @return
     */
    public List<SongZJ> selectSongZJByName(String szj_author);

}
