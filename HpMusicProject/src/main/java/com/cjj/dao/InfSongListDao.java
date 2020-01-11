package com.cjj.dao;

import com.cjj.entity.SongList;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface InfSongListDao {

    /**
     * 查询首页5歌单
     * @return
     */
    public List<SongList> selectSongListMain();

    /**
     * 根据id获取歌单
     * @param sl_id
     * @return
     */
    public SongList selectSongListByID(int sl_id);

    /**
     * 获取全部歌单
     * @return
     */
    public List<SongList> selectAllSongLists();

    /**
     * 获取最新歌单
     * @return
     */
    public List<SongList> selectNewSongLists(String sl_new);

    /**
     * 获取最热歌单
     * @return
     */
    public List<SongList> selectHotSongLists(String sl_hot);
}
