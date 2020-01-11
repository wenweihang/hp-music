package com.cjj.service;

import javax.servlet.http.HttpServletRequest;

public interface InfCollectService {
    /**
     * 添加收藏的歌曲
     * @param sg_id
     * @param req
     * @return
     */
    public Object addCollectSong(int sg_id,HttpServletRequest req);
    /**
     * 获取收藏的歌曲页面
     * @param req
     * @return
     */
    public Object getCollectSongs(HttpServletRequest req);

    /**
     * 删除收藏的歌曲
     * @param sg_id
     * @param req
     * @return
     */
    public Object deleteCollectSong(int sg_id,HttpServletRequest req);

    /**
     * 添加收藏的歌单
     * @param sl_id
     * @param req
     * @return
     */
    public Object addCollectSongList(int sl_id,HttpServletRequest req);
    /**
     * 获取收藏的歌单
     * @param req
     * @return
     */
    public Object getCollectSongLists(HttpServletRequest req);
    /**
     * 删除收藏的歌单
     * @param sl_id
     * @param req
     * @return
     */
    public Object deleteCollectSongList(int sl_id,HttpServletRequest req);

}
