package com.cjj.service.implclass;

import com.cjj.dao.InfCollectDao;
import com.cjj.dao.InfSongInfoDao;
import com.cjj.dao.InfSongZJDao;
import com.cjj.entity.Page;
import com.cjj.entity.SongInfo;
import com.cjj.entity.User;
import com.cjj.service.InfSongInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

@Service
public class SongInfoService implements InfSongInfoService {
    @Autowired
    private InfSongInfoDao songInfoDao;
    @Autowired
    private InfCollectDao songCollectDao;
    @Autowired
    private InfSongZJDao songZJDao;

    @Override
    public Object getSongs(String sg_songList, HttpServletRequest req) {
        HashMap<String, List<SongInfo>> hm = new HashMap<>();
        List<SongInfo> songs = songInfoDao.selectAll(sg_songList);
        //获取用户信息
        User logUser = (User) req.getSession().getAttribute("logUser");
        if (logUser == null) {
            for (SongInfo song : songs) {
                int szj_id = song.getSzj_id();
                String szj_title = songZJDao.selectZJtitleByID(szj_id);
                String szj_detail=songZJDao.selectZJdetailByID(szj_id);
                song.setSzj_title(szj_title);
                song.setSzj_detail(szj_detail);
            }
            req.getSession().getServletContext().setAttribute("songs", songs);
            hm.put("songs", songs);
            return hm;
        }
        String uer_act = logUser.getUer_act();
        for (SongInfo song : songs) {
            //获取专辑标题和介绍
            int szj_id = song.getSzj_id();
            String szj_title = songZJDao.selectZJtitleByID(szj_id);
            String szj_detail=songZJDao.selectZJdetailByID(szj_id);
            song.setSzj_title(szj_title);
            song.setSzj_detail(szj_detail);
            //判断歌曲是否为收藏
            int sg_id = song.getSg_id();
            int result = songCollectDao.selectIsSongCollect(uer_act, sg_id);
            if (result > 0) {
                //说明存在该歌曲的收藏
                song.setCollect("yes");
            }
        }
        req.getSession().getServletContext().setAttribute("songs", songs);
        hm.put("songs", songs);
        return hm;
    }

    @Override
    public Object getNewSongs(HttpServletRequest req) {
        HashMap<String, String> hm = new HashMap<>();
        List<SongInfo> newSongList = songInfoDao.selectNewSongInfo();
        //获取用户信息
        User logUser = (User) req.getSession().getAttribute("logUser");
        if (logUser == null) {
            for (SongInfo newSong : newSongList) {
                int szj_id = newSong.getSzj_id();
                String szj_title = songZJDao.selectZJtitleByID(szj_id);
                String szj_detail = songZJDao.selectZJdetailByID(szj_id);
                newSong.setSzj_title(szj_title);
                newSong.setSzj_detail(szj_detail);
            }
            req.getSession().getServletContext().setAttribute("newSongList", newSongList);
            System.out.println("新歌信息为：" + newSongList);
            hm.put("stateGetNewSongs", "1");
            return hm;
        }
        String uer_act = logUser.getUer_act();
        for (SongInfo newSong : newSongList) {
            int szj_id = newSong.getSzj_id();
            String szj_title = songZJDao.selectZJtitleByID(szj_id);
            String szj_detail = songZJDao.selectZJdetailByID(szj_id);
            newSong.setSzj_title(szj_title);
            newSong.setSzj_detail(szj_detail);
            int sg_id = newSong.getSg_id();
            int result = songCollectDao.selectIsSongCollect(uer_act, sg_id);
            if (result > 0) {
                //说明存在该歌曲的收藏
                System.out.println("歌曲ID：" + sg_id + "是收藏歌曲");
                newSong.setCollect("yes");
            }
        }
        System.out.println("新歌信息为：" + newSongList);
        req.getSession().getServletContext().setAttribute("newSongList", newSongList);
        hm.put("stateGetNewSongs", "1");
        return hm;
    }

