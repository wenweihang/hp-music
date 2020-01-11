package com.cjj.service;


import com.cjj.entity.Page;
import com.cjj.entity.SongInfo;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

public interface InfSongInfoService {
    /**
     * 获取对应歌单
     * @param sl
     * @return
     */
    public Object getSongs(String sl, HttpServletRequest req);

    /**
     * 获取首页新歌
     * @param req
     * @return
     */
    public Object getNewSongs(HttpServletRequest req);

    /**
     * 根据地区获取新歌
     * @param sg_language
     * @param req
     * @return
     */
    public Object getNewSongsByRG(String sg_language,HttpServletRequest req);
    /**
     * 根据歌手名称获取所有歌曲
     * @param sg_author
     * @param req
     * @return
     */
    public Object getSongInfoByName(String sg_author,HttpServletRequest req);

    /**
     * 获取排行榜TOP10新歌
     * @param sg_new
     * @param req
     * @return
     */
    public Object getTopNewSongs(String sg_new,HttpServletRequest req);
    /**
     * 获取排行榜TOP10热歌
     * @param sg_hot
     * @param req
     * @return
     */
    public Object getTopHotSongs(String sg_hot,HttpServletRequest req);
    /**
     * 获取排行榜TOP10流行歌
     * @param sg_pop
     * @param req
     * @return
     */
    public Object getTopPopSongs(String sg_pop,HttpServletRequest req);

    /**
     * 获取排行榜前4首歌曲
     * @param sg_language
     * @param req
     * @return
     */
    public List<SongInfo> getTopFourSongs(String sg_language,HttpServletRequest req);

    /**
     * 根据搜索内容获取相应歌曲
     * @param text
     * @param req
     * @return
     */
    public Object getSongInfoByText(String text,HttpServletRequest req);
}
