package com.cjj.controller;

import com.cjj.entity.Page;
import com.cjj.entity.SongInfo;
import com.cjj.entity.SongZJ;
import com.cjj.service.InfAdminSongZJService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;

@Controller
@RequestMapping("/adminSongZJ")
public class AdminSongZJController {
    @Autowired
    private InfAdminSongZJService adminSongZJService;
    /**
     * 获取所有专辑
     * @param currPage
     * @param req
     * @return
     */
    @RequestMapping("/getAllSongZJ")
    public @ResponseBody
    Object getAllSongZJ(int currPage, HttpServletRequest req) {
        HashMap<String,Page<SongZJ>> hm=new HashMap<>();
        Page<SongZJ> page=adminSongZJService.getSongZJPage(currPage,req);
        System.out.println("歌单信息：" + page);
        hm.put("page",page );
        return hm;
    }

    /**
     * 添加专辑
     * @param songZJ
     * @param req
     * @return
     * @throws IOException
     */
    @RequestMapping("/addSongZJ")
    public @ResponseBody Object
    addSongZJ(SongZJ songZJ,HttpServletRequest req) throws IOException {
        HashMap<String,String> hm=new HashMap<>();
        hm= (HashMap<String, String>) adminSongZJService.addSongZJ(songZJ,req                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 );
        System.out.println("添加专辑状态:"+hm);
        return hm;
    }

    /**
     * 添加专辑封面
     * @param file
     * @param req
     * @return
     * @throws IOException
     */
    @RequestMapping("/addSongZJImg")
    public @ResponseBody Object
    addSongZJImg(MultipartFile file, HttpServletRequest req ) throws IOException {
        HashMap<String,String> hm=new HashMap<>();
        hm= (HashMap<String, String>) adminSongZJService.addSongZJImg(file,req );
        System.out.println("添加专辑封面状态：" + hm);
        return hm;
    }
    /**
     * 获取歌单中的歌曲信息
     * @param currPage
     * @param szj_id
     * @param req
     * @return
     * @throws IOException
     */
    @RequestMapping("/getSongInfo")
    public @ResponseBody Object
    getSongInfo(int currPage,int szj_id, HttpServletRequest req ) throws IOException {
        HashMap<String,Page<SongInfo>> hm=new HashMap<>();
        Page<SongInfo> page=adminSongZJService.getSongInfo(currPage, szj_id, req);
        System.out.println("专辑"+szj_id+"信息:"+page);
        hm.put("page",page );
        return hm;
    }

    /**
     * 获取所有歌曲的名称
     * @param req
     * @return
     * @throws IOException
     */
    @RequestMapping("/getAllSongInfo")
    public @ResponseBody Object
    getAllSongInfo( HttpServletRequest req ) throws IOException {
        HashMap<String,List<String>> hm=new HashMap<>();
        List<String> sg_namelist=adminSongZJService.getAllSongInfo( req);
        hm.put("lists",sg_namelist);
        return hm;
    }

    /**
     * 添加专辑歌曲
     * @param songInfo
     * @return
     * @throws IOException
     */
    @RequestMapping("/addSongInfo")
    public @ResponseBody Object
    addSongInfo(SongInfo songInfo) throws IOException {
        HashMap<String,String> hm=new HashMap<>();
        hm= (HashMap<String, String>) adminSongZJService.addSongInfo( songInfo);
        return hm;
    }

}
