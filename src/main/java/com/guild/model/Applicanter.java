package com.guild.model;

/**
 * Created by LJH on 2017/10/26.
 */
public class Applicanter {
    //申请人员
    private int id;//申请人员id
    private String name;//游戏名
    private String phone;//联系方式
    private String equip_level;//装等
    private int profession;//职业id
    private String profession_name;//职业
    private String message;//基本信息

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

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEquip_level() {
        return equip_level;
    }

    public void setEquip_level(String equip_level) {
        this.equip_level = equip_level;
    }

    public int getProfession() {
        return profession;
    }

    public void setProfession(int profession) {
        this.profession = profession;
    }

    public String getProfession_name() {
        return profession_name;
    }

    public void setProfession_name(String profession_name) {
        this.profession_name = profession_name;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }
}
