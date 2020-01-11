package com.cjj.controller;

import com.sun.jersey.api.client.Client;
import com.sun.jersey.api.client.WebResource;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.net.*;
import java.util.HashMap;

@Controller
@RequestMapping("/download")
public class FileDownloadController {
    @RequestMapping("/fileDownload")
    public void fileDownload(String sg_address, HttpServletRequest req, HttpServletResponse resp) throws IOException {
        String path=sg_address.substring(0,sg_address.lastIndexOf("/")+1);
        String filename=sg_address.substring(sg_address.lastIndexOf("/")+1);
        filename=URLEncoder.encode(filename,"utf-8" ).replace("+","%20" );
        sg_address = path+filename;
        System.out.println("文件地址为：" + sg_address);
        // 判断资源是否存在
        URL url = new URL(sg_address);
        HttpURLConnection urlcon = (HttpURLConnection) url.openConnection();
        if (urlcon.getResponseCode() >= 400) {
            System.out.println("该资源已被删除");
            return;
        }
        System.out.println("存在该资源");
        //转码
        System.out.println("文件名："+filename);
        //设置文件下载头名称
        resp.setHeader("Content-Disposition", "attachment;filename=" + filename);
        //设置文件下载自动判断文件的类型
        resp.setContentType("multipart/form-data");
        InputStream is = url.openStream();
        OutputStream out = resp.getOutputStream();
        int len = 0;
        byte[] buffer = new byte[1024 * 5];
        while ((len = is.read(buffer)) != -1) {
            out.write(buffer, 0, len);
        }
        is.close();
        out.close();
    }
}
