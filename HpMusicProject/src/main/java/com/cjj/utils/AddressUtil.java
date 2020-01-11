package com.cjj.utils;


import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONException;
import com.alibaba.fastjson.JSONObject;
import org.apache.commons.io.FileUtils;
import org.springframework.util.ResourceUtils;

import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLConnection;

public class AddressUtil {
    public static JSONArray getJSONArray()throws IOException{
        File jsonFile = ResourceUtils.getFile("classpath:json/address.json");
        String json = FileUtils.readFileToString(jsonFile,"utf-8");
        JSONArray jsonArr = JSON.parseArray(json);
        return jsonArr;
    }
    public static String getShen(String address) throws IOException {
        JSONArray jsonArr = getJSONArray();
        for (Object obj : jsonArr) {
            JSONObject jobj = (JSONObject) obj;
            String shen=jobj.getString("p");
            if(address.contains(shen)){
                 return shen;
            }
        }
        return null;
    }
    public static String getShi(String address) throws IOException {
        JSONArray jsonArr = getJSONArray();
        for (Object obj : jsonArr) {
            JSONObject jobj = (JSONObject) obj;
            String shen=jobj.getString("p");
            if(address.contains(shen)){
                JSONArray  shiArr=jobj.getJSONArray("c");
                if(shiArr==null){
                    return null;
                }
                for(Object obj2:shiArr){
                    JSONObject jobj2 = (JSONObject) obj2;
                    String shi=jobj2.getString("n");
                    if(shi==null){
                        return null;
                    }
                    if(address.contains(shi)){
                        return shi;
                    }
                }
            }
        }
        return null;
    }
    public static String getQuxian(String address) throws IOException {
        JSONArray jsonArr = getJSONArray();
        for (Object obj : jsonArr) {
            JSONObject jobj = (JSONObject) obj;
            String shen=jobj.getString("p");
            if(address.contains(shen)){
                JSONArray  shiArr=jobj.getJSONArray("c");
                if(shiArr==null){
                    return null;
                }
                for(Object obj2:shiArr){
                    JSONObject jobj2 = (JSONObject) obj2;
                    String shi=jobj2.getString("n");
                    if(shi==null){
                        return null;
                    }
                    if(address.contains(shi)){
                        JSONArray  quxianArr=jobj2.getJSONArray("a");
                        if(quxianArr==null){
                            return null;
                        }
                        for(Object obj3:quxianArr) {
                            JSONObject jobj3 = (JSONObject) obj3;
                            String quxian = jobj3.getString("s");
                            if(quxian==null){
                                return null;
                            }
                            if(address.contains(quxian)){
                                return quxian;
                            }
                        }
                    }
                }
            }
        }
        return null;
    }

    public static String getAddressByIP(String strIP) {
        try {
            URL url = new URL("http://api.map.baidu.com/location/ip?ak=F454f8a5efe5e577997931cc01de3974&ip="+strIP);
            URLConnection conn = url.openConnection();
            BufferedReader reader = new BufferedReader(new InputStreamReader(conn.getInputStream(), "utf-8"));
            String line = null;
            StringBuffer result = new StringBuffer();
            while ((line = reader.readLine()) != null) {
                result.append(line);
            }
            reader.close();
            String ipAddr = result.toString();
            try {
                JSONObject obj1= JSON.parseObject(ipAddr);
                if("0".equals(obj1.get("status").toString())){
                    JSONObject obj2= JSON.parseObject(obj1.get("content").toString());
                    JSONObject obj3= JSON.parseObject(obj2.get("address_detail").toString());
                    String province= (String) obj3.get("province");
                    String city= (String) obj3.get("city");
                    return province+city;
                }else{
                    return "B503宿舍";
                }
            } catch (JSONException e) {
                e.printStackTrace();
                return "读取失败";
            }

        } catch (IOException e) {
            return "读取失败";
        }
    }
}
