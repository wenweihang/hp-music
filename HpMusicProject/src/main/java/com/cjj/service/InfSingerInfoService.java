package com.cjj.service;

import com.cjj.entity.Page;
import com.cjj.entity.SingerInfo;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

public interface InfSingerInfoService {
    /**
     * 获取显示的歌手页面
     *
     * @param currPage
     * @param req
     * @return
     */
    public Page<SingerInfo> getSingerInfoPage(int currPage, HttpServletRequest req);

    /**
     * 根据首字母获取显示的歌手页面
     *
     * @param currPage
     * @param sgr_firstLetter
     * @param req
     * @return
     */
    public Page<SingerInfo> getSingerInfoPageByFL(int currPage, String sgr_firstLetter, HttpServletRequest req);

    /**
     * 根据地区获取显示的歌手页面
     *
     * @param currPage
     * @param sgr_region
     * @param req
     * @return
     */
    public Page<SingerInfo> getSingerInfoPageByRG(int currPage, String sgr_region, HttpServletRequest req);

    /**
     * 根据首字母和地区获取显示的歌手页面
     * @param currPage
     * @param sgr_firstLetter
     * @param sgr_region
     * @param req
     * @return
     */
    public Page<SingerInfo> getSingerInfoPageByFLANDRG(int currPage, String sgr_firstLetter, String sgr_region, HttpServletRequest req);

    /**
     * 获取首页显示的热门歌手
     * @param req
     * @return
     */
    public List<SingerInfo> getSingerInfoPageMain(HttpServletRequest req);

}
