package com.cjj.controller;


import com.cjj.entity.Page;
import com.cjj.entity.SingerInfo;
import com.cjj.service.InfAdminSingerInfoService;
import com.cjj.service.InfSingerInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.util.HashMap;

@Controller
@RequestMapping("/adminSingerInfo")
public class AdminSingerInfoController {
    @Autowired
    private InfAdminSingerInfoService adminSingerInfoService;
    @Autowired
    private InfSingerInfoService singerInfoService;

    /**
     * 获取歌手显示的页面
     *
     * @param currPage
     * @param req
     * @return
     */
    @RequestMapping("/getSingerInfoPage")
    public @ResponseBody
    Object getSingerInfoPage(int currPage, HttpServletRequest req) {
        HashMap<String, Page<SingerInfo>> hm = new HashMap<>();
        Page<SingerInfo> page = singerInfoService.getSingerInfoPage(currPage, req);
        System.out.println("歌手信息为：" + page);
        hm.put("page", page);
        return hm;
    }

    /**
     * 修改歌手信息
     *
     * @param sgr_id
     * @param sgr_hot
     * @param req
     * @return
     */
    @RequestMapping("/updSingerInfo")
    public @ResponseBody
    Object updSingerInfo(int sgr_id, String sgr_hot, HttpServletRequest req) {
        HashMap<String, String> hm = new HashMap<>();
        hm = (HashMap<String, String>) adminSingerInfoService.updSingerInfo(sgr_id, sgr_hot, req);
        System.out.println("歌手信息更新状态为：" + hm);
        return hm;
    }

    /**
     * 添加歌手信息
     *
     * @param singerInfo
     * @return
     */
    @RequestMapping("/addSingerInfo")
    public @ResponseBody
    Object addSingerInfo(SingerInfo singerInfo, HttpServletRequest req) {
        HashMap<String, String> hm = new HashMap<>();
        hm = (HashMap<String, String>) adminSingerInfoService.addSingerInfo(singerInfo, req);
        System.out.println("添加歌手的状态为：" + hm);
        return hm;
    }

    /**
     * 添加歌手封面图
     *
     * @param file
     * @param req
     * @return
     * @throws IOException
     */
    @RequestMapping("/addSingerInfoImg")
    public @ResponseBody
    Object
    addSingerInfoImg(MultipartFile file, HttpServletRequest req) throws IOException {
        HashMap<String, String> hm = new HashMap<>();
        hm = (HashMap<String, String>) adminSingerInfoService.addSingerInfoImg(file, req);
        System.out.println("图片信息：" + file);
        System.out.println("添加歌手封面图状态：" + hm);
        return hm;
    }
    @RequestMapping("/getSingerInfoByText")
    public @ResponseBody
    Object getSingerInfoByText(int currPage,String text, HttpServletRequest req) {
        HashMap<String, Page<SingerInfo>> hm = new HashMap<>();
        Page<SingerInfo> page = adminSingerInfoService.getSingerInfoByText(currPage,text ,req );
        System.out.println("歌手信息为：" + page);
        hm.put("page",page);
        return hm;
    }

}
