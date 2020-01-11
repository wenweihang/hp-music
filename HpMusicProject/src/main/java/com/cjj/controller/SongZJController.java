package com.cjj.controller;

import com.cjj.service.InfSongZJService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;

@Controller
@RequestMapping("/songZJ")
public class SongZJController {
    @Autowired
    private InfSongZJService songZJService;

    /**
     * 根据歌手名称获取专辑
     * @param szj_author
     * @param req
     * @return
     */
    @RequestMapping("/getSongZJByName")
    public @ResponseBody Object getSongZJByName(String szj_author, HttpServletRequest req) {
        HashMap<String,String> hm=new HashMap<>();
        hm= (HashMap<String, String>) songZJService.getSongZJByName(szj_author,req );
        System.out.println("获取歌手专辑的状态为:"+hm);
        return hm;
    }
}
