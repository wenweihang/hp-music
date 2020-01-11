package com.cjj.service.implclass;

import com.cjj.dao.InfAdminSingerInfoDao;
import com.cjj.entity.Page;
import com.cjj.entity.SingerInfo;
import com.cjj.service.InfAdminSingerInfoService;
import com.sun.jersey.api.client.Client;
import com.sun.jersey.api.client.UniformInterfaceException;
import com.sun.jersey.api.client.WebResource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MaxUploadSizeExceededException;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

@Service
public class AdminSingerInfoService implements InfAdminSingerInfoService {
    @Autowired
    private InfAdminSingerInfoDao adminSingerInfoDao;

    @Override
    public Object updSingerInfo(int sgr_id, String sgr_hot, HttpServletRequest req) {
        HashMap<String, String> hm = new HashMap<>();
        int result = adminSingerInfoDao.updateSingerInfo(sgr_id, sgr_hot);
        if (result > 0) {
            System.out.println("修改成功");
            hm.put("stateUpdSingerInfo", "1");
            return hm;
        }
        System.out.println("修改失败");
        hm.put("stateUpdSingerInfo", "0");
        return hm;
    }

    @Override
    public Object addSingerInfo(SingerInfo singerInfo, HttpServletRequest req) {
        HashMap<String, String> hm = new HashMap<>();
        int result = adminSingerInfoDao.addSingerInfo(singerInfo);
        if (result > 0) {
            System.out.println("添加成功");
            req.getSession().setAttribute("addSingerInfo", singerInfo);
            hm.put("stateAddSingerInfo", "1");
            return hm;
        }
        System.out.println("添加失败");
        hm.put("stateAddSingerInfo", "0");
        return hm;
    }

    @Override
    public Object addSingerInfoImg(MultipartFile singerInfoImg, HttpServletRequest req) throws UnsupportedEncodingException {
        HashMap<String, String> hm = new HashMap<>();
        SingerInfo singerInfo = (SingerInfo) req.getSession().getAttribute("addSingerInfo");
        String sgr_name = singerInfo.getSgr_name();
        //上传头像
        if (singerInfoImg != null && !singerInfoImg.isEmpty()) {
            try {
                String path = "http://localhost:774/singer/";
                String imgname = singerInfoImg.getOriginalFilename();
                String uuid = UUID.randomUUID().toString().toUpperCase().replace("-", "").substring(0, 24);
                imgname = uuid + "_" + imgname;
                System.out.println("歌手封面图名:" + imgname);
                //创建客户端对象
                Client client = Client.create();
                //获取服务器图片地址
                String serverPath = path + imgname;
                //和服务器连接
                WebResource webResource = client.resource(serverPath);
                webResource.put(singerInfoImg.getBytes());
                //将地址存入数据库
                SingerInfo addsingerInfoImg = new SingerInfo();
                addsingerInfoImg.setSgr_imgAddress(serverPath);
                System.out.println("更新头像:" + addsingerInfoImg);
                int result = adminSingerInfoDao.addSingerInfoImg(serverPath, sgr_name);
                if (result > 0) {
                    hm.put("stateAddSingerInfoImg", "1");
                    return hm;
                }
                System.out.println("未知错误");
            } catch (MaxUploadSizeExceededException e) {
                hm.put("stateAddSingerInfoImg", "oversize");
                return hm;
            } catch (UniformInterfaceException e) {
                hm.put("stateAddSingerInfoFile", "error");
                return hm;
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        hm.put("stateAddSingerInfoImg", "0");
        return hm;
    }

    @Override
    public Page<SingerInfo> getSingerInfoByText(int currPage,String text,HttpServletRequest req) {
        System.out.println("当前页数:" + currPage);
        Page<SingerInfo> page = new Page<>();

        //封装当前页数
        page.setCurrPage(currPage);
        //封装搜索内容
        page.setText(text);
        //每页显示的行数
        int pageRows = 36;
        page.setPageRows(pageRows);
        //封装总记录数
        int sumCount = adminSingerInfoDao.selectSumSingerInfoByText(text);
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
        List<SingerInfo> lists= adminSingerInfoDao.selectSingerInfoByText(page);
        page.setLists(lists);
        return page;
    }
}
