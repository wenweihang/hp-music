package com.cjj.service;

import com.cjj.entity.Page;
import com.cjj.entity.SongInfo;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;

public interface InfAdminSongInfoService {
    /**
     * 添加歌曲
     *
     * @param songInfo
     * @param req
     * @return
     */
    public Object addSongInfo(SongInfo songInfo, HttpServletRequest req);

    /**
     * 添加歌曲文件和封面图
     *
     * @param songInfoFile
     * @param req
     * @return
     */
    public Object addSongInfoFile(MultipartFile songInfoFile, HttpServletRequest req) throws IOException;

    /**
     * 获取歌曲
     *
     * @param currPage
     * @param req
     * @return
     */
    public Page<SongInfo> getSongInfoTopPage(int currPage, HttpServletRequest req);

    /**
     * 删除歌曲
     *
     * @param sg_id
     * @return
     */
    public Object deleteSongInfoTop(int sg_id);

    /**
     * 更新歌曲
     * @param updSongInfo
     * @return
     */
    public Object updateSongInfoTop(SongInfo updSongInfo);
}
