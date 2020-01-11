package com.cjj.entity;

import java.io.Serializable;

public class SongInfo implements Serializable {
    private int sg_id;
    private String sg_name;
    private String sg_author;
    private String sg_address;
    private String sg_imgAddress;
    private String sg_time;
    private String sg_songList;
    private int szj_id;
    private String sg_language;
    private String sg_hot;
    private String sg_new;
    private String sg_topList;
    private String sg_pop;
    private String collect;
    private String szj_title;
    private String szj_detail;


    public int getSg_id() {
        return sg_id;
    }

    public void setSg_id(int sg_id) {
        this.sg_id = sg_id;
    }

    public String getSg_name() {
        return sg_name;
    }

    public void setSg_name(String sg_name) {
        this.sg_name = sg_name;
    }

    public String getSg_author() {
        return sg_author;
    }

    public void setSg_author(String sg_author) {
        this.sg_author = sg_author;
    }

    public String getSg_address() {
        return sg_address;
    }

    public void setSg_address(String sg_address) {
        this.sg_address = sg_address;
    }

    public String getSg_imgAddress() {
        return sg_imgAddress;
    }

    public void setSg_imgAddress(String sg_imgAddress) {
        this.sg_imgAddress = sg_imgAddress;
    }

    public String getSg_time() {
        return sg_time;
    }

    public void setSg_time(String sg_time) {
        this.sg_time = sg_time;
    }

    public String getSg_songList() {
        return sg_songList;
    }

    public void setSg_songList(String sg_songList) {
        this.sg_songList = sg_songList;
    }

    public int getSzj_id() {
        return szj_id;
    }

    public void setSzj_id(int szj_id) {
        this.szj_id = szj_id;
    }

    public String getSg_language() {
        return sg_language;
    }

    public void setSg_language(String sg_language) {
        this.sg_language = sg_language;
    }

    public String getSg_hot() {
        return sg_hot;
    }

    public void setSg_hot(String sg_hot) {
        this.sg_hot = sg_hot;
    }

    public String getCollect() {
        return collect;
    }

    public void setCollect(String collect) {
        this.collect = collect;
    }

    public String getSg_new() {
        return sg_new;
    }

    public void setSg_new(String sg_new) {
        this.sg_new = sg_new;
    }

    public String getSg_topList() {
        return sg_topList;
    }

    public void setSg_topList(String sg_topList) {
        this.sg_topList = sg_topList;
    }

    public String getSg_pop() {
        return sg_pop;
    }

    public void setSg_pop(String sg_pop) {
        this.sg_pop = sg_pop;
    }

    public String getSzj_title() {
        return szj_title;
    }

    public void setSzj_title(String szj_title) {
        this.szj_title = szj_title;
    }

    public String getSzj_detail() {
        return szj_detail;
    }

    public void setSzj_detail(String szj_detail) {
        this.szj_detail = szj_detail;
    }

    @Override
    public String toString() {
        return "SongInfo{" +
                "sg_id=" + sg_id +
                ", sg_name='" + sg_name + '\'' +
                ", sg_author='" + sg_author + '\'' +
                ", sg_address='" + sg_address + '\'' +
                ", sg_imgAddress='" + sg_imgAddress + '\'' +
                ", sg_time='" + sg_time + '\'' +
                ", sg_songList='" + sg_songList + '\'' +
                ", szj_id=" + szj_id +
                ", sg_language='" + sg_language + '\'' +
                ", sg_hot='" + sg_hot + '\'' +
                ", sg_new='" + sg_new + '\'' +
                ", sg_topList='" + sg_topList + '\'' +
                ", sg_pop='" + sg_pop + '\'' +
                ", collect='" + collect + '\'' +
                ", szj_title='" + szj_title + '\'' +
                ", szj_detail='" + szj_detail + '\'' +
                '}';
    }
}

