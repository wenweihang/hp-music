package com.cjj.service.implclass;

import com.cjj.dao.InfSongInfoDao;
import com.cjj.entity.Page;
import com.cjj.entity.SongInfo;
import com.cjj.service.InfAdminSongInfoService;
import com.sun.jersey.api.client.Client;
import com.sun.jersey.api.client.UniformInterfaceException;
import com.sun.jersey.api.client.WebResource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;

@Service
public class AdminSongInfoService implements InfAdminSongInfoService {
    @Autowired
    private InfSongInfoDao songInfoDao;

    @Override
    public Object addSongInfo(SongInfo songInfo, HttpServletRequest req) {
        HashMap<String, String> hm = new HashMap<>();
        System.out.println("添加的歌曲信息为:" + songInfo);
        int result = songInfoDao.addSongInfo(songInfo);
        if (result > 0) {
            System.out.println("歌曲信息插入成功");
            req.getSession().setAttribute("songInfo", songInfo);
            hm.put("stateAddSong", "1");
            return hm;
        }
        System.out.println("歌曲信息插入失败");
        hm.put("stateAddSong", "0");
        return hm;
    }

    @Override
    public Object addSongInfoFile(MultipartFile songInfoFile, HttpServletRequest req) throws IOException {
        HashMap<String, String> hm = new HashMap<>();
        SongInfo songInfo = (SongInfo) req.getSession().getAttribute("songInfo");
        String sg_name = songInfo.getSg_name();
        int szj_id = songInfo.getSzj_id();
        System.out.println("歌曲名:" + sg_name);
        if (songInfoFile != null && !songInfoFile.isEmpty()) {
            System.out.println("歌曲文件为:" + songInfoFile.getOriginalFilename());
            try {
                String path = "http://localhost:774/music/";
                String filename = songInfoFile.getOriginalFilename();
                if (!filename.endsWith(".mp3")) {
                    //不是歌曲时
                    filename = sg_name + "_" + filename;
                    filename = URLEncoder.encode(filename, "utf-8").replace("+", "%20");//支持中文
                }
                if (filename.endsWith(".mp3")) {
                    //是歌曲时
                    filename = URLEncoder.encode(filename, "utf-8").replace("+", "%20");//支持中文
                }
                //创建客户端对象
                Client client = Client.create();
                //获取图片地址
                String serverPath = path + filename;
                //连接服务器
                WebResource webResource = client.resource(serverPath);
                webResource.put(songInfoFile.getBytes());
                if (filename.endsWith(".mp3")) {
                    int result = songInfoDao.addSongInfoMusic(serverPath, sg_name);
                    if (result > 0) {
                        System.out.println("歌曲文件插入成功");
                        hm.put("stateAddSongInfoFile", "1");
                        return hm;
                    }

                    System.out.println("歌曲文件插入失败");
                    return hm;
                }
                //存入数据库
                int result = songInfoDao.addSongInfoImg(serverPath, sg_name);
                if (result > 0) {
                    System.out.println("歌曲封面插入成功");
                    hm.put("stateAddSongInfoFile", "1");
                    return hm;
                }

                System.out.println("歌曲封面插入失败");
                return hm;
            } catch (UniformInterfaceException e) {
                hm.put("stateAddSongInfoFile", "error");
                return hm;
            }
        }
        System.out.println("未知错误");
        hm.put("stateAddSongInfoFile", "no");
        return hm;
    }

    @Override
    public Page<SongInfo> getSongInfoTopPage(int currPage, HttpServletRequest req) {
        Page<SongInfo> page = new Page<>();
        //封装当前页
        page.setCurrPage(currPage);
        //封装每页显示的行数
        int pageRows = 5;
        page.setPageRows(pageRows);
        //获取订单总数
        int sumCount = songInfoDao.selectSumAllSong();
        page.setSumCount(sumCount);
        System.out.println("一共" + sumCount + "首歌曲");
        //封装页面总数
        double num = sumCount;
        Double dNum = Math.ceil(num / pageRows);
        page.setSumPage(dNum.intValue());
        System.out.println("歌曲一共" + page.getSumPage() + "页");
        //封装每页显示的数据
        int index = (currPage - 1) * pageRows;
        page.setIndex(index);
        List<SongInfo> lists = songInfoDao.selectSongInfoTop(page);
        page.setLists(lists);
        return page;
    }

    @Override
    public Object deleteSongInfoTop(int sg_id) {
        HashMap<String,String> hm=new HashMap<>();
        int result=songInfoDao.deleteSongInfoTop(sg_id);
        if(result>0){
            System.out.println("歌曲删除成功!");
            hm.put("stateDel","1" );
            return hm;
        }
        System.out.println("歌曲删除失败!");
        hm.put("stateDel","0" );
        return hm;
    }

    @Override
    public Object updateSongInfoTop(SongInfo updSongInfo) {
        HashMap<String,String> hm=new HashMap<>();
        System.out.println("修改歌曲信息为:"+updSongInfo);
        int result=songInfoDao.updateSongInfoTop(updSongInfo);
        if(result>0){
            System.out.println("更新成功！");
            hm.put("stateUpdSongInfoTop", "1");
            return hm;
        }
        System.out.println("更新失败！");
        hm.put("stateUpdSongInfoTop", "0");
        return hm;
    }
}
