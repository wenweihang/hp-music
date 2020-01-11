package com.cjj.entity;

import com.cjj.utils.GetYMDUtil;
import com.cjj.utils.TimeFormatUtil;

import java.io.Serializable;
import java.util.Date;

public class User implements Serializable{
    private Integer uer_id;
    private String uer_name;
    private String uer_signature;
    private String uer_act;
    private String uer_pwd;
    private String uer_sex;
    private String year;
    private String mouth;
    private String day;
    private String uer_birthday;
    private String uer_create;
    private String shen;
    private String shi;
    private String quxian;
    private String uer_address;
    private String uer_constellation;
    private String uer_emailAddress;
    private String uer_headImg;

    public Integer getUer_id() {
        return uer_id;
    }

    public void setUer_id(Integer uer_id) {
        this.uer_id = uer_id;
    }

    public String getUer_name() {
        return uer_name;
    }

    public void setUer_name(String uer_name) {
        this.uer_name = uer_name;
    }

    public String getUer_signature() {
        return uer_signature;
    }

    public void setUer_signature(String uer_signature) {
        this.uer_signature = uer_signature;
    }

    public String getUer_act() {
        return uer_act;
    }

    public void setUer_act(String uer_act) {
        this.uer_act = uer_act;
    }

    public String getUer_pwd() {
        return uer_pwd;
    }

    public void setUer_pwd(String uer_pwd) {
        this.uer_pwd = uer_pwd;
    }

    public String getUer_sex() {
        return uer_sex;
    }

    public void setUer_sex(String uer_sex) {
        this.uer_sex = uer_sex;
    }

    public String getYear() {
        return year;
    }

    public void setYear(String year) {
        this.year = year;
    }

    public String getMouth() {
        return mouth;
    }

    public void setMouth(String mouth) {
        this.mouth = mouth;
    }

    public String getDay() {
        return day;
    }

    public void setDay(String day) {
        this.day = day;
    }

    public String getUer_birthday() {
        return uer_birthday;
    }

    public void setUer_birthday(String uer_birthday) {
        this.uer_birthday = uer_birthday;
    }

    public String getUer_create() {
        return uer_create;
    }

    public void setUer_create(String uer_create) {
        this.uer_create = uer_create;
    }

    public String getShen() {
        return shen;
    }

    public void setShen(String shen) {
        this.shen = shen;
    }

    public String getShi() {
        return shi;
    }

    public void setShi(String shi) {
        this.shi = shi;
    }

    public String getQuxian() {
        return quxian;
    }

    public void setQuxian(String quxian) {
        this.quxian = quxian;
    }

    public String getUer_address() {
        return uer_address;
    }

    public void setUer_address(String uer_address) {
        this.uer_address = uer_address;
    }

    public String getUer_constellation() {
        return uer_constellation;
    }

    public void setUer_constellation(String uer_constellation) {
        this.uer_constellation = uer_constellation;
    }

    public String getUer_emailAddress() {
        return uer_emailAddress;
    }

    public void setUer_emailAddress(String uer_emailAddress) {
        this.uer_emailAddress = uer_emailAddress;
    }

    public String getUer_headImg() {
        return uer_headImg;
    }

    public void setUer_headImg(String uer_headImg) {
        this.uer_headImg = uer_headImg;
    }

    @Override
    public String toString() {
        return "User{" +
                "uer_id=" + uer_id +
                ", uer_name='" + uer_name + '\'' +
                ", uer_signature='" + uer_signature + '\'' +
                ", uer_act='" + uer_act + '\'' +
                ", uer_pwd='" + uer_pwd + '\'' +
                ", uer_sex='" + uer_sex + '\'' +
                ", year='" + year + '\'' +
                ", mouth='" + mouth + '\'' +
                ", day='" + day + '\'' +
                ", uer_birthday='" + uer_birthday + '\'' +
                ", uer_create='" + uer_create + '\'' +
                ", shen='" + shen + '\'' +
                ", shi='" + shi + '\'' +
                ", quxian='" + quxian + '\'' +
                ", uer_address='" + uer_address + '\'' +
                ", uer_constellation='" + uer_constellation + '\'' +
                ", uer_emailAddress='" + uer_emailAddress + '\'' +
                ", uer_headImg='" + uer_headImg + '\'' +
                '}';
    }
}
