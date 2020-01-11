package com.cjj.utils;

import com.cjj.dao.InfCollectDao;
import com.cjj.entity.SongInfo;
import com.cjj.entity.User;
import org.springframework.beans.factory.annotation.Autowired;


import javax.servlet.http.HttpServletRequest;
import java.util.List;

public class SongCollectionUtil {
    private static InfCollectDao songCollectDao;
    public static void songCollection(List<SongInfo> songInfoList, HttpServletRequest req){
        //获取用户信息
        User logUser = (User) req.getSession().getAttribute("logUser");
        String uer_act = logUser.getUer_act();
        for (SongInfo songInfo : songInfoList) {
            int sg_id = songInfo.getSg_id();
            int result = songCollectDao.selectIsSongCollect(uer_act, sg_id);
            if (result > 0) {
                //说明存在该歌曲的收藏
                System.out.println("歌曲ID：" + sg_id + "是收藏歌曲");
                songInfo.setCollect("yes");
            }
        }
    }
}
