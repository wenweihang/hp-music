package com.cjj.entity;

import java.io.Serializable;
import java.util.List;

public class SongList implements Serializable {
    private int sl_id;
    private String sl_name;
    private String sl_main;
    private String sl_imgAddress;
    private String sl_title;
    private String sl_tag;
    private String sl_detail;
    private String collect;

    public int getSl_id() {
        return sl_id;
    }

    public void setSl_id(int sl_id) {
        this.sl_id = sl_id;
    }

    public String getSl_name() {
        return sl_name;
    }

    public void setSl_name(String sl_name) {
        this.sl_name = sl_name;
    }

    public String getSl_main() {
        return sl_main;
    }

    public void setSl_main(String sl_main) {
        this.sl_main = sl_main;
    }

    public String getSl_imgAddress() {
        return sl_imgAddress;
    }

    public void setSl_imgAddress(String sl_imgAddress) {
        this.sl_imgAddress = sl_imgAddress;
    }

    public String getSl_title() {
        return sl_title;
    }

    public void setSl_title(String sl_title) {
        this.sl_title = sl_title;
    }

    public String getSl_tag() {
        return sl_tag;
    }

    public void setSl_tag(String sl_tag) {
        this.sl_tag = sl_tag;
    }

    public String getSl_detail() {
        return sl_detail;
    }

    public void setSl_detail(String sl_detail) {
        this.sl_detail = sl_detail;
    }

    public String getCollect() {
        return collect;
    }

    public void setCollect(String collect) {
        this.collect = collect;
    }

    @Override
    public String toString() {
        return "SongList{" +
                "sl_id=" + sl_id +
                ", sl_name='" + sl_name + '\'' +
                ", sl_main='" + sl_main + '\'' +
                ", sl_imgAddress='" + sl_imgAddress + '\'' +
                ", sl_title='" + sl_title + '\'' +
                ", sl_tag='" + sl_tag + '\'' +
                ", sl_detail='" + sl_detail + '\'' +
                ", collect='" + collect + '\'' +
                '}';
    }
}
