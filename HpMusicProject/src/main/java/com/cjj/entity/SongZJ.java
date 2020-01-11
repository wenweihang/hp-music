package com.cjj.entity;

import java.io.Serializable;

public class SongZJ implements Serializable {
    private int szj_id;
    private String szj_imgAddress;
    private String szj_author;
    private String szj_title;
    private String szj_detail;
    private String szj_releaseTime;
    private String szj_language;

    public int getSzj_id() {
        return szj_id;
    }

    public void setSzj_id(int szj_id) {
        this.szj_id = szj_id;
    }

    public String getSzj_imgAddress() {
        return szj_imgAddress;
    }

    public void setSzj_imgAddress(String szj_imgAddress) {
        this.szj_imgAddress = szj_imgAddress;
    }

    public String getSzj_author() {
        return szj_author;
    }

    public void setSzj_author(String szj_author) {
        this.szj_author = szj_author;
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

    public String getSzj_releaseTime() {
        return szj_releaseTime;
    }

    public void setSzj_releaseTime(String szj_releaseTime) {
        this.szj_releaseTime = szj_releaseTime;
    }

    public String getSzj_language() {
        return szj_language;
    }

    public void setSzj_language(String szj_language) {
        this.szj_language = szj_language;
    }

    @Override
    public String toString() {
        return "SongZJ{" +
                "szj_id=" + szj_id +
                ", szj_imgAddress='" + szj_imgAddress + '\'' +
                ", szj_author='" + szj_author + '\'' +
                ", szj_title='" + szj_title + '\'' +
                ", szj_detail='" + szj_detail + '\'' +
                ", szj_releaseTime='" + szj_releaseTime + '\'' +
                ", szj_language='" + szj_language + '\'' +
                '}';
    }
}
