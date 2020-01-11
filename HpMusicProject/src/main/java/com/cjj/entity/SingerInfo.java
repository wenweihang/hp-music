package com.cjj.entity;

import java.io.Serializable;

public class SingerInfo implements Serializable {
    private int sgr_id;
    private String sgr_name;
    private String sgr_sex;
    private String sgr_imgAddress;
    private String sgr_detail;
    private String sgr_hot;
    private String sgr_firstLetter;
    private String sgr_region;

    public int getSgr_id() {
        return sgr_id;
    }

    public void setSgr_id(int sgr_id) {
        this.sgr_id = sgr_id;
    }

    public String getSgr_name() {
        return sgr_name;
    }

    public void setSgr_name(String sgr_name) {
        this.sgr_name = sgr_name;
    }

    public String getSgr_sex() {
        return sgr_sex;
    }

    public void setSgr_sex(String sgr_sex) {
        this.sgr_sex = sgr_sex;
    }

    public String getSgr_imgAddress() {
        return sgr_imgAddress;
    }

    public void setSgr_imgAddress(String sgr_imgAddress) {
        this.sgr_imgAddress = sgr_imgAddress;
    }

    public String getSgr_detail() {
        return sgr_detail;
    }

    public void setSgr_detail(String sgr_detail) {
        this.sgr_detail = sgr_detail;
    }

    public String getSgr_hot() {
        return sgr_hot;
    }

    public void setSgr_hot(String sgr_hot) {
        this.sgr_hot = sgr_hot;
    }

    public String getSgr_firstLetter() {
        return sgr_firstLetter;
    }

    public void setSgr_firstLetter(String sgr_firstLetter) {
        this.sgr_firstLetter = sgr_firstLetter;
    }

    public String getSgr_region() {
        return sgr_region;
    }

    public void setSgr_region(String sgr_region) {
        this.sgr_region = sgr_region;
    }

    @Override
    public String toString() {
        return "SingerInfo{" +
                "sgr_id=" + sgr_id +
                ", sgr_name='" + sgr_name + '\'' +
                ", sgr_sex='" + sgr_sex + '\'' +
                ", sgr_imgAddress='" + sgr_imgAddress + '\'' +
                ", sgr_detail='" + sgr_detail + '\'' +
                ", sgr_hot='" + sgr_hot + '\'' +
                ", sgr_firstLetter='" + sgr_firstLetter + '\'' +
                ", sgr_region='" + sgr_region + '\'' +
                '}';
    }
}
