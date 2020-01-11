package com.cjj.service.implclass;

import com.cjj.dao.InfSingerInfoDao;
import com.cjj.entity.Page;
import com.cjj.entity.SingerInfo;
import com.cjj.service.InfSingerInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

@Service
public class SingerInfoService implements InfSingerInfoService {
    @Autowired
    private InfSingerInfoDao singerInfoDao;
    @Override
    public Page<SingerInfo> getSingerInfoPage(int currPage, HttpServletRequest req) {
        System.out.println("当前页数:" + currPage);
        Page<SingerInfo> page = new Page<>();

        //封装当前页数
        page.setCurrPage(currPage);
        //每页显示的行数
        int pageRows = 36;
        page.setPageRows(pageRows);
        //封装总记录数
        int sumCount = singerInfoDao.selectSumSingerInfo();
        page.setSumCount(sumCount);
        System.out.println("一共" + sumCount + "条歌手信息");
        //封装总页数
        double sc = sumCount; //如果整数除整数,直接去余
        Double num = Math.ceil(sc / pageRows);//向上取整
        page.setSumPage(num.intValue());
        System.out.println("一共" + page.getSumPage() + "页");
        //封装每页显示的数据
        int index = (currPage - 1) * pageRows;
        page.setIndex(index);
        //获取歌手信息
        List<SingerInfo> lists= singerInfoDao.selectSingerInfoPage(page);
        page.setLists(lists);
        return page;
    }

    @Override
    public Page<SingerInfo> getSingerInfoPageByFL(int currPage,String sgr_firstLetter, HttpServletRequest req) {
        System.out.println("当前页数:" + currPage);
        Page<SingerInfo> page = new Page<>();

        //封装当前页数
        page.setCurrPage(currPage);
        //封装首字母
        page.setSgr_firstLetter(sgr_firstLetter);
        //每页显示的行数
        int pageRows = 36;
        page.setPageRows(pageRows);
        //封装总记录数
        int sumCount = singerInfoDao.selectSumSingerInfoByFL(sgr_firstLetter);
        page.setSumCount(sumCount);
        System.out.println("一共" + sumCount + "条歌手信息");
        //封装总页数
        double sc = sumCount; //如果整数除整数,直接去余
        Double num = Math.ceil(sc / pageRows);//向上取整
        page.setSumPage(num.intValue());
        System.out.println("一共" + page.getSumPage() + "页");
        //封装每页显示的数据
        int index = (currPage - 1) * pageRows;
        page.setIndex(index);
        //获取歌手信息
        List<SingerInfo> lists= singerInfoDao.selectSingerInfoPageByFL(page);
        page.setLists(lists);
        return page;
    }

    @Override
    public Page<SingerInfo> getSingerInfoPageByRG(int currPage, String sgr_region, HttpServletRequest req) {
        System.out.println("当前页数:" + currPage);
        Page<SingerInfo> page = new Page<>();

        //封装当前页数
        page.setCurrPage(currPage);
        //封装地区
        page.setSgr_region(sgr_region);
        //每页显示的行数
        int pageRows = 36;
        page.setPageRows(pageRows);
        //封装总记录数
        int sumCount = singerInfoDao.selectSumSingerInfoByRG(sgr_region);
        page.setSumCount(sumCount);
        System.out.println("一共" + sumCount + "条歌手信息");
        //封装总页数
        double sc = sumCount; //如果整数除整数,直接去余
        Double num = Math.ceil(sc / pageRows);//向上取整
        page.setSumPage(num.intValue());
        System.out.println("一共" + page.getSumPage() + "页");
        //封装每页显示的数据
        int index = (currPage - 1) * pageRows;
        page.setIndex(index);
        //获取歌手信息
        List<SingerInfo> lists= singerInfoDao.selectSingerInfoPageByRG(page);
        page.setLists(lists);
        return page;
    }

    @Override
    public Page<SingerInfo> getSingerInfoPageByFLANDRG(int currPage, String sgr_firstLetter, String sgr_region, HttpServletRequest req) {
        System.out.println("当前页数:" + currPage);
        Page<SingerInfo> page = new Page<>();

        //封装当前页数
        page.setCurrPage(currPage);
        //封装首字母
        page.setSgr_firstLetter(sgr_firstLetter);
        //封装地区
        page.setSgr_region(sgr_region);
        //每页显示的行数
        int pageRows = 36;
        page.setPageRows(pageRows);
        //封装总记录数
        int sumCount = singerInfoDao.selectSumSingerInfoByFLANDRG(sgr_firstLetter,sgr_region);
        page.setSumCount(sumCount);
        System.out.println("一共" + sumCount + "条歌手信息");
        //封装总页数
        double sc = sumCount; //如果整数除整数,直接去余
        Double num = Math.ceil(sc / pageRows);//向上取整
        page.setSumPage(num.intValue());
        System.out.println("一共" + page.getSumPage() + "页");
        //封装每页显示的数据
        int index = (currPage - 1) * pageRows;
        page.setIndex(index);
        //获取歌手信息
        List<SingerInfo> lists= singerInfoDao.selectSingerInfoPageByFLANDRG(page);
        page.setLists(lists);
        return page;
    }

    @Override
    public List<SingerInfo> getSingerInfoPageMain(HttpServletRequest req) {
        HashMap<String,List<SingerInfo>> hm=new HashMap<>();
        List<SingerInfo> listMain=singerInfoDao.selectSingerInfoPageMain();
        return listMain;
    }
}
