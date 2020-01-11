package com.cjj.utils;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class ConstellationUtil {
    public static String getConsl(String birthday) {
        String[] sArr = {"水瓶座", "双鱼座", "白羊座", "金牛座", "双子座", "巨蟹座", "狮子座", "处女座",
                "天秤座", "天蝎座", "射手座", "摩羯座"};
        String mouth=GetYMDUtil.getMouth(birthday);
        String day=GetYMDUtil.getDay(birthday);
        int imouth=Integer.parseInt(mouth);
        int iday=Integer.parseInt(day);
        String consl="";
        if (imouth == 1 && iday>=20||imouth == 2 && iday<=18) {
             consl=sArr[0];
        }
        if (imouth == 2 && iday>=19||imouth == 3 && iday<=20) {
            consl=sArr[1];
        }
        if (imouth == 3 && iday>=21||imouth == 4 && iday<=19) {
            consl=sArr[2];
        }
        if (imouth == 4 && iday>=20||imouth == 5 && iday<=18) {
            consl=sArr[3];
        }
        if (imouth == 5 && iday>=21||imouth == 6 && iday<=21) {
            consl=sArr[4];
        }
        if (imouth == 6 && iday>=22||imouth == 7 && iday<=22) {
            consl=sArr[5];
        }
        if (imouth == 7 && iday>=23||imouth == 8 && iday<=22) {
            consl=sArr[6];
        }
        if (imouth == 8 && iday>=23||imouth == 9 && iday<=22) {
            consl=sArr[7];
        }
        if (imouth == 9 && iday>=23||imouth == 10 && iday<=23) {
            consl=sArr[8];
        }
        if (imouth == 10 && iday>=24||imouth == 11 && iday<=22) {
            consl=sArr[9];
        }
        if (imouth == 11 && iday>=23||imouth == 12 && iday<=21) {
            consl=sArr[10];
        }
        if (imouth == 12 && iday>=22||imouth == 1 && iday<=19) {
            consl=sArr[11];
        }
        return consl;
    }

}
