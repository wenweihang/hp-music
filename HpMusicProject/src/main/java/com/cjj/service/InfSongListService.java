package com.cjj.service;

import javax.servlet.http.HttpServletRequest;

public interface InfSongListService {

    /**
     * 获取首页5歌单
     * @param req
     * @return
     */
    public Object getSongListMain(HttpServletRequest req);

    /**
     * 获取歌单
     * @param req
     * @return
     */
    public Object getSongLists(HttpServletRequest req );

    /**
     * 获取全部歌单
     * @param req
     * @return
     */
    public Object getAllSongLists(HttpServletRequest req );

    /**
     * 获取最新歌单
     * @param sl_new
     * @param req
     * @return
     */
    public Object getNewSongLists(String sl_new,HttpServletRequest req );

    /**
     * 获取最热歌单
     * @param sl_hot
     * @param req
     * @return
     */
    public Object getHotSongLists(String sl_hot,HttpServletRequest req );
}
