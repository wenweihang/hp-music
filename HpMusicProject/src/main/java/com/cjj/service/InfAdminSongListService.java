package com.cjj.service;

import com.cjj.entity.Page;
import com.cjj.entity.SongInfo;
import com.cjj.entity.SongList;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;

public interface InfAdminSongListService {
    /**
     * 获取歌单页数
     * @param currPage
     * @param req
     * @return
     */
    public Page<SongList> getSongListPage(int currPage,HttpServletRequest req);
    /**
     * 添加歌单
     * @param songList
     * @param req
     * @return
     */
    public Object addSongList(SongList songList,HttpServletRequest req);
    /**
     * 添加歌单封面
     * @param req
     * @param songListImg
     * @return
     * @throws IOException
     */
    public Object addSongListImg(MultipartFile songListImg,HttpServletRequest req) throws IOException;

    /**
     * 根据分页数据index和显示的行数查询歌曲
     * @param currPage
     * @param req
     * @return
     */
    public Page<SongInfo> getSongInfo(int currPage,String sg_songList,HttpServletRequest req);

    /**
     * 根据歌曲名删除歌曲信息
     * @param sg_name
     * @param req
     */
    public Object deleteSongInfo(String sg_name,HttpServletRequest req);

    /**
     * 删除歌单
     * @param sl_name
     * @param req
     * @return
     */
    public Object deleteSongList(String sl_name,HttpServletRequest req);

    /**
     * 修改首页显示的歌单
     * @param sl_id
     * @param sl_main
     * @param req
     * @return
     */
    public Object updSongList(int sl_id,String sl_main,HttpServletRequest req);

    /**
     * 向歌单添加歌曲
     * @param songInfo
     * @param req
     * @return
     */
    public Object addSongInfoToSL(SongInfo songInfo,HttpServletRequest req);
}
