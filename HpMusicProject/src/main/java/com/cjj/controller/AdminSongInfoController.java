package com.cjj.controller;

import com.cjj.entity.Page;
import com.cjj.entity.SingerInfo;
import com.cjj.entity.SongInfo;
import com.cjj.service.InfAdminSongInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.util.HashMap;

@Controller
@RequestMapping("/adminSongInfo")
public class AdminSongInfoController {
    @Autowired
    private InfAdminSongInfoService adminSongInfoService;
    /**
     * 添加歌曲
     * @param songInfo
     * @param req
     * @return
     * @throws IOException
     */
    @RequestMapping("/addSongInfo")
    public @ResponseBody
    Object
    addSongInfo(SongInfo songInfo, HttpServletRequest req ) throws IOException {
        HashMap<String,String> hm=new HashMap<>();
        hm= (HashMap<String, String>) adminSongInfoService.addSongInfo(songInfo ,req);
        System.out.println("添加歌曲信息状态:"+hm);
        return hm;
    }

    /**
     * 添加歌曲文件和封面
     * @param file
     * @param req
     * @return
     * @throws IOException
     */
    @RequestMapping("/addSongInfoFile")
    public @ResponseBody Object
    addSongInfoFile(MultipartFile file, HttpServletRequest req ) throws IOException {
        HashMap<String,String> hm=new HashMap<>();
        hm= (HashMap<String, String>) adminSongInfoService.addSongInfoFile(file ,req);
        System.out.println("添加歌曲封面和文件的状态:"+hm);
        return hm;
    }

    /**
     * 获取所有歌曲
     * @param currPage
     * @param req
     * @return
     * @throws IOException
     */
    @RequestMapping("/getSongInfoTopPage")
    public @ResponseBody Object
    getSongInfoTopPage(int currPage, HttpServletRequest req ) throws IOException {
        HashMap<String, Page<SongInfo>> hm = new HashMap<>();
        Page<SongInfo> page = adminSongInfoService.getSongInfoTopPage(currPage, req);
        System.out.println("歌曲信息为：" + page);
        hm.put("page", page);
        return hm;
    }
    /**
     * 删除歌曲
     * @param sg_id
     * @return
     * @throws IOException
     */
    @RequestMapping("/deleteSongInfoTop")
    public @ResponseBody
    Object deleteSongInfoTop(int sg_id) throws IOException {
        HashMap<String,String> hm=new HashMap<>();
        hm= (HashMap<String, String>) adminSongInfoService.deleteSongInfoTop(sg_id);
        System.out.println("删除歌曲信息状态:"+hm);
        return hm;
    }
    @RequestMapping("/updateSongInfoTop")
    public @ResponseBody
    Object updateSongInfoTop(SongInfo updSongInfo) throws IOException {
        HashMap<String,String> hm=new HashMap<>();
        hm= (HashMap<String, String>) adminSongInfoService.updateSongInfoTop(updSongInfo);
        System.out.println("更新歌曲信息状态:"+hm);
        return hm;
    }

}
