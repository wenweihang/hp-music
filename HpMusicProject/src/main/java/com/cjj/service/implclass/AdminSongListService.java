package com.cjj.service.implclass;

import com.cjj.dao.InfAdminSongListDao;
import com.cjj.dao.InfSongInfoDao;
import com.cjj.entity.Page;
import com.cjj.entity.SongInfo;
import com.cjj.entity.SongList;
import com.cjj.service.InfAdminSongListService;
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
public class AdminSongListService implements InfAdminSongListService {

    @Autowired
    private InfAdminSongListDao adminSongListDao;
    @Autowired
    private InfSongInfoDao songInfoDao;

    @Override
    public Page<SongList> getSongListPage(int currPage,HttpServletRequest req) {
        Page<SongList> page = new Page<>();
        //封装当前页
        page.setCurrPage(currPage);
        //封装每页显示的行数
        int pageRows = 5;
        page.setPageRows(pageRows);
        //获取订单总数
        int sumCount = adminSongListDao.selectSumSongList();
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
        List<SongList> lists = adminSongListDao.selectSongList(page);
        page.setLists(lists);
        return page;
//        List<SongList> admSongList = adminSongListDao.selectSongList();
//        req.getSession().setAttribute("admSongList", admSongList);
    }

    @Override
    public Object addSongList(SongList songList, HttpServletRequest req) {
        HashMap<String, String> hm = new HashMap<>();
        System.out.println("添加的歌单信息为:" + songList);
        adminSongListDao.addSongList(songList);
        req.getSession().setAttribute("songList", songList);
        hm.put("stateAddSongList", "1");
        return hm;
    }

    @Override
    public Object addSongListImg(MultipartFile songListImg, HttpServletRequest req) throws IOException {
        HashMap<String, String> hm = new HashMap<>();
        SongList songList = (SongList) req.getSession().getAttribute("songList");
        String sl_name = songList.getSl_name();
        System.out.println("歌单名:" + sl_name);
        //判断是否存在该歌单文件夹
        String dirpath="D:/javaweb/FileUploadServer/target/FileUploadServer-1.0-SNAPSHOT/music/"+sl_name;
        File file=new File(dirpath);
        if(!file.exists()){
            System.out.println("不存在该文件夹");
            file.mkdir();
        }
        //上传头像
        if (songListImg != null && !songListImg.isEmpty()) {
            try {
                String path = "http://localhost:774/music/" + sl_name + "/";
                String imgname = songListImg.getOriginalFilename();
                imgname = sl_name + "_" + imgname;
                imgname = URLEncoder.encode(imgname, "utf-8").replace("+", "%20");//支持中文
                System.out.println("歌单封面名:" + imgname);
                //创建客户端对象
                Client client = Client.create();
                //获取服务器图片地址
                String serverPath = path + imgname;
                //和服务器连接
                WebResource webResource = client.resource(serverPath);
                webResource.put(songListImg.getBytes());
                //将地址存入数据库
                SongList addSongListImg = new SongList();
                addSongListImg.setSl_imgAddress(serverPath);
                System.out.println("更新头像:" + addSongListImg);
                int result = adminSongListDao.addSongListImg(serverPath, sl_name);
                if (result > 0) {
                    hm.put("stateAddSongListImg", "1");
                    return hm;
                }
                System.out.println("未知错误");
            } catch (MaxUploadSizeExceededException e) {
                hm.put("stateAddSongListImg", "oversize");
                return hm;
            } catch (UniformInterfaceException e) {
                hm.put("stateAddSongInfoFile", "error");
                return hm;
            }
        }
        hm.put("stateAddSongListImg", "0");
        return hm;
    }

    @Override
    public Page<SongInfo> getSongInfo(int currPage, String sg_songList, HttpServletRequest req) {
        Page<SongInfo> page = new Page<>();
        //封装当前页
        page.setCurrPage(currPage);
        //封装每页显示的行数
        int pageRows = 5;
        page.setPageRows(pageRows);
        //获取订单总数
        System.out.println("歌单名为:"+sg_songList);
        int sumCount = songInfoDao.selectSumSong(sg_songList);
        page.setSumCount(sumCount);
        System.out.println("歌单" + sg_songList + "一共" + sumCount + "首");
        //封装页面总数
        double num = sumCount;
        Double dNum = Math.ceil(num / pageRows);
        page.setSumPage(dNum.intValue());
        System.out.println("歌单" + sg_songList + "一共" + page.getSumPage() + "页");
        //封装每页显示的数据
        int index = (currPage - 1) * pageRows;
        page.setIndex(index);
        //封装歌单名
        page.setSg_songList(sg_songList);
        List<SongInfo> lists = songInfoDao.selectSongPages(page);
        page.setLists(lists);
        return page;
    }

    @Override
    public Object deleteSongInfo(String sg_name, HttpServletRequest req) {
        HashMap<String, String> hm = new HashMap<>();
        songInfoDao.deleteSongInfo(sg_name);
        hm.put("stateDel", "1");
        System.out.println("歌曲删除成功");
        return hm;
    }

    @Override
    public Object deleteSongList(String sl_name, HttpServletRequest req) {
        HashMap<String, String> hm = new HashMap<>();
        int result=adminSongListDao.deleteSongList(sl_name);
        if(result>0){
            System.out.println("删除成功");
            hm.put("stateDel","1" );
            return hm;
        }
        System.out.println("删除失败");
        hm.put("stateDel","0" );
        return hm;
    }

    @Override
    public Object updSongList(int sl_id, String sl_main, HttpServletRequest req) {
        HashMap<String, String> hm = new HashMap<>();
        int result = adminSongListDao.updateSongList(sl_id,sl_main );
        if (result > 0) {
            System.out.println("修改成功");
            hm.put("stateUpdSongList", "1");
            return hm;
        }
        System.out.println("修改失败");
        hm.put("stateUpdSongList", "0");
        return hm;
    }

    @Override
    public Object addSongInfoToSL(SongInfo songInfo, HttpServletRequest req) {
        HashMap<String, String> hm = new HashMap<>();
        int result=songInfoDao.updateSongInfoToSL(songInfo);
        if(result>0){
            System.out.println("向歌单中添加歌曲成功");
            hm.put("stateAddSongInfoToSL", "1");
            return hm;
        }
        System.out.println("向歌单中添加歌曲失败");
        hm.put("stateAddSongInfoToSL", "0");
        return hm;
    }
}
