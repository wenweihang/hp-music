package com.cjj.entity;

import java.io.Serializable;

public class MemberPrice implements Serializable {
    private int mpr_id;
    private String mpr_type;
    private String mpr_price;
    private int mpr_day;

    public int getMpr_id() {
        return mpr_id;
    }

    public void setMpr_id(int mpr_id) {
        this.mpr_id = mpr_id;
    }

    public String getmpr_type() {
        return mpr_type;
    }

    public void setmpr_type(String mpr_type) {
        this.mpr_type = mpr_type;
    }

    public String getMpr_price() {
        return mpr_price;
    }

    public void setMpr_price(String mpr_price) {
        this.mpr_price = mpr_price;
    }

    public int getMpr_day() {
        return mpr_day;
    }

    public void setMpr_day(int mpr_day) {
        this.mpr_day = mpr_day;
    }

    @Override
    public String toString() {
        return "MemberPrice{" +
                "mpr_id=" + mpr_id +
                ", mpr_type='" + mpr_type + '\'' +
                ", mpr_price='" + mpr_price + '\'' +
                ", mpr_day='" + mpr_day + '\'' +
                '}';
    }
}