    @Override
    public Object getNewSongsByRG(String sg_language, HttpServletRequest req) {
        HashMap<String, String> hm = new HashMap<>();
        List<SongInfo> newSongList = songInfoDao.selectNewSongInfoByRG(sg_language);
        //获取用户信息
        User logUser = (User) req.getSession().getAttribute("logUser");
        if (logUser == null) {
            for (SongInfo newSong : newSongList) {
                int szj_id = newSong.getSzj_id();
                String szj_title = songZJDao.selectZJtitleByID(szj_id);
                String szj_detail = songZJDao.selectZJdetailByID(szj_id);
                newSong.setSzj_title(szj_title);
                newSong.setSzj_detail(szj_detail);
            }
            req.getSession().getServletContext().setAttribute("newSongList", newSongList);
            System.out.println("新歌信息为：" + newSongList);
            hm.put("stateGetNewSongsByRG", "1");
            return hm;
        }
        String uer_act = logUser.getUer_act();
        for (SongInfo newSong : newSongList) {
            int szj_id = newSong.getSzj_id();
            String szj_title = songZJDao.selectZJtitleByID(szj_id);
            String szj_detail = songZJDao.selectZJdetailByID(szj_id);
            newSong.setSzj_title(szj_title);
            newSong.setSzj_detail(szj_detail);
            int sg_id = newSong.getSg_id();
            int result = songCollectDao.selectIsSongCollect(uer_act, sg_id);
            if (result > 0) {
                //说明存在该歌曲的收藏
                System.out.println("歌曲ID：" + sg_id + "是收藏歌曲");
                newSong.setCollect("yes");
            }
        }
        System.out.println("新歌信息为：" + newSongList);
        req.getSession().getServletContext().setAttribute("newSongList", newSongList);
        hm.put("stateGetNewSongsByRG", "1");
        return hm;
    }

    @Override
    public Object getSongInfoByName(String sg_author, HttpServletRequest req) {
        HashMap<String, String> hm = new HashMap<>();
        List<SongInfo> songsForSingerList = songInfoDao.selectSongInfoByName(sg_author);
        //获取用户信息
        User logUser = (User) req.getSession().getAttribute("logUser");
        if (logUser == null) {
            for (SongInfo songForSinger : songsForSingerList) {
                int szj_id = songForSinger.getSzj_id();
                String szj_title = songZJDao.selectZJtitleByID(szj_id);
                String szj_detail=songZJDao.selectZJdetailByID(szj_id);
                songForSinger.setSzj_title(szj_title);
                songForSinger.setSzj_detail(szj_detail);
            }
            req.getSession().getServletContext().setAttribute("songsForSingerList", songsForSingerList);
            System.out.println("歌手的所有歌曲信息为：" + songsForSingerList);
            hm.put("stateGetSongsByName", "1");
            return hm;
        }
        String uer_act = logUser.getUer_act();
        for (SongInfo songForSinger : songsForSingerList) {
            int szj_id = songForSinger.getSzj_id();
            String szj_title = songZJDao.selectZJtitleByID(szj_id);
            String szj_detail=songZJDao.selectZJdetailByID(szj_id);
            songForSinger.setSzj_title(szj_title);
            songForSinger.setSzj_detail(szj_detail);
            int sg_id = songForSinger.getSg_id();
            int result = songCollectDao.selectIsSongCollect(uer_act, sg_id);
            if (result > 0) {
                //说明存在该歌曲的收藏
                System.out.println("歌曲ID：" + sg_id + "是收藏歌曲");
                songForSinger.setCollect("yes");
            }
        }
        System.out.println("歌手的所有歌曲信息为：" + songsForSingerList);
        req.getSession().getServletContext().setAttribute("songsForSingerList", songsForSingerList);
        hm.put("stateGetSongsByName", "1");
        return hm;
    }

