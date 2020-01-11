package com.cjj.service.implclass;

import com.cjj.dao.InfCollectDao;
import com.cjj.dao.InfSongListDao;
import com.cjj.entity.SongList;
import com.cjj.entity.User;
import com.cjj.service.InfSongListService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;

@Service
public class SongListService implements InfSongListService {
    @Autowired
    private InfSongListDao songListDao;
    @Autowired
    private InfCollectDao collectDao;

    @Override
    public Object getSongListMain(HttpServletRequest req) {
        HashMap<String, String> hm = new HashMap<>();
        List<SongList> songListMain = songListDao.selectSongListMain();
        //获取用户帐号
        User logUser = (User) req.getSession().getAttribute("logUser");
        if (songListMain.size() > 0 && !songListMain.isEmpty()) {
            System.out.println("首页5歌单为:" + songListMain);
            if (logUser != null) {
                String uer_act = logUser.getUer_act();
                for (SongList songList : songListMain) {
                    int sl_id = songList.getSl_id();
                    int result = collectDao.selectIsSongListCollect(uer_act, sl_id);
                    if (result > 0) {
                        System.out.println("用户存在该歌单的收藏");
                        songList.setCollect("yes");
                    }
                }
            }
            req.getSession().getServletContext().setAttribute("songListMain", songListMain);
            hm.put("stateSLM", "1");
            return hm;
        }
        System.out.println("不存在首页5歌单");
        hm.put("stateSLM", "0");
        return hm;
    }

    @Override
    public Object getSongLists(HttpServletRequest req) {
        HashMap<String, String> hm = new HashMap<>();
        List<SongList> songListMain = songListDao.selectSongListMain();
        if (songListMain.size() > 0 && !songListMain.isEmpty()) {
            System.out.println("首页5歌单为:" + songListMain);
            req.getSession().getServletContext().setAttribute("songListMain", songListMain);
            hm.put("stateSLM", "1");
            return hm;
        }
        System.out.println("不存在首页5歌单");
        hm.put("stateSLM", "0");
        return hm;
    }

    @Override
    public Object getAllSongLists(HttpServletRequest req) {
        HashMap<String, String> hm = new HashMap<>();
        List<SongList> allSongLists = songListDao.selectAllSongLists();
        if (allSongLists.size() > 0 && !allSongLists.isEmpty()) {
            req.getSession().getServletContext().setAttribute("allSongLists", allSongLists);
            hm.put("stateGetAllSongLists", "1");
            return hm;
        }
        System.out.println("不存在歌单");
        hm.put("stateGetAllSongLists", "0");
        return hm;
    }

    @Override
    public Object getNewSongLists(String sl_new, HttpServletRequest req) {
        HashMap<String, String> hm = new HashMap<>();
        List<SongList> newSongLists = songListDao.selectNewSongLists(sl_new);
        if (newSongLists.size() > 0 && !newSongLists.isEmpty()) {
            req.getSession().getServletContext().setAttribute("newSongLists", newSongLists);
            hm.put("stateGetNewSongLists", "1");
            return hm;
        }
        System.out.println("不存在歌单");
        hm.put("stateGetNewSongLists", "0");
        return hm;
    }

    @Override
    public Object getHotSongLists(String sl_hot, HttpServletRequest req) {
        HashMap<String, String> hm = new HashMap<>();
        List<SongList> hotSongLists = songListDao.selectHotSongLists(sl_hot);
        if (hotSongLists.size() > 0 && !hotSongLists.isEmpty()) {
            req.getSession().getServletContext().setAttribute("hotSongLists", hotSongLists);
            hm.put("stateGetHotSongLists", "1");
            return hm;
        }
        System.out.println("不存在歌单");
        hm.put("stateGetHotSongLists", "0");
        return hm;
    }
}
