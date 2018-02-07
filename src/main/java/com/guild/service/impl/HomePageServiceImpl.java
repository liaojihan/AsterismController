package com.guild.service.impl;

import com.guild.mapper.GuildMessageMapper;
import com.guild.mapper.NewsMapper;
import com.guild.mapper.PersonMapper;
import com.guild.model.GuildMessage;
import com.guild.model.News;
import com.guild.model.Person;
import com.guild.service.HomePageService;
import com.guild.util.Handle_Time;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by LJH on 2017/11/10.
 */
@Service
public class HomePageServiceImpl implements HomePageService {

    @Autowired
    private PersonMapper personMapper;
    @Autowired
    private GuildMessageMapper guildMessageMapper;
    @Autowired
    private NewsMapper newsMapper;

    @Override
    public List<Person> get_propsal_person() {
        return personMapper.get_propsal_person();
    }

    @Override
    public List<Person> get_person() {
        List<Person> personList = personMapper.list_person();
        for (Person person:personList) {
            String time = person.getJoin_time();
            String join_time = Handle_Time.stampToDate(time);
            person.setJoin_time(join_time);
        }
        return personList;
    }

    @Override
    public GuildMessage get_guild_message() {
        return guildMessageMapper.get_guild_message();
    }

    @Override
    public List<News> get_newest_news() {
        List<News> newsList = newsMapper.get_newest_news();
        for (News news:newsList) {
            String time = news.getRelease_time();
            String release_time = Handle_Time.stampToDate(time);
            news.setRelease_time(release_time);
        }
        return newsList;
    }

    @Override
    public List<News> news_information() {
        List<News> newsList = newsMapper.news_information();
        for (News news:newsList) {
            String time = news.getRelease_time();
            String release_time = Handle_Time.stampToDate(time);
            news.setRelease_time(release_time);
        }
        return newsList;
    }

    @Override
    public int news_count() {
        return newsMapper.get_count();
    }
}