    @Override
    public Object getTopNewSongs(String sg_new, HttpServletRequest req) {
        HashMap<String, String> hm = new HashMap<>();
        List<SongInfo> topSongList = songInfoDao.selectTopNewSongs(sg_new);
        //获取用户信息
        User logUser = (User) req.getSession().getAttribute("logUser");
        if (logUser == null) {
            for (SongInfo topSong : topSongList) {
                int szj_id = topSong.getSzj_id();
                String szj_title = songZJDao.selectZJtitleByID(szj_id);
                String szj_detail = songZJDao.selectZJdetailByID(szj_id);
                topSong.setSzj_title(szj_title);
                topSong.setSzj_detail(szj_detail);
            }
            System.out.println("排行榜top10新歌的信息为:" + topSongList);
            req.getSession().getServletContext().setAttribute("topSongList", topSongList);
            hm.put("stateGetTopSongs", "1");
            return hm;
        }
        String uer_act = logUser.getUer_act();
        for (SongInfo topSong : topSongList) {
            int szj_id = topSong.getSzj_id();
            String szj_title = songZJDao.selectZJtitleByID(szj_id);
            String szj_detail = songZJDao.selectZJdetailByID(szj_id);
            topSong.setSzj_title(szj_title);
            topSong.setSzj_detail(szj_detail);
            int sg_id = topSong.getSg_id();
            int result = songCollectDao.selectIsSongCollect(uer_act, sg_id);
            if (result > 0) {
                //说明存在该歌曲的收藏
                System.out.println("歌曲ID：" + sg_id + "是收藏歌曲");
                topSong.setCollect("yes");
            }
        }
        System.out.println("排行榜top10新歌的信息为:" + topSongList);
        req.getSession().getServletContext().setAttribute("topSongList", topSongList);
        hm.put("stateGetTopSongs", "1");
        return hm;
    }

    @Override
    public Object getTopHotSongs(String sg_hot, HttpServletRequest req) {
        HashMap<String, String> hm = new HashMap<>();
        List<SongInfo> topSongList = songInfoDao.selectTopHotSongs(sg_hot);
        //获取用户信息
        User logUser = (User) req.getSession().getAttribute("logUser");
        if (logUser == null) {
            for (SongInfo topSong : topSongList) {
                int szj_id = topSong.getSzj_id();
                String szj_title = songZJDao.selectZJtitleByID(szj_id);
                String szj_detail = songZJDao.selectZJdetailByID(szj_id);
                topSong.setSzj_title(szj_title);
                topSong.setSzj_detail(szj_detail);

            }
            System.out.println("排行榜top10新歌的信息为:" + topSongList);
            req.getSession().getServletContext().setAttribute("topSongList", topSongList);
            hm.put("stateGetTopSongs", "1");
            return hm;
        }
        String uer_act = logUser.getUer_act();
        for (SongInfo topSong : topSongList) {
            int szj_id = topSong.getSzj_id();
            String szj_title = songZJDao.selectZJtitleByID(szj_id);
            String szj_detail = songZJDao.selectZJdetailByID(szj_id);
            topSong.setSzj_title(szj_title);
            topSong.setSzj_detail(szj_detail);
            int sg_id = topSong.getSg_id();
            int result = songCollectDao.selectIsSongCollect(uer_act, sg_id);
            if (result > 0) {
                //说明存在该歌曲的收藏
                System.out.println("歌曲ID：" + sg_id + "是收藏歌曲");
                topSong.setCollect("yes");
            }
        }
        System.out.println("排行榜top10热歌的信息为:" + topSongList);
        req.getSession().getServletContext().setAttribute("topSongList", topSongList);
        hm.put("stateGetTopSongs", "1");
        return hm;
    }

