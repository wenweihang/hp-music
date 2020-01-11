package com.cjj;

import com.cjj.entity.User;
import com.cjj.entity.UserOrder;
import com.cjj.utils.GetYMDUtil;
import com.cjj.utils.IpUtil;
import com.cjj.utils.JedisUtil;
import com.cjj.utils.TimeFormatUtil;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.data.redis.core.RedisTemplate;
import redis.clients.jedis.Jedis;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.*;
import java.sql.Time;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

public class test2 {

    @Test
    public void run1() throws IOException {
        String s="http://localhost:774/music/sl1/Jony J - Big Things Start Small.mp3";
//        s= URLEncoder.encode(s, "utf-8").replace("+","%20" );
        s=s.substring(0,s.lastIndexOf("/")+1 );
        System.out.println(s);
        URL url=new URL(s);
        HttpURLConnection urlcon = (HttpURLConnection) url.openConnection();
        if(urlcon.getResponseCode()>=400){
            System.out.println("不存在");
        }else{
            System.out.println("存在");
        }
    }

    @Test
    public void run2() throws ParseException {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy年MM月dd日");
        Date d = sdf.parse("2019年10月25日");
        Calendar c = Calendar.getInstance();

        System.out.println((c.get(Calendar.MONTH) + 1) + "月" + c.get(Calendar.DAY_OF_MONTH) + "日");
        int s = c.get(Calendar.DAY_OF_MONTH);
        c.add(Calendar.DAY_OF_MONTH, s);
        System.out.println(c.get((Calendar.MONTH) + 1) + "月" + c.get(Calendar.DAY_OF_MONTH) + "日");
        System.out.println(d.getTime() / (3600 * 24 * 1000));
//        System.out.println(c);

    }

    @Test
    public void run3() throws ParseException {
        Date d1 = new Date();
        System.out.println(d1);
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy年MM月dd日");
        Date d2 = sdf.parse("2019年11月24日");
        long l1 = d1.getTime();
        long l2 = d2.getTime();
        System.out.println("d1:"+d1);
        System.out.println("l1:"+l1);
        System.out.println("l2:"+l2);
        System.out.println((l2-l1)/1000);
        System.out.println(TimeFormatUtil.countNowToNDay(2));

    }

    @Test
    public void run4() {
       String uuid=UUID.randomUUID().toString().toUpperCase().replace("-","").substring(0,24);
        System.out.println(uuid);
    }

//    public static void main(String[] args) throws UnsupportedEncodingException, ParseException {
//
//        ApplicationContext ac = new ClassPathXmlApplicationContext("classpath:SpringApplicationContext.xml");
//        RedisTemplate redisTemplate = (RedisTemplate) ac.getBean("redisTemplate");
//        List<UserOrder> list = new ArrayList<>();
//        UserOrder userOrder1 = new UserOrder();
//        userOrder1.setUor_orderTime("111");
//        userOrder1.setUor_orderNumber("22222");
//        userOrder1.setUor_state("222");
//        userOrder1.setUor_commodityType("vip");
//        userOrder1.setUor_detail("fasdas ");
//        userOrder1.setUer_act("123");
//        userOrder1.setUor_id(1);
//        UserOrder userOrder2 = new UserOrder();
//        userOrder2.setUor_orderTime("222");
//        userOrder2.setUor_orderNumber("124123");
//        userOrder2.setUor_state("34341");
//        userOrder2.setUor_commodityType("vip2");
//        userOrder2.setUor_detail("fasdasqweq ");
//        userOrder2.setUer_act("441");
//        userOrder2.setUor_id(2);
//        UserOrder userOrder3 = new UserOrder();
//        userOrder3.setUor_orderTime("333");
//        userOrder3.setUor_orderNumber("124123");
//        userOrder3.setUor_state("343413");
//        userOrder3.setUor_commodityType("vip3");
//        userOrder3.setUor_detail("fasdasqweq3 ");
//        userOrder3.setUer_act("4413");
//        userOrder3.setUor_id(3);
//        list.add(userOrder1);
//        list.add(userOrder2);
//        list.add(userOrder3);
//        int i=1;
//        for (UserOrder u1 : list) {
//        redisTemplate.opsForZSet().add("uorderlists", u1,i);
//        i++;
//        }
////        redisTemplate.delete("uorderlists");
//
//
//        int size = Math.toIntExact(redisTemplate.opsForZSet().size("uorderlists"));
////        List<UserOrder> l = redisTemplate.opsForList().range("uorderlists", 0, -1);
//        Set<UserOrder> l = redisTemplate.opsForZSet().rangeByScore("uorderlists",1,size);
//        Jedis j=JedisUtil.getJedis();
//        for(UserOrder u:l){
//            Double score=redisTemplate.opsForZSet().score("uorderlists", u);
//            System.out.println(u);
//            System.out.println("score:"+score);
//
//        }
//        System.out.println(size);
//        System.out.println(l);
//
//    }
}
