package com.cjj.entity;

import java.io.Serializable;

public class UserSignIn implements Serializable {
    private int usi_id;
    private String uer_act;
    private String usi_startDay;
    private String usi_nextDay;
    private int usi_continueDay;
    private String usi_cookies;

    public int getUsi_id() {
        return usi_id;
    }

    public void setUsi_id(int usi_id) {
        this.usi_id = usi_id;
    }

    public String getUer_act() {
        return uer_act;
    }

    public void setUer_act(String uer_act) {
        this.uer_act = uer_act;
    }

    public String getUsi_startDay() {
        return usi_startDay;
    }

    public void setUsi_startDay(String usi_startDay) {
        this.usi_startDay = usi_startDay;
    }

    public String getUsi_nextDay() {
        return usi_nextDay;
    }

    public void setUsi_nextDay(String usi_nextDay) {
        this.usi_nextDay = usi_nextDay;
    }

    public int getUsi_continueDay() {
        return usi_continueDay;
    }

    public void setUsi_continueDay(int usi_continueDay) {
        this.usi_continueDay = usi_continueDay;
    }

    public String getUsi_cookies() {
        return usi_cookies;
    }

    public void setUsi_cookies(String usi_cookies) {
        this.usi_cookies = usi_cookies;
    }

    @Override
    public String toString() {
        return "UserSignIn{" +
                "usi_id=" + usi_id +
                ", uer_act='" + uer_act + '\'' +
                ", usi_startDay='" + usi_startDay + '\'' +
                ", usi_nextDay='" + usi_nextDay + '\'' +
                ", usi_continueDay=" + usi_continueDay +
                ", usi_cookies='" + usi_cookies + '\'' +
                '}';
    }
}
