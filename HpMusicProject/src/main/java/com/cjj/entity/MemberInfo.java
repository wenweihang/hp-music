package com.cjj.entity;

import java.io.Serializable;

public class MemberInfo implements Serializable{
    private int mif_id;
    private String uer_act;
    private String start_time;
    private String end_time;
    private String mif_type;

    public int getMif_id() {
        return mif_id;
    }

    public void setMif_id(int mif_id) {
        this.mif_id = mif_id;
    }

    public String getUer_act() {
        return uer_act;
    }

    public void setUer_act(String uer_act) {
        this.uer_act = uer_act;
    }

    public String getStart_time() {
        return start_time;
    }

    public void setStart_time(String start_time) {
        this.start_time = start_time;
    }

    public String getEnd_time() {
        return end_time;
    }

    public void setEnd_time(String end_time) {
        this.end_time = end_time;
    }

    public String getMif_type() {
        return mif_type;
    }

    public void setMif_type(String mif_type) {
        this.mif_type = mif_type;
    }

    @Override
    public String toString() {
        return "MemberInfo{" +
                "mif_id=" + mif_id +
                ", uer_act='" + uer_act + '\'' +
                ", start_time='" + start_time + '\'' +
                ", end_time='" + end_time + '\'' +
                ", mif_type='" + mif_type + '\'' +
                '}';
    }
}
