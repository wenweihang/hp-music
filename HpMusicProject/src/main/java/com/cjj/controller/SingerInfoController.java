package com.cjj.controller;

import com.cjj.entity.Page;
import com.cjj.entity.SingerInfo;
import com.cjj.service.InfSingerInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;

@Controller
@RequestMapping("/singerInfo")
public class SingerInfoController {
    @Autowired
    private InfSingerInfoService singerInfoService;

    /**
     * 获取歌手显示的页面
     * @param currPage
     * @param req
     * @return
     */
    @RequestMapping("/getSingerInfoPage")
    public @ResponseBody Object getSingerInfoPage(int currPage, HttpServletRequest req){
        HashMap<String,Page<SingerInfo>> hm=new HashMap<>();
        Page<SingerInfo> page=singerInfoService.getSingerInfoPage(currPage,req );
        System.out.println("歌手信息为："+page);
        hm.put("page",page );
        return hm;
    }

    /**
     * 根据首字母获取歌手页面
     * @param currPage
     * @param sgr_firstLetter
     * @param req
     * @return
     */
    @RequestMapping("/getSingerInfoPageByFL")
    public @ResponseBody Object getSingerInfoPageByFL(int currPage,String sgr_firstLetter, HttpServletRequest req){
        HashMap<String,Page<SingerInfo>> hm=new HashMap<>();
        Page<SingerInfo> page=singerInfoService.getSingerInfoPageByFL(currPage, sgr_firstLetter,req );
        System.out.println("歌手信息为："+page);
        hm.put("page",page );
        return hm;
    }

    /**
     * 根据地区获取歌手页面
     * @param currPage
     * @param sgr_region
     * @param req
     * @return
     */
    @RequestMapping("/getSingerInfoPageByRG")
    public @ResponseBody Object getSingerInfoPageByRG(int currPage,String sgr_region, HttpServletRequest req){
        HashMap<String,Page<SingerInfo>> hm=new HashMap<>();
        Page<SingerInfo> page=singerInfoService.getSingerInfoPageByRG(currPage, sgr_region,req );
        System.out.println("歌手信息为："+page);
        hm.put("page",page );
        return hm;
    }

    /**
     * 根据首字母和地区获取歌手页面
     * @param currPage
     * @param sgr_firstLetter
     * @param sgr_region
     * @param req
     * @return
     */
    @RequestMapping("/getSingerInfoPageByFLANDRG")
    public @ResponseBody Object getSingerInfoPageByFLANDRG(int currPage,String sgr_firstLetter,String sgr_region, HttpServletRequest req){
        HashMap<String,Page<SingerInfo>> hm=new HashMap<>();
        Page<SingerInfo> page=singerInfoService.getSingerInfoPageByFLANDRG(currPage, sgr_firstLetter,sgr_region,req);
        System.out.println("歌手信息为："+page);
        hm.put("page",page );
        return hm;
    }
    @RequestMapping("/getSingerInfoPageMain")
    public @ResponseBody Object getSingerInfoPageMain(HttpServletRequest req){
        HashMap<String,List<SingerInfo>> hm=new HashMap<>();
        List<SingerInfo> listMain=singerInfoService.getSingerInfoPageMain(req);
        System.out.println("歌手首页显示的信息为："+listMain);
        hm.put("listMain",listMain);
        return hm;
    }

}
