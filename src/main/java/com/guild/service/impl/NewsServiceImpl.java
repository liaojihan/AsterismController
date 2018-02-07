package com.guild.service.impl;

import com.guild.mapper.NewsMapper;
import com.guild.model.News;
import com.guild.service.NewsService;
import com.guild.util.Handle_Pic;
import com.guild.util.Handle_Time;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.util.Date;
import java.util.List;

/**
 * Created by LJH on 2017/11/13.
 */
@Service
public class NewsServiceImpl implements NewsService {

    @Autowired
    NewsMapper newsMapper;


    @Override
    public List<News> query_news(int start, int length) {
        List<News> newsList = newsMapper.query_news(start, length);
        if (newsList.size() > 0){
            for (News news: newsList) {
                String time = news.getRelease_time();
                String release_time = Handle_Time.stampToDate(time);
                news.setRelease_time(release_time);
            }
        }
        return newsList;
    }

    @Override
    public int get_count() {
        return newsMapper.get_count();
    }

    @Override
    public List<News> check_rename(String title) {
        return newsMapper.check_rename(title);
    }

    @Override
    public void add_news(News news, MultipartFile file, HttpServletRequest request) throws IOException {
        //图片处理
        String search = "news";
        String pic_path = Handle_Pic.manage_pic(file,request,search);
        news.setHeader_pic_path(pic_path);
        //时间处理
        String release_time = String.valueOf(new Date().getTime());
        news.setRelease_time(release_time);
        newsMapper.add_news(news);
    }

    @Override
    public void delete_news(int news_id) {
        newsMapper.delete_news(news_id);
    }

    @Override
    public void update_news(News news, MultipartFile file, HttpServletRequest request) throws IOException {
        //图片处理
        String search = "news";
        String pic_path = Handle_Pic.manage_pic(file,request,search);
        news.setHeader_pic_path(pic_path);
        newsMapper.update_news(news);
    }

    @Override
    public News get_news(int news_id) {
        return newsMapper.get_news(news_id);
    }

    @Override
    public String handle_upload(MultipartFile news_pic, HttpServletRequest request) throws IOException {
        String search = "news";
        return Handle_Pic.manage_pic(news_pic,request,search);
    }

    @Override
    public List<News> fast_query_news(int start, int length, String condition) {
        List<News> newsList = newsMapper.fast_query_news(start,length,condition);
        for (News news:newsList) {
            String time = news.getRelease_time();
            String release_time = Handle_Time.stampToDate(time);
            news.setRelease_time(release_time);
        }
        return newsList;
    }

    @Override
    public int fast_query_count(String condition) {
        return newsMapper.fast_query_count(condition);
    }
}
