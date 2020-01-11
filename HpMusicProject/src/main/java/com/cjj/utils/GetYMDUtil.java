package com.cjj.utils;

public class GetYMDUtil {
    public static String getYear(String birthday){

        if(birthday.contains("年")) {
            String year=birthday.substring(0,birthday.indexOf("年"));
            return year;
        }else{
            String year2=birthday.substring(0,birthday.indexOf("-"));
            return year2;
        }
    }
    public static String getMouth(String birthday){
        if(birthday.contains("月")) {
            String mouth = birthday.substring(birthday.indexOf("年") + 1, birthday.indexOf("月"));
            return mouth;
        }else{
            int index1=birthday.indexOf("-")+1;
            int index2=birthday.indexOf("-",index1);
            String mouth2 = birthday.substring(index1, index2);
            return mouth2;
        }

    }
    public static String getDay(String birthday){
        if(birthday.contains("日")) {
            String day = birthday.substring(birthday.indexOf("月") + 1, birthday.indexOf("日"));
            return day;
        }else{
            int index1=birthday.indexOf("-")+1;
            int index2=birthday.indexOf("-",index1)+1;
            String day2 = birthday.substring(index2, birthday.indexOf(" "));
            return day2;
        }
    }
}
