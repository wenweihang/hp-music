package com.cjj.entity;

public class LogHistory {
    private int ulh_id;
    private String uer_act;
    private String ulh_ip;
    private String ulh_address;
    private String ulh_time;

    public int getUlh_id() {
        return ulh_id;
    }

    public void setUlh_id(int ulh_id) {
        this.ulh_id = ulh_id;
    }

    public String getUer_act() {
        return uer_act;
    }

    public void setUer_act(String uer_act) {
        this.uer_act = uer_act;
    }

    public String getUlh_ip() {
        return ulh_ip;
    }

    public void setUlh_ip(String ulh_ip) {
        this.ulh_ip = ulh_ip;
    }

    public String getUlh_address() {
        return ulh_address;
    }

    public void setUlh_address(String ulh_address) {
        this.ulh_address = ulh_address;
    }

    public String getUlh_time() {
        return ulh_time;
    }

    public void setUlh_time(String ulh_time) {
        this.ulh_time = ulh_time;
    }

    @Override
    public String toString() {
        return "LogHistory{" +
                "ulh_id=" + ulh_id +
                ", uer_act='" + uer_act + '\'' +
                ", ulh_ip='" + ulh_ip + '\'' +
                ", ulh_address='" + ulh_address + '\'' +
                ", ulh_time='" + ulh_time + '\'' +
                '}';
    }
}
