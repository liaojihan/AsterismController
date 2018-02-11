package com.guild.service;

import com.guild.model.Boss;
import com.guild.model.News;
import com.guild.model.Person;
import com.guild.model.GuildMessage;

import java.util.List;

/**
 * Created by LJH on 2017/11/10.
 */
public interface HomePageService {
    List<Person> get_propsal_person();

    List<Person> get_person();

    GuildMessage get_guild_message();

    List<News> get_newest_news();

    List<News> news_information();

    int news_count();

    List<Boss> get_boss_information();
}
