package com.cjj.dao;

import com.cjj.entity.Page;
import com.cjj.entity.SingerInfo;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface InfSingerInfoDao {
    /**
     * 获取所有歌手总数
     * @return
     */
    public int selectSumSingerInfo();
    /**
     * 根据分页数据index和显示的行数查询歌手
     * @param page
     * @return
     */
    public List<SingerInfo> selectSingerInfoPage(Page<SingerInfo> page);

    /**
     * 根据首字母获取所有歌手总数
     * @param sgr_firstLetter
     * @return
     */
    public int selectSumSingerInfoByFL(String sgr_firstLetter);
    /**
     * 根据分页数据index和显示的行数,首字母查询歌手
     * @param page
     * @return
     */
    public List<SingerInfo> selectSingerInfoPageByFL(Page<SingerInfo> page);

    /**
     * 根据地区获取所有歌手总数
     * @param sgr_region
     * @return
     */
    public int selectSumSingerInfoByRG(String sgr_region);
    /**
     * 根据分页数据index和显示的行数,地区查询歌手
     * @param page
     * @return
     */
    public List<SingerInfo> selectSingerInfoPageByRG(Page<SingerInfo> page);

    /**
     * 根据首字母和地区获取所有歌手总数
     * @param sgr_firstLetter
     * @param sgr_region
     * @return
     */
    public int selectSumSingerInfoByFLANDRG(@Param("sgr_firstLetter") String sgr_firstLetter, @Param("sgr_region") String sgr_region);
    /**
     * 根据分页数据index和显示的行数,首字母,地区查询歌手
     * @param page
     * @return
     */
    public List<SingerInfo> selectSingerInfoPageByFLANDRG(Page<SingerInfo> page);

    /**
     * 获取首页显示的歌手
     * @return
     */
    public List<SingerInfo> selectSingerInfoPageMain();
}
