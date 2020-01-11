package com.cjj.service;

import com.cjj.entity.Page;
import com.cjj.entity.SongInfo;
import com.cjj.entity.SongZJ;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.util.List;

public interface InfAdminSongZJService {
    /**
     * 获取所有专辑
     * @param currPage
     * @param req
     * @return
     */
    public Page<SongZJ> getSongZJPage(int currPage, HttpServletRequest req);

    /**
     * 添加专辑
     * @param songZJ
     * @param req
     * @return
     */
    public Object addSongZJ(SongZJ songZJ,HttpServletRequest req);

    /**
     * 添加专辑封面
     * @param req
     * @param songZJImg
     * @return
     * @throws IOException
     */
    public Object addSongZJImg(MultipartFile songZJImg, HttpServletRequest req) throws IOException;
    /**
     * 根据分页数据index和显示的行数查询专辑中的歌曲
     * @param currPage
     * @param req
     * @return
     */
    public Page<SongInfo> getSongInfo(int currPage, int szj_id, HttpServletRequest req);

    /**
     * 获取所有歌曲名称集合
     * @param req
     * @return
     */
    public List<String> getAllSongInfo(HttpServletRequest req);

    /**
     * 添加专辑歌曲
     * @param songInfo
     * @return
     */
    public Object addSongInfo(SongInfo songInfo);
}
