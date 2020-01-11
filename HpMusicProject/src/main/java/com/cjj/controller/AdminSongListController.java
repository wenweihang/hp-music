package com.cjj.controller;

import com.cjj.entity.Page;
import com.cjj.entity.SongInfo;
import com.cjj.entity.SongList;
import com.cjj.service.InfAdminSongListService;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.util.HashMap;

@Controller
@RequestMapping("/adminSongList")
public class AdminSongListController {
    @Autowired
    private InfAdminSongListService adminSongListService;

    /**
     * 获取所有歌单
     * @param currPage
     * @param req
     * @return
     */
    @RequestMapping("/getAllSongList")
    public @ResponseBody Object getAllSongList(int currPage,HttpServletRequest req) {
        HashMap<String,Page<SongList>> hm=new HashMap<>();
        Page<SongList> page=adminSongListService.getSongListPage(currPage,req);
        System.out.println("歌单信息：" + page);
        hm.put("page",page );
        return hm;
    }

    /**
     * 添加歌单
     * @param songList
     * @param req
     * @return
     * @throws IOException
     */
    @RequestMapping("/addSongList")
    public @ResponseBody Object
    addSongList(SongList songList,HttpServletRequest req) throws IOException {
        HashMap<String,String> hm=new HashMap<>();
        hm= (HashMap<String, String>) adminSongListService.addSongList(songList,req);
        System.out.println("添加歌单状态:"+hm);
        return hm;
    }

    /**
     * 添加歌单封面
     * @param file
     * @param req
     * @return
     * @throws IOException
     */
    @RequestMapping("/addSongListImg")
    public @ResponseBody Object
    addSongListImg(MultipartFile file, HttpServletRequest req ) throws IOException {
        HashMap<String,String> hm=new HashMap<>();
        hm= (HashMap<String, String>) adminSongListService.addSongListImg(file,req);
        System.out.println("图片信息：" + file);
        System.out.println("添加歌单封面状态：" + hm);
        return hm;
    }

    /**
     * 获取歌单中的歌曲信息
     * @param currPage
     * @param sg_songList
     * @param req
     * @return
     * @throws IOException
     */
    @RequestMapping("/getSongInfo")
    public @ResponseBody Object
    getSongInfo(int currPage,String sg_songList, HttpServletRequest req ) throws IOException {
        HashMap<String,Page<SongInfo>> hm=new HashMap<>();
        Page<SongInfo> page=adminSongListService.getSongInfo(currPage,sg_songList ,req );
        System.out.println("歌单"+sg_songList+"信息:"+page);
        hm.put("page",page );
        return hm;
    }

    /**
     * 删除歌单中的歌曲
     * @param sg_name
     * @param req
     * @return
     * @throws IOException
     */
    @RequestMapping("/deleteSongInfo")
    public @ResponseBody Object
    deleteSongInfo(String sg_name, HttpServletRequest req ) throws IOException {
        HashMap<String,String> hm=new HashMap<>();
        hm= (HashMap<String, String>) adminSongListService.deleteSongInfo(sg_name ,req);
        return hm;
    }

    /**
     * 删除歌单
     * @param sl_name
     * @param req
     * @return
     * @throws IOException
     */
    @RequestMapping("/deleteSongList")
    public @ResponseBody Object
    deleteSongList(String sl_name, HttpServletRequest req ) throws IOException {
        HashMap<String,String> hm=new HashMap<>();
        hm= (HashMap<String, String>) adminSongListService.deleteSongList(sl_name,req );
        System.out.println("删除歌单的状态:"+hm);
        return hm;
    }

    /**
     * 修改首页显示的歌单
     * @param sl_id
     * @param sl_main
     * @param req
     * @return
     * @throws IOException
     */
    @RequestMapping("/updSongList")
    public @ResponseBody Object
    updSongList(int sl_id,String sl_main, HttpServletRequest req ) throws IOException {
        HashMap<String,String> hm=new HashMap<>();
        hm= (HashMap<String, String>) adminSongListService.updSongList(sl_id,sl_main ,req );
        System.out.println("修改首页显示的歌单状态:"+hm);
        return hm;
    }
    @RequestMapping("/addSongInfoToSL")
    public @ResponseBody Object
    addSongInfoToSL(SongInfo songInfo, HttpServletRequest req ){
        HashMap<String,String> hm=new HashMap<>();
        hm= (HashMap<String, String>) adminSongListService.addSongInfoToSL(songInfo ,req );
        System.out.println("向歌单添加歌曲的状态:"+hm);
        return hm;
    }

}
