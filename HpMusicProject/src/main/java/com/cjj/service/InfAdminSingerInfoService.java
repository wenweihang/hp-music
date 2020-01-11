package com.cjj.service;

import com.cjj.entity.Page;
import com.cjj.entity.SingerInfo;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.UnsupportedEncodingException;

public interface InfAdminSingerInfoService {
    /**
     * 修改歌手信息
     * @param sgr_id
     * @param sgr_hot
     * @param req
     * @return
     */
    public Object updSingerInfo(int sgr_id,String sgr_hot,HttpServletRequest req);
    /**
     * 添加歌手信息
     * @param singerInfo
     * @param req
     * @return
     */
    public Object addSingerInfo(SingerInfo singerInfo,HttpServletRequest req);

    /**
     * 添加歌手封面图
     * @param singerInfoImg
     * @param req
     * @return
     */
    public Object addSingerInfoImg(MultipartFile singerInfoImg, HttpServletRequest req) throws UnsupportedEncodingException;

    /**
     * 根据搜索内容获取相应歌手
     * @param currPage
     * @param text
     * @param req
     * @return
     */
    public Page<SingerInfo> getSingerInfoByText(int currPage,String text,HttpServletRequest req);
}
