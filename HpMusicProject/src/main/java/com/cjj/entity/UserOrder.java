package com.cjj.entity;

import java.io.Serializable;

public class UserOrder implements Serializable{
    private int uor_id;
    private String uor_orderNumber;
    private String uer_act;
    private String uor_type;
    private String uor_price;
    private String uor_state;
    private String uor_detail;
    private String uor_commodityType;
    private String uor_orderTime;
    private String uor_finishTime;

    public int getUor_id() {
        return uor_id;
    }

    public void setUor_id(int uor_id) {
        this.uor_id = uor_id;
    }

    public String getUor_orderNumber() {
        return uor_orderNumber;
    }

    public void setUor_orderNumber(String uor_orderNumber) {
        this.uor_orderNumber = uor_orderNumber;
    }

    public String getUer_act() {
        return uer_act;
    }

    public void setUer_act(String uer_act) {
        this.uer_act = uer_act;
    }

    public String getUor_type() {
        return uor_type;
    }

    public void setUor_type(String uor_type) {
        this.uor_type = uor_type;
    }

    public String getUor_price() {
        return uor_price;
    }

    public void setUor_price(String uor_price) {
        this.uor_price = uor_price;
    }

    public String getUor_state() {
        return uor_state;
    }

    public void setUor_state(String uor_state) {
        this.uor_state = uor_state;
    }

    public String getUor_detail() {
        return uor_detail;
    }

    public void setUor_detail(String uor_detail) {
        this.uor_detail = uor_detail;
    }

    public String getUor_commodityType() {
        return uor_commodityType;
    }

    public void setUor_commodityType(String uor_commodityType) {
        this.uor_commodityType = uor_commodityType;
    }

    public String getUor_orderTime() {
        return uor_orderTime;
    }

    public void setUor_orderTime(String uor_orderTime) {
        this.uor_orderTime = uor_orderTime;
    }

    public String getUor_finishTime() {
        return uor_finishTime;
    }

    public void setUor_finishTime(String uor_finishTime) {
        this.uor_finishTime = uor_finishTime;
    }

    @Override
    public String toString() {
        return "UserOrder{" +
                "uor_id=" + uor_id +
                ", uor_orderNumber='" + uor_orderNumber + '\'' +
                ", uer_act='" + uer_act + '\'' +
                ", uor_type='" + uor_type + '\'' +
                ", uor_price='" + uor_price + '\'' +
                ", uor_state='" + uor_state + '\'' +
                ", uor_detail='" + uor_detail + '\'' +
                ", uor_commodityType='" + uor_commodityType + '\'' +
                ", uor_orderTime='" + uor_orderTime + '\'' +
                ", uor_finishTime='" + uor_finishTime + '\'' +
                '}';
    }
}
