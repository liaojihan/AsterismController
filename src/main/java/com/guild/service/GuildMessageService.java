package com.guild.service;


import com.guild.model.GuildMessage;

/**
 * Created by LJH on 2017/10/13.
 */
public interface GuildMessageService {

    void add(GuildMessage guildMessage);

    void update(GuildMessage guildMessage);

    GuildMessage list();

}
