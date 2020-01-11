package com.cjj.dao;

import com.cjj.entity.Page;
import com.cjj.entity.SongInfo;
import com.cjj.entity.SongList;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface InfAdminSongListDao {
    /**
     * 获取歌单总数
     * @return
     */
    public int selectSumSongList();
    /**
     * 获取所有歌单
     * @return
     */
    public List<SongList> selectSongList(Page<SongList> page);

    /**
     * 添加歌单
     * @param songList
     */
    public void addSongList(SongList songList);

    /**
     * 添加歌单封面
     * @param sl_imgAddress
     * @param sl_name
     * @return
     */
    public int addSongListImg(@Param("sl_imgAddress") String sl_imgAddress,@Param("sl_name") String sl_name);

    /**
     * 根据歌单名删除歌单
     * @param sl_name
     * @return
     */
    public int deleteSongList(String sl_name);

    /**
     * 更新首页显示的歌单
     * @param sl_id
     * @param sl_main
     * @return
     */
    public int updateSongList(@Param("sl_id")int sl_id,@Param("sl_main")String sl_main);
}
