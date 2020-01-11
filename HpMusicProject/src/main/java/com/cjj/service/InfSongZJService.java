package com.cjj.service;

import javax.servlet.http.HttpServletRequest;

public interface InfSongZJService {
    /**
     * 根据歌手名称获取专辑
     * @param szj_author
     * @param req
     * @return
     */
    public Object getSongZJByName(String szj_author, HttpServletRequest req);
}
