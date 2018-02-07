package com.guild.model;

/**
 * Created by LJH on 2017/10/20.
 */
public class Profession {
    //职业
    private int id;
    private String name;//职业名称
    private String pro_color;//职业颜色

    public String getPro_color() {
        return pro_color;
    }

    public void setPro_color(String pro_color) {
        this.pro_color = pro_color;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
