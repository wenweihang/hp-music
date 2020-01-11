package com.cjj;

import org.junit.Test;

import java.io.File;

public class createFile {
    @Test
    public void createSongList(){
        int i=16;
        String path="D:/javaweb/FileUploadServer/target/FileUploadServer-1.0-SNAPSHOT/music/sl"+i;
        File file=new File(path);
        if(!file.exists()){
            System.out.println("不存在该文件夹");
            file.mkdir();
        }
    };
}
