package com.cjj;


import com.cjj.dao.InfSongInfoDao;
import com.cjj.dao.InfUserDao;
import com.cjj.entity.SongInfo;
import com.cjj.entity.User;
import com.cjj.service.InfUserService;
import com.cjj.service.implclass.UserService;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.io.IOException;
import java.util.List;

public class test1 {
    @Test
    public void run1() throws IOException {
        ApplicationContext ac=new ClassPathXmlApplicationContext("classpath:SpringApplicationContext.xml");
        InfSongInfoDao dao= (InfSongInfoDao) ac.getBean("infSongInfoDao");
        List<SongInfo> list=dao.selectAll("sl0" );
        System.out.println(list);
    }
}