    @Override
    public Object getTopPopSongs(String sg_pop, HttpServletRequest req) {
        HashMap<String, String> hm = new HashMap<>();
        List<SongInfo> topSongList = songInfoDao.selectTopPopSongs(sg_pop);
        //获取用户信息
        User logUser = (User) req.getSession().getAttribute("logUser");
        if (logUser == null) {
            for (SongInfo topSong : topSongList) {
                int szj_id = topSong.getSzj_id();
                String szj_title = songZJDao.selectZJtitleByID(szj_id);
                String szj_detail = songZJDao.selectZJdetailByID(szj_id);
                topSong.setSzj_title(szj_title);
                topSong.setSzj_detail(szj_detail);
            }
            System.out.println("排行榜top10新歌的信息为:" + topSongList);
            req.getSession().getServletContext().setAttribute("topSongList", topSongList);
            hm.put("stateGetTopSongs", "1");
            return hm;
        }
        String uer_act = logUser.getUer_act();
        for (SongInfo topSong : topSongList) {
            int szj_id = topSong.getSzj_id();
            String szj_title = songZJDao.selectZJtitleByID(szj_id);
            String szj_detail = songZJDao.selectZJdetailByID(szj_id);
            topSong.setSzj_title(szj_title);
            topSong.setSzj_detail(szj_detail);
            int sg_id = topSong.getSg_id();
            int result = songCollectDao.selectIsSongCollect(uer_act, sg_id);
            if (result > 0) {
                //说明存在该歌曲的收藏
                System.out.println("歌曲ID：" + sg_id + "是收藏歌曲");
                topSong.setCollect("yes");
            }
        }
        System.out.println("排行榜top10流行歌的信息为:" + topSongList);
        req.getSession().getServletContext().setAttribute("topSongList", topSongList);
        hm.put("stateGetTopSongs", "1");
        return hm;
    }

    @Override
    public List<SongInfo> getTopFourSongs(String sg_language, HttpServletRequest req) {
        List<SongInfo> topFourList = songInfoDao.selectTopFourSongs(sg_language);
        System.out.println("获取排行榜前4首歌曲信息为:" + topFourList);
        return topFourList;
    }

    @Override
    public Object getSongInfoByText(String text, HttpServletRequest req) {
        HashMap<String, String> hm = new HashMap<>();
        List<SongInfo> searchSongList = songInfoDao.selectSongInfoByText(text);
        //获取用户信息
        User logUser = (User) req.getSession().getAttribute("logUser");
        if (logUser == null) {
            for (SongInfo searchSong : searchSongList) {
                int szj_id = searchSong.getSzj_id();
                String szj_title = songZJDao.selectZJtitleByID(szj_id);
                String szj_detail=songZJDao.selectZJdetailByID(szj_id);
                searchSong.setSzj_title(szj_title);
                searchSong.setSzj_detail(szj_detail);
            }
            req.getSession().getServletContext().setAttribute("searchSongList", searchSongList);
            System.out.println("搜索相关的歌曲信息为:" + searchSongList);
            hm.put("stateGetSearchSongs", "1");
            return hm;
        }
        String uer_act = logUser.getUer_act();
        for (SongInfo searchSong : searchSongList) {
            //获取专辑标题和介绍
            int szj_id = searchSong.getSzj_id();
            String szj_title = songZJDao.selectZJtitleByID(szj_id);
            String szj_detail=songZJDao.selectZJdetailByID(szj_id);
            searchSong.setSzj_title(szj_title);
            searchSong.setSzj_detail(szj_detail);
            //判断歌曲是否为收藏
            int sg_id = searchSong.getSg_id();
            int result = songCollectDao.selectIsSongCollect(uer_act, sg_id);
            if (result > 0) {
                //说明存在该歌曲的收藏
                searchSong.setCollect("yes");
            }
        }
        System.out.println("搜索相关的歌曲信息为:" + searchSongList);
        req.getSession().getServletContext().setAttribute("searchSongList", searchSongList);
        hm.put("stateGetSearchSongs", "1");
        return hm;
    }

}
