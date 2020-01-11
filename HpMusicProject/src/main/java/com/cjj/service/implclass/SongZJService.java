package com.cjj.service.implclass;

import com.cjj.dao.InfSongZJDao;
import com.cjj.entity.SongZJ;
import com.cjj.service.InfSongZJService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;

@Service
public class SongZJService implements InfSongZJService {
    @Autowired
    private InfSongZJDao songZJDao;
    @Override
    public Object getSongZJByName(String szj_author, HttpServletRequest req) {
        HashMap<String,String> hm=new HashMap<>();
        List<SongZJ> singerSongZJList=songZJDao.selectSongZJByName(szj_author);
        System.out.println("歌手"+szj_author+"的专辑为:"+singerSongZJList);
        req.getSession().getServletContext().setAttribute("singerSongZJList", singerSongZJList);
        hm.put("stateGetSongZJByName", "1");
        return hm;
    }
}
