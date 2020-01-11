package com.cjj.service.implclass;

import com.cjj.dao.InfCollectDao;
import com.cjj.dao.InfSongInfoDao;
import com.cjj.dao.InfSongListDao;
import com.cjj.entity.SongInfo;
import com.cjj.entity.SongList;
import com.cjj.entity.User;
import com.cjj.service.InfCollectService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

@Service
public class CollectService implements InfCollectService {
    @Autowired
    private InfCollectDao songCollectDao;
    @Autowired
    private InfSongInfoDao songInfoDao;
    @Autowired
    private InfSongListDao songListDao;

    @Override
    public Object addCollectSong(int sg_id, HttpServletRequest req) {
        HashMap<String,String> hm=new HashMap<>();
        //获取当前用户
        User logUser= (User) req.getSession().getAttribute("logUser");
        String uer_act=logUser.getUer_act();
        int result=songCollectDao.addSongCollect(uer_act,sg_id );
        if(result>0){
            System.out.println("歌曲收藏成功");
            hm.put("stateCollectSong", "1");
            return hm;
        }
        System.out.println("歌曲收藏失败");
        hm.put("stateCollectSong", "0");
        return hm;
    }

    @Override
    public Object getCollectSongs(HttpServletRequest req) {
        HashMap<String,String> hm=new HashMap<>();
        List<SongInfo> collectSongList=new ArrayList<>();
        //获取当前用户
        User logUser= (User) req.getSession().getAttribute("logUser");
        String uer_act=logUser.getUer_act();
        //获取用户的收藏id
        List<Integer> IDList=songCollectDao.selectSongCollectID(uer_act);
        System.out.println("用户的收藏歌曲ID信息为:"+IDList);
        if(IDList.size()==0||IDList.isEmpty()){
            //如果该用户未收藏歌曲,直接返回
            System.out.println("该用户未存在收藏的歌曲");
            req.getSession().getServletContext().setAttribute("collectSongList", collectSongList);
            hm.put("stateGetCollectSongs","0");
            return hm;
        }else {
            System.out.println("该用户存在收藏的歌曲");
            for(int ID: IDList){
                SongInfo song=songInfoDao.selectSongByID(ID);
                song.setCollect("yes");
                collectSongList.add(song);
            }
            req.getSession().getServletContext().setAttribute("collectSongList", collectSongList);
            System.out.println("通过ID查找的歌曲列表为:"+collectSongList);
            hm.put("stateGetCollectSongs","1");
            return hm;
        }
    }

    @Override
    public Object deleteCollectSong(int sg_id, HttpServletRequest req) {
        HashMap<String,String> hm=new HashMap<>();
        //获取当前用户
        User logUser= (User) req.getSession().getAttribute("logUser");
        String uer_act=logUser.getUer_act();
        //删除收藏歌曲
        int result=songCollectDao.deleteSongCollect(uer_act, sg_id);
        if(result>0){
            System.out.println("取消收藏成功");
            hm.put("stateDelCollectSong", "1");
            return hm;
        }
        System.out.println("取消收藏失败");
        hm.put("stateDelCollectSong", "0");
        return hm;
    }

    @Override
    public Object addCollectSongList(int sl_id, HttpServletRequest req) {
        HashMap<String,String> hm=new HashMap<>();
        //获取当前用户
        User logUser= (User) req.getSession().getAttribute("logUser");
        String uer_act=logUser.getUer_act();
        int result=songCollectDao.addSongListCollect(uer_act,sl_id );
        if(result>0){
            System.out.println("歌单收藏成功");
            hm.put("stateCollectSongList", "1");
            return hm;
        }
        System.out.println("歌单收藏失败");
        hm.put("stateCollectSongList", "0");
        return hm;
    }

    @Override
    public Object getCollectSongLists(HttpServletRequest req) {
        HashMap<String,List<SongList>> hm=new HashMap<>();
        List<SongList> collectSongLists=new ArrayList<>();
        //获取当前用户
        User logUser= (User) req.getSession().getAttribute("logUser");
        String uer_act=logUser.getUer_act();
        //获取用户的收藏id
        System.out.println(uer_act);
        List<Integer> IDList=songCollectDao.selectSongListCollectID(uer_act);
        System.out.println("用户的收藏歌单ID信息为:"+IDList);
        if(IDList.size()==0||IDList.isEmpty()){
            //如果该用户未收藏歌曲,直接返回
            System.out.println("该用户未存在收藏的歌单");
//            req.getSession().getServletContext().setAttribute("collectSongLists", collectSongLists);
            hm.put("collectSongLists",null);
            return hm;
        }else {
            System.out.println("该用户存在收藏的歌单");
            for(int ID: IDList){
                SongList songList=songListDao.selectSongListByID(ID);
                songList.setCollect("yes");
                collectSongLists.add(songList);
            }
//            req.getSession().getServletContext().setAttribute("collectSongLists", collectSongLists);
            System.out.println("通过ID查找的歌单列表为:"+collectSongLists);
            hm.put("collectSongLists",collectSongLists);
            return hm;
        }
    }

    @Override
    public Object deleteCollectSongList(int sl_id, HttpServletRequest req) {
        HashMap<String,String> hm=new HashMap<>();
        //获取当前用户
        User logUser= (User) req.getSession().getAttribute("logUser");
        String uer_act=logUser.getUer_act();
        //删除收藏歌曲
        int result=songCollectDao.deleteSongListCollect(uer_act,sl_id );
        if(result>0){
            System.out.println("取消歌单收藏成功");
            hm.put("stateDelCollectSongList", "1");
            return hm;
        }
        System.out.println("取消歌单收藏失败");
        hm.put("stateDelCollectSongList", "0");
        return hm;
    }
}
