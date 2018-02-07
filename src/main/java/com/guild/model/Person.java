package com.guild.model;

import org.springframework.web.multipart.MultipartFile;

import java.util.Date;

/**
 * Created by LJH on 2017/10/12.
 */
public class Person {
    private int id;//人员id
    private String name;//人员名字
    private String equip_level;//装等
    private String remark = "";//描述
    private String join_time;//入会时间
    private String feel = "";//感受
    private String nick_name = "";//外号、昵称
    private int pro_id;//职业id
    private String pro_name;//职业名字
    private String will_order = "";//会阶
    private String location = "";//团队定位
    private Boolean is_display = false;//是否上榜
    private String pic_path = "";//头像文件路径

    public String getPic_path() {
        return pic_path;
    }

    public void setPic_path(String pic_path) {
        this.pic_path = pic_path;
    }

    public Boolean getIs_display() {
        return is_display;
    }

    public void setIs_display(Boolean is_display) {
        this.is_display = is_display;
    }

    public String getWill_order() {
        return will_order;
    }

    public void setWill_order(String will_order) {
        this.will_order = will_order;
    }
    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public String getPro_name() {
        return pro_name;
    }

    public void setPro_name(String pro_name) {
        this.pro_name = pro_name;
    }

    public int getPro_id() {
        return pro_id;
    }

    public void setPro_id(int pro_id) {
        this.pro_id = pro_id;
    }
    //    private String professional_colors;
//
//    public String getProfessional_colors() {
//        return professional_colors;
//    }
//
//    public void setProfessional_colors(String professional_colors) {
//        this.professional_colors = professional_colors;
//    }

    public String getNick_name() {
        return nick_name;
    }

    public void setNick_name(String nick_name) {
        this.nick_name = nick_name;
    }

    public String getJoin_time() {
        return join_time;
    }

    public void setJoin_time(String join_time) {
        this.join_time = join_time;
    }

    public String getFeel() {
        return feel;
    }

    public void setFeel(String feel) {
        this.feel = feel;
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

    public String getEquip_level() {
        return equip_level;
    }

    public void setEquip_level(String equip_level) {
        this.equip_level = equip_level;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }
}
