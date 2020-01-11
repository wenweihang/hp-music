package com.cjj.controller;

import com.cjj.entity.SongInfo;
import com.cjj.service.InfSongInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;

@Controller
@RequestMapping("/songInfo")
public class SongInfoController {
    @Autowired
    private InfSongInfoService songInfoService;

    /**
     * 获取歌曲信息
     * @param sg_songList
     * @param req
     * @return
     */
    @RequestMapping("/getSongs")
    public @ResponseBody Object getSongs(String sg_songList,HttpServletRequest req){
        HashMap<String,List<SongInfo>> hm=new HashMap<>();
        hm= (HashMap<String, List<SongInfo>>) songInfoService.getSongs(sg_songList, req);
        System.out.println("歌曲信息为："+hm);
        return hm;
    }

    /**
     * 获取首页新歌
     * @param req
     * @return
     */
    @RequestMapping("/getNewSongs")
    public @ResponseBody Object getNewSongs(HttpServletRequest req){
        HashMap<String,String> hm=new HashMap<>();
        hm= (HashMap<String, String>) songInfoService.getNewSongs(req);
        System.out.println("获取新歌歌曲的状态为："+hm);
        return hm;
    }
    /**
     * 根据地区获取首页新歌
     * @param req
     * @return
     */
    @RequestMapping("/getNewSongsByRG")
    public @ResponseBody Object getNewSongsByRG(String sg_language,HttpServletRequest req){
        HashMap<String,String> hm=new HashMap<>();
        hm= (HashMap<String, String>) songInfoService.getNewSongsByRG(sg_language,req);
        System.out.println("获取新歌歌曲的状态为："+hm);
        return hm;
    }
    /**
     * 根据地区获取首页新歌
     * @param req
     * @return
     */
    @RequestMapping("/getSongInfoByName")
    public @ResponseBody Object getSongInfoByName(String sg_author,HttpServletRequest req){
        HashMap<String,String> hm=new HashMap<>();
        hm= (HashMap<String, String>) songInfoService.getSongInfoByName(sg_author,req);
        System.out.println("获取歌手的所有歌曲的状态为："+hm);
        return hm;
    }

    /**
     * 获取排行榜TOP10新歌
     * @param sg_new
     * @param req
     * @return
     */
    @RequestMapping("/getTopNewSongs")
    public @ResponseBody Object getTopNewSongs(String sg_new,HttpServletRequest req){
        HashMap<String,String> hm=new HashMap<>();
        hm= (HashMap<String, String>) songInfoService.getTopNewSongs(sg_new,req);
        System.out.println("获取排行榜TOP10的歌曲的状态为："+hm);
        return hm;
    }
    /**
     * 获取排行榜TOP10新歌
     * @param sg_hot
     * @param req
     * @return
     */
    @RequestMapping("/getTopHotSongs")
    public @ResponseBody Object getTopHotSongs(String sg_hot,HttpServletRequest req){
        HashMap<String,String> hm=new HashMap<>();
        hm= (HashMap<String, String>) songInfoService.getTopHotSongs(sg_hot,req);
        System.out.println("获取排行榜TOP10的歌曲的状态为："+hm);
        return hm;
    }
    /**
     * 获取排行榜TOP10流行歌
     * @param sg_pop
     * @param req
     * @return
     */
    @RequestMapping("/getTopPopSongs")
    public @ResponseBody Object getTopPopSongs(String sg_pop,HttpServletRequest req){
        HashMap<String,String> hm=new HashMap<>();
        hm= (HashMap<String, String>) songInfoService.getTopPopSongs(sg_pop,req);
        System.out.println("获取排行榜TOP10的歌曲的状态为："+hm);
        return hm;
    }
    /**
     * 获取排行榜前4首歌曲
     * @param sg_language
     * @param req
     * @return
     */
    @RequestMapping("/getTopFourSongs")
    public @ResponseBody Object getTopFourSongs(String sg_language,HttpServletRequest req){
        HashMap<String,List<SongInfo>> hm=new HashMap<>();
        List<SongInfo> topFourList=songInfoService.getTopFourSongs(sg_language,req);
        hm.put("topFourList", topFourList);
        return hm;
    }
    /**
     * 根据搜索内容获取相应歌曲
     * @param text
     * @param req
     * @return
     */
    @RequestMapping("/getSongInfoByText")
    public @ResponseBody Object getSongInfoByText(String text,HttpServletRequest req){
        HashMap<String,String> hm=new HashMap<>();
        hm= (HashMap<String, String>) songInfoService.getSongInfoByText(text,req );
        System.out.println("获取搜索相应歌曲的状态为:"+hm);
        return hm;
    }

}
