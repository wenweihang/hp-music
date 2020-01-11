package com.cjj.entity;

import java.util.List;
import java.util.Set;

public class Page<T> {
    private String uer_act;
    private int index;
    private int currPage;
    private int pageRows;
    private int sumPage;
    private int sumCount;
    private List<T> lists;
    private Set<T> sets;
    private String sg_songList;
    private String sgr_firstLetter;
    private String sgr_region;
    private int szj_id;
    private String text;

    public String getUer_act() {
        return uer_act;
    }

    public void setUer_act(String uer_act) {
        this.uer_act = uer_act;
    }

    public int getIndex() {
        return index;
    }

    public void setIndex(int index) {
        this.index = index;
    }

    public int getCurrPage() {
        return currPage;
    }

    public void setCurrPage(int currPage) {
        this.currPage = currPage;
    }

    public int getPageRows() {
        return pageRows;
    }

    public void setPageRows(int pageRows) {
        this.pageRows = pageRows;
    }

    public int getSumPage() {
        return sumPage;
    }

    public void setSumPage(int sumPage) {
        this.sumPage = sumPage;
    }

    public int getSumCount() {
        return sumCount;
    }

    public void setSumCount(int sumCount) {
        this.sumCount = sumCount;
    }

    public List<T> getLists() {
        return lists;
    }

    public void setLists(List<T> lists) {
        this.lists = lists;
    }

    public Set<T> getSets() {
        return sets;
    }

    public void setSets(Set<T> sets) {
        this.sets = sets;
    }

    public String getSg_songList() {
        return sg_songList;
    }

    public void setSg_songList(String sg_songList) {
        this.sg_songList = sg_songList;
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

    public int getSzj_id() {
        return szj_id;
    }

    public void setSzj_id(int szj_id) {
        this.szj_id = szj_id;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    @Override
    public String toString() {
        return "Page{" +
                "uer_act='" + uer_act + '\'' +
                ", index=" + index +
                ", currPage=" + currPage +
                ", pageRows=" + pageRows +
                ", sumPage=" + sumPage +
                ", sumCount=" + sumCount +
                ", lists=" + lists +
                ", sets=" + sets +
                ", sg_songList='" + sg_songList + '\'' +
                ", sgr_firstLetter='" + sgr_firstLetter + '\'' +
                ", sgr_region='" + sgr_region + '\'' +
                ", szj_id=" + szj_id +
                ", text='" + text + '\'' +
                '}';
    }
}