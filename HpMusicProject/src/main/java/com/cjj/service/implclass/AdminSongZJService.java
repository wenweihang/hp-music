package com.cjj.service.implclass;

import com.cjj.dao.InfAdminSongZJDao;
import com.cjj.dao.InfSongInfoDao;
import com.cjj.entity.Page;
import com.cjj.entity.SongInfo;
import com.cjj.entity.SongZJ;
import com.cjj.service.InfAdminSongZJService;
import com.sun.jersey.api.client.Client;
import com.sun.jersey.api.client.UniformInterfaceException;
import com.sun.jersey.api.client.WebResource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MaxUploadSizeExceededException;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;

@Service
public class AdminSongZJService implements InfAdminSongZJService {
    @Autowired
    private InfAdminSongZJDao adminSongZJDao;
    @Autowired
    private InfSongInfoDao songInfoDao;
    @Override
    public Page<SongZJ> getSongZJPage(int currPage, HttpServletRequest req) {
        Page<SongZJ> page = new Page<>();
        //封装当前页
        page.setCurrPage(currPage);
        //封装每页显示的行数
        int pageRows = 5;
        page.setPageRows(pageRows);
        //获取订单总数
        int sumCount = adminSongZJDao.selectSumSongZJ();
        page.setSumCount(sumCount);
        System.out.println("一共" + sumCount + "个歌单");
        //封装页面总数
        double num = sumCount;
        Double dNum = Math.ceil(num / pageRows);
        page.setSumPage(dNum.intValue());
        System.out.println("歌单一共" + page.getSumPage() + "页");
        //封装每页显示的数据
        int index = (currPage - 1) * pageRows;
        page.setIndex(index);
        List<SongZJ> lists = adminSongZJDao.selectSongZJ(page);
        page.setLists(lists);
        return page;
    }

    @Override
    public Object addSongZJ(SongZJ songZJ, HttpServletRequest req) {
        HashMap<String,String> hm=new HashMap<>();
        System.out.println("专辑信息："+songZJ);
        int result=adminSongZJDao.addSongZJ(songZJ);
        if(result>0){
            System.out.println("专辑添加成功");
            req.getSession().setAttribute("songZJ", songZJ);
            hm.put("stateAddSongZJ","1" );
            return hm;
        }
        System.out.println("专辑添加失败");
        hm.put("stateAddSongZJ","0" );
        return hm;
    }

    @Override
    public Object addSongZJImg(MultipartFile songZJImg, HttpServletRequest req) throws IOException {
        HashMap<String,String> hm=new HashMap<>();
        //        //获取专辑标题
        SongZJ songZJ= (SongZJ) req.getSession().getAttribute("songZJ");
        String szj_title=songZJ.getSzj_title();
        System.out.println("专辑标题为:"+szj_title);
        try {
            //获取专辑ID
            int szj_id=adminSongZJDao.selectSongZJIDByTitle(szj_title);
            System.out.println("专辑ID为:"+szj_id);
            //判断是否存在该专辑文件夹
            String dirpath="D:/javaweb/FileUploadServer/target/FileUploadServer-1.0-SNAPSHOT/musicZJ/"+szj_id;
            File file=new File(dirpath);
            if(!file.exists()){
                System.out.println("不存在该文件夹");
                file.mkdir();
            }
            String path="http://localhost:774/musicZJ/"+szj_id+"/";
            String imgname=songZJImg.getOriginalFilename();
            imgname= URLEncoder.encode(imgname,"utf-8").replace("+", "%20");
            //创建客户端
            Client client=Client.create();
            //获取服务器图片地址
            String serverPath = path + imgname;
            //连接服务器
            WebResource webResource=client.resource(serverPath);
            webResource.put(songZJImg.getBytes());
            //将地址存入数据库
            SongZJ addSongZJImg=new SongZJ();
            addSongZJImg.setSzj_imgAddress(serverPath);
            addSongZJImg.setSzj_title(szj_title);
            //更新数据库
            int result=adminSongZJDao.addSongZJImg(serverPath,szj_title );
            if(result>0){
                System.out.println("专辑封面添加成功");
                hm.put("stateAddZJImg","1" );
                return hm;
            }
            System.out.println("专辑封面添加失败");
            hm.put("stateAddZJImg","0" );
            return hm;
        }catch (MaxUploadSizeExceededException e){
            hm.put("stateAddSongListImg", "oversize");
            return hm;
        }catch (UniformInterfaceException e){
            hm.put("stateAddSongInfoFile", "error");
            return hm;
        }
    }

    @Override
    public Page<SongInfo> getSongInfo(int currPage, int szj_id, HttpServletRequest req) {
        Page<SongInfo> page = new Page<>();
        //封装当前页
        page.setCurrPage(currPage);
        //封装每页显示的行数
        int pageRows = 5;
        page.setPageRows(pageRows);
        //获取订单总数
        int sumCount = songInfoDao.selectSumSongByZJID(szj_id);
        page.setSumCount(sumCount);
        System.out.println("专辑" + szj_id + "一共" + sumCount + "首歌曲");
        //封装页面总数
        double num = sumCount;
        Double dNum = Math.ceil(num / pageRows);
        page.setSumPage(dNum.intValue());
        System.out.println("专辑" + szj_id + "一共" + page.getSumPage() + "页");
        //封装每页显示的数据
        int index = (currPage - 1) * pageRows;
        page.setIndex(index);
        //封装专辑ID
        page.setSzj_id(szj_id);
        List<SongInfo> lists = songInfoDao.selectSongPages(page);
        page.setLists(lists);
        return page;
    }

    @Override
    public List<String> getAllSongInfo(HttpServletRequest req) {
        List<String> sg_namelist=songInfoDao.selectAllSongInfo();
        System.out.println("歌曲名称为:"+sg_namelist);
        return sg_namelist;
    }

    @Override
    public Object addSongInfo(SongInfo songInfo) {
        HashMap<String,String> hm=new HashMap<>();
        int result=songInfoDao.updateSongInfo(songInfo);
        if(result>0){
            System.out.println("添加专辑歌曲成功");
            hm.put("stateAddSongToZJ", "1");
            return hm;
        }
        System.out.println("添加专辑歌曲失败");
        hm.put("stateAddSongToZJ", "0");
        return hm;
    }
}
