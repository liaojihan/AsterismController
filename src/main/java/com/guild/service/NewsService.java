package com.guild.service;

import com.guild.model.News;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.util.List;

/**
 * Created by LJH on 2017/11/13.
 */
public interface NewsService {
    List<News> query_news(int start, int length);

    int get_count();

    List<News> check_rename(String title);

    void add_news(News news, MultipartFile file, HttpServletRequest request) throws IOException;

    void delete_news(int news_id);

    void update_news(News news, MultipartFile file, HttpServletRequest request) throws IOException;

    News get_news(int news_id);

    String handle_upload(MultipartFile news_pic, HttpServletRequest request) throws IOException;

    List<News> fast_query_news(int start, int length, String condition);

    int fast_query_count(String condition);
}
