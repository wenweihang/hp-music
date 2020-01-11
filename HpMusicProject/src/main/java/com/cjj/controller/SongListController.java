package com.cjj.controller;

import com.cjj.service.InfSongListService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
@Controller
@RequestMapping("/songList")
public class SongListController {
    @Autowired
    private InfSongListService songListService;
    /**
     * 首页获取5个歌单
     * @param req
     * @return
     */
    @RequestMapping("/getSongListMain")
    public @ResponseBody
    Object getSongListMain(HttpServletRequest req ){
        HashMap<String,String> hm=new HashMap<>();
        hm= (HashMap<String, String>) songListService.getSongListMain(req);
        System.out.println("获取首页5个歌单的状态:"+hm);
        return hm;
    }
    @RequestMapping("/getSongLists")
    public @ResponseBody Object getSongLists(HttpServletRequest req ){
        HashMap<String,String> hm=new HashMap<>();
        hm= (HashMap<String, String>) songListService.getSongListMain(req);
        System.out.println("获取歌单的状态:"+hm);
        return hm;
    }

    /**
     * 获取全部歌单
     * @param req
     * @return
     */
    @RequestMapping("/getAllSongLists")
    public @ResponseBody Object getAllSongLists(HttpServletRequest req ){
        HashMap<String,String> hm=new HashMap<>();
        hm= (HashMap<String, String>) songListService.getAllSongLists(req);
        System.out.println("获取所有歌单的状态:"+hm);
        return hm;
    }
    /**
     * 获取最新歌单
     * @param req
     * @return
     */
    @RequestMapping("/getNewSongLists")
    public @ResponseBody Object getNewSongLists(String sl_new,HttpServletRequest req ){
        HashMap<String,String> hm=new HashMap<>();
        hm= (HashMap<String, String>) songListService.getNewSongLists(sl_new,req);
        System.out.println("获取最新歌单的状态:"+hm);
        return hm;
    }
    /**
     * 获取最热歌单
     * @param req
     * @return
     */
    @RequestMapping("/getHotSongLists")
    public @ResponseBody Object getHotSongLists(String sl_hot,HttpServletRequest req ){
        HashMap<String,String> hm=new HashMap<>();
        hm= (HashMap<String, String>) songListService.getHotSongLists(sl_hot,req);
        System.out.println("获取最热歌单的状态:"+hm);
        return hm;
    }
}
