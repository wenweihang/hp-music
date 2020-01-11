package com.cjj.dao;

import com.cjj.entity.Page;
import com.cjj.entity.SongInfo;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface InfSongInfoDao {
    /**
     * 查询所对应的歌单的歌曲
     * @param sg_songList
     * @return
     */
    public List<SongInfo> selectAll(String sg_songList);

    /**
     * 根据歌单名查询歌曲总数
     * @param sg_songList
     * @return
     */
    public int selectSumSong(String sg_songList);

    /**
     * 根据分页数据index和显示的行数查询歌曲
     * @param page
     * @return
     */
    public List<SongInfo> selectSongPages(Page<SongInfo> page);

    /**
     * 根据歌曲名删除歌曲信息
     * @param sg_name
     */
    public void deleteSongInfo(String sg_name);

    /**
     * 添加歌曲信息
     * @param songInfo
     * @return
     */
    public int addSongInfo(SongInfo songInfo);

    /**
     * 添加歌曲封面
     * @param sg_imgAddress
     * @param sg_name
     * @return
     */
    public int addSongInfoImg(@Param("sg_imgAddress") String sg_imgAddress, @Param("sg_name") String sg_name);
    /**
     * 添加歌曲封面
     * @param sg_address
     * @param sg_name
     * @return
     */
    public int addSongInfoMusic(@Param("sg_address") String sg_address, @Param("sg_name") String sg_name);

    /**
     * 通过ID获取歌曲
     * @param ID
     * @return
     */
    public SongInfo selectSongByID(int ID);
    /**
     * 根据专辑ID查询歌曲总数
     * @param szj_id
     * @return
     */
    public int selectSumSongByZJID(int szj_id);

    /**
     * 查询所有歌曲的名称
     * @return
     */
    public List<String> selectAllSongInfo();

    /**
     * 向专辑添加已有歌曲,并更新
     * @param songInfo
     * @return
     */
    public int updateSongInfo(SongInfo songInfo);

    /**
     * 获取首页新歌
     * @return
     */
    public List<SongInfo> selectNewSongInfo();
    /**
     * 向歌单添加已有歌曲,并更新
     * @param songInfo
     * @return
     */
    public int updateSongInfoToSL(SongInfo songInfo);

    /**
     * 根据地区查询新歌
     * @param sg_language
     * @return
     */
    public List<SongInfo> selectNewSongInfoByRG(String sg_language);
    /**
     * 根据歌手名称查询所有歌曲
     * @param sg_author
     * @return
     */
    public List<SongInfo> selectSongInfoByName(String sg_author);

    /**
     * 获取排行榜top10新歌
     * @param sg_new
     * @return
     */
    public List<SongInfo> selectTopNewSongs(String sg_new);
    /**
     * 获取排行榜top10热歌
     * @param sg_hot
     * @return
     */
    public List<SongInfo> selectTopHotSongs(String sg_hot);
    /**
     * 获取排行榜top10流行歌
     * @param sg_pop
     * @return
     */
    public List<SongInfo> selectTopPopSongs(String sg_pop);
    /**
     * 获取排行榜前4首歌曲
     * @param sg_language
     * @return
     */
    public List<SongInfo> selectTopFourSongs(String sg_language);
    /**
     * 根据搜索内容获取歌曲
     * @param text
     * @return
     */
    public List<SongInfo> selectSongInfoByText(String text);

    /**
     * 查询所有歌曲总数
     * @return
     */
    public int selectSumAllSong();

    /**
     * 根据分页数据index和显示的行数查询所有歌曲
     * @param page
     * @return
     */
    public List<SongInfo> selectSongInfoTop(Page<SongInfo> page);

    /**
     * 根据ID删除歌曲
     * @param sg_id
     * @return
     */
    public int deleteSongInfoTop(int sg_id);

    /**
     * 更新歌曲
     * @param updSongInfo
     * @return
     */
    public int updateSongInfoTop(SongInfo updSongInfo);
}
