package com.cjj.utils;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class TimeFormatUtil {
    /**
     * 转换格式
     * @param date
     * @return
     */
    public static String getTimeFormat(Date date){
        SimpleDateFormat sdf=new SimpleDateFormat("yyyy年MM月dd日");
        return sdf.format(date);
    }
    public static Date getDate(String date) throws ParseException {
        SimpleDateFormat sdf=new SimpleDateFormat("yyyy年MM月dd日");
        return sdf.parse(date);
    }
    public static String getTimeFormat2(Date date) throws ParseException {
        SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        return sdf.format(date);
    }
    public static Date getDate2(String date) throws ParseException {
        SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        return sdf.parse(date);
    }
    /**
     * 计算两个日期的间隔时间
     */
    public static long getIntervalTime(String sdate,String edate){
        SimpleDateFormat sdf=new SimpleDateFormat("yyyy年MM月dd日");
        Date date1=null;
        Date date2=null;
        try {
            date1=sdf.parse(sdate);
            date2=sdf.parse(edate);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        return  (date1.getTime()-date2.getTime())/(60*60*24*1000);
    }
    /**
     * 计算会员开始时间和到期时间
     */
    public static String additionTime(String sdate,int mtype){
        Calendar c=Calendar.getInstance();
        if(sdate==""){
            c.add(Calendar.DAY_OF_MONTH,mtype );
            String expireTime=c.get(Calendar.YEAR)+"年"+(c.get(Calendar.MONTH)+1)+"月"+c.get(Calendar.DAY_OF_MONTH)+"日";
            return expireTime;
        }
        int year=Integer.parseInt(GetYMDUtil.getYear(sdate));
        int mouth=Integer.parseInt(GetYMDUtil.getMouth(sdate));
        int day=Integer.parseInt(GetYMDUtil.getDay(sdate));
        c.set(year,mouth-1 ,day );
        c.add(Calendar.DAY_OF_MONTH, mtype);
        String expireTime=c.get(Calendar.YEAR)+"年"+(c.get(Calendar.MONTH)+1)+"月"+c.get(Calendar.DAY_OF_MONTH)+"日";
        return expireTime;
    }
    //计算登录时间是否超出24小时
    public static boolean countNewDay(String ulh_timeDao) throws ParseException {
        String year=GetYMDUtil.getYear(ulh_timeDao);
        String mouth=GetYMDUtil.getMouth(ulh_timeDao);
        int day=Integer.parseInt(GetYMDUtil.getDay(ulh_timeDao));
        Date zeroTime=getDate(year+"年"+mouth+"月"+(day+1)+"日");
        long intervalTime1=zeroTime.getTime();
        Date nowTime=new Date();
        long intervalTime2=nowTime.getTime();
        if(intervalTime2>=intervalTime1){
            //又是新的一天
            return true;
        }
        return false;
    }
    //计算现在距离n天的时间
    public static int countNowToNDay(int n) throws ParseException {
        Date nowTime=new Date();
        long lnowTime=nowTime.getTime();
        Calendar c=Calendar.getInstance();
        c.add(Calendar.DAY_OF_MONTH,n );
        String snDay=c.get(Calendar.YEAR)+"年"+(c.get(Calendar.MONTH)+1)+"月"+c.get(Calendar.DAY_OF_MONTH)+"日";
        Date dnDay=getDate(snDay);
        long lnTime=dnDay.getTime();
        int intervalTime= (int) ((lnTime-lnowTime)/1000);
        return intervalTime;
    }
}
