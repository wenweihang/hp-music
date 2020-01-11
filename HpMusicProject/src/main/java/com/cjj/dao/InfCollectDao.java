package com.cjj.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface InfCollectDao {
    /**
     * 添加收藏的歌曲
     * @param uer_act
     * @param sg_id
     * @return
     */
    public int addSongCollect(@Param("uer_act")String uer_act,@Param("sg_id")int sg_id);
    /**
     * 查询该用户收藏歌曲的id
     * @param uer_act
     * @return
     */
    public List<Integer> selectSongCollectID(String uer_act);

    /**
     * 根据用户名和歌曲id查询是否存在该歌曲的收藏
     * @param uer_act
     * @param sg_id
     * @return
     */
    public int selectIsSongCollect(@Param("uer_act")String uer_act,@Param("sg_id")int sg_id);
    /**
     * 删除收藏的歌曲
     * @param uer_act
     * @param sg_id
     * @return
     */
    public int deleteSongCollect(@Param("uer_act")String uer_act,@Param("sg_id")int sg_id);

    /**
     * 添加收藏的歌单
     * @param uer_act
     * @param sl_id
     * @return
     */
    public int addSongListCollect(@Param("uer_act")String uer_act,@Param("sl_id")int sl_id);

    /**
     * 查询该用户收藏歌单的id
     * @param uer_act
     * @return
     */
    public List<Integer> selectSongListCollectID(String uer_act);

    /**
     * 根据用户名和歌单id查询是否存在该歌单的收藏
     * @param uer_act
     * @param sl_id
     * @return
     */
    public int selectIsSongListCollect(@Param("uer_act")String uer_act,@Param("sl_id")int sl_id);
    /**
     * 删除收藏的歌单
     * @param uer_act
     * @param sl_id
     * @return
     */
    public int deleteSongListCollect(@Param("uer_act")String uer_act,@Param("sl_id")int sl_id);
}
