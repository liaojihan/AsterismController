package com.guild.model;

/**
 * Created by LJH on 2017/10/13.
 */
public class GuildMessage {
    private int id;
    private String guild_msg;
    private String recruit_msg;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getGuild_msg() {
        return guild_msg;
    }

    public void setGuild_msg(String guild_msg) {
        this.guild_msg = guild_msg;
    }

    public String getRecruit_msg() {
        return recruit_msg;
    }

    public void setRecruit_msg(String recruit_msg) {
        this.recruit_msg = recruit_msg;
    }
}
