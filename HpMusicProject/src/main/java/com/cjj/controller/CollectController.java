package com.cjj.controller;

import com.cjj.service.InfCollectService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;

@Controller
@RequestMapping("/collect")
public class CollectController {
    @Autowired
    private InfCollectService songCollectService;

    /**
     * 添加收藏的歌曲
     * @param sg_id
     * @param req
     * @return
     */
    @RequestMapping("/addCollectSong")
    public @ResponseBody
    Object addCollectSong(int sg_id,HttpServletRequest req){
        HashMap<String,String> hm=new HashMap<>();
        hm= (HashMap<String, String>) songCollectService.addCollectSong(sg_id,req );
        System.out.println("添加收藏歌曲的状态为:"+hm);
        return hm;
    }

    /**
     * 获取该用户的收藏歌曲
     * @param req
     * @return
     */
    @RequestMapping("/getCollectSongs")
    public @ResponseBody
    Object getCollectSongs(HttpServletRequest req){
        HashMap<String,String> hm=new HashMap<>();
        hm= (HashMap<String, String>) songCollectService.getCollectSongs(req);
        System.out.println("获取收藏歌曲的状态为:"+hm);
        return hm;
    }

    /**
     * 删除收藏的歌曲
     * @param sg_id
     * @param req
     * @return
     */
    @RequestMapping("/deleteCollectSong")
    public @ResponseBody
    Object deleteCollectSong(int sg_id,HttpServletRequest req){
        HashMap<String,String> hm=new HashMap<>();
        hm= (HashMap<String, String>) songCollectService.deleteCollectSong(sg_id,req);
        System.out.println("删除收藏歌曲的状态为:"+hm);
        return hm;
    }

    /**
     * 添加收藏的歌单
     * @param sl_id
     * @param req
     * @return
     */
    @RequestMapping("/addCollectSongList")
    public @ResponseBody
    Object addCollectSongList(int sl_id,HttpServletRequest req){
        HashMap<String,String> hm=new HashMap<>();
        hm= (HashMap<String, String>) songCollectService.addCollectSongList(sl_id, req);
        System.out.println("添加收藏歌单的状态为:"+hm);
        return hm;
    }

    /**
     * 获取收藏的歌单
     * @param req
     * @return
     */
    @RequestMapping("/getCollectSongLists")
    public @ResponseBody
    Object getCollectSongLists(HttpServletRequest req){
        HashMap<String,String> hm=new HashMap<>();
        hm= (HashMap<String, String>) songCollectService.getCollectSongLists(req);
        System.out.println("获取收藏歌单为:"+hm);
        return hm;
    }
    /**
     * 删除收藏的歌单
     * @param sl_id
     * @param req
     * @return
     */
    @RequestMapping("/deleteCollectSongList")
    public @ResponseBody
    Object deleteCollectSongList(int sl_id,HttpServletRequest req){
        HashMap<String,String> hm=new HashMap<>();
        hm= (HashMap<String, String>) songCollectService.deleteCollectSongList(sl_id, req);
        System.out.println("删除收藏歌单的状态为:"+hm);
        return hm;
    }
}
