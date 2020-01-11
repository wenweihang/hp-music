package com.cjj.entity;

import java.io.Serializable;

public class AdminUser implements Serializable {
    private int admuer_id;
    private String admuer_name;
    private String admuer_act;
    private String admuer_pwd;
    private String admuer_headImg;

    public int getAdmuer_id() {
        return admuer_id;
    }

    public void setAdmuer_id(int admuer_id) {
        this.admuer_id = admuer_id;
    }

    public String getAdmuer_name() {
        return admuer_name;
    }

    public void setAdmuer_name(String admuer_name) {
        this.admuer_name = admuer_name;
    }

    public String getAdmuer_act() {
        return admuer_act;
    }

    public void setAdmuer_act(String admuer_act) {
        this.admuer_act = admuer_act;
    }

    public String getAdmuer_pwd() {
        return admuer_pwd;
    }

    public void setAdmuer_pwd(String admuer_pwd) {
        this.admuer_pwd = admuer_pwd;
    }

    public String getAdmuer_headImg() {
        return admuer_headImg;
    }

    public void setAdmuer_headImg(String admuer_headImg) {
        this.admuer_headImg = admuer_headImg;
    }

    @Override
    public String toString() {
        return "AdminUser{" +
                "admuer_id=" + admuer_id +
                ", admuer_name='" + admuer_name + '\'' +
                ", admuer_act='" + admuer_act + '\'' +
                ", admuer_pwd='" + admuer_pwd + '\'' +
                ", admuer_headImg='" + admuer_headImg + '\'' +
                '}';
    }
}
