package com.guild.mapper;

import com.guild.model.News;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by LJH on 2017/11/13.
 */
@Repository
public interface NewsMapper {
    List<News> query_news(@Param("start") int start, @Param("length") int length);

    int get_count();

    List<News> check_rename(String title);

    void add_news(News news);

    News get_news(int news_id);

    void delete_news(int news_id);

    void update_news(News news);

    int fast_query_count(String condition);

    List<News> fast_query_news(int start, int length, String condition);

    List<News> get_newest_news();

    List<News> news_information();
}
