package com.guild.model;

/**
 * Created by LJH on 2017/11/23.
 */
public class Boss {
    private int id;
    private String name;
    private String belong_to;//属于哪个副本
    private boolean is_pass;//是否通过
    private String boss_pic_pic;//boss头像路径

    public String getBoss_pic_pic() {
        return boss_pic_pic;
    }

    public void setBoss_pic_pic(String boss_pic_pic) {
        this.boss_pic_pic = boss_pic_pic;
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

    public String getBelong_to() {
        return belong_to;
    }

    public void setBelong_to(String belong_to) {
        this.belong_to = belong_to;
    }

    public boolean isIs_pass() {
        return is_pass;
    }

    public void setIs_pass(boolean is_pass) {
        this.is_pass = is_pass;
    }
}
