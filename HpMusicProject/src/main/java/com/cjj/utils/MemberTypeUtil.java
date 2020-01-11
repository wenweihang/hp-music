package com.cjj.utils;

public class MemberTypeUtil {
    public static String getMemberType(String sdate,String mtype){
        String expireTime = null;
        if ("1个月".equals(mtype)) {
            expireTime = TimeFormatUtil.additionTime(sdate,30);
        }
        if ("6个月".equals(mtype)) {
            expireTime = TimeFormatUtil.additionTime(sdate,180);
        }
        if ("12个月".equals(mtype)) {
            expireTime = TimeFormatUtil.additionTime(sdate,365);
        }
        return expireTime;
    }
}
