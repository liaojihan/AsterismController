package com.guild.controller;

import com.guild.model.News;
import com.guild.service.NewsService;
import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.util.List;

/**
 * Created by LJH on 2017/11/13.
 */
@Controller
@RequestMapping("/news")
public class NewsController {

    @Autowired
    NewsService newsService;

    @RequestMapping(value = "news", method = RequestMethod.GET)
    public String news(){
        //新闻主视图
        return "back-stage_manage/news/news";
    }

    @RequestMapping(value = "query_news", method = RequestMethod.GET)
    @ResponseBody
    public String query_news(HttpServletRequest request){
        //查询所有新闻信息
        int start = Integer.parseInt(request.getParameter("start"));
        int length = Integer.parseInt(request.getParameter("length"));
        JSONObject jsonObject = new JSONObject();
        try {
            List<News> newsList = newsService.query_news(start, length);
            int news_count = newsService.get_count();
            jsonObject.put("data",newsList);
            jsonObject.put("recordsTotal", news_count);
            jsonObject.put("recordsFiltered",news_count);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return jsonObject.toString();
    }

    @RequestMapping(value = "add_news" , method = RequestMethod.POST)
    @ResponseBody
    public String add_news(News news, MultipartFile header_pic, HttpServletRequest request){
        //添加新闻
        JSONObject jsonObject = new JSONObject();
        try {
            List<News> newsList = newsService.check_rename(news.getTitle());
            if (newsList.size() == 0){
                newsService.add_news(news, header_pic, request);
                jsonObject.put("success", "1");
            }else {
                jsonObject.put("success", "0");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return jsonObject.toString();
    }

    @RequestMapping(value = "upload_news_pic", method = RequestMethod.POST)
    @ResponseBody
    public String upload_news_pic(MultipartFile news_pic,HttpServletRequest request) throws IOException {
        //新闻上传图片处理
        JSONObject jsonObject = new JSONObject();
        String news_pic_path;
        try {
            news_pic_path = newsService.handle_upload(news_pic, request);
            news_pic_path = "/" +news_pic_path;
            jsonObject.put("url", news_pic_path);
        } catch (IOException e) {
            e.printStackTrace();
        }
        return jsonObject.toString();
    }

    @RequestMapping(value = "delete_news" , method = RequestMethod.POST)
    @ResponseBody
    public String delete_news(int news_id){
        //删除新闻
        JSONObject jsonObject = new JSONObject();
        try {
            newsService.delete_news(news_id);
            jsonObject.put("success", "1");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return jsonObject.toString();
    }

    @RequestMapping(value = "get_news", method = RequestMethod.GET)
    @ResponseBody
    public String get_news(int news_id){
        //编辑新闻
        JSONObject jsonObject = new JSONObject();
        try {
            News news = newsService.get_news(news_id);
            jsonObject.put("news_id", news_id);
            jsonObject.put("title", news.getTitle());
            jsonObject.put("source", news.getSource());
            jsonObject.put("content", news.getContent());
        } catch (JSONException e) {
            e.printStackTrace();
        }
        return jsonObject.toString();
    }

    @RequestMapping(value = "update_news", method = RequestMethod.POST)
    @ResponseBody
    public String update_news(News news, MultipartFile file,HttpServletRequest request) throws IOException{
        //更新新闻
        JSONObject jsonObject = new JSONObject();
        List<News> flag_news = newsService.check_rename(news.getTitle());
        if (flag_news.size() == 0){
            newsService.update_news(news,file,request);
            jsonObject.put("success", "1");
        }else {
            if (flag_news.get(0).getTitle().equals(news.getTitle())){
                newsService.update_news(news,file,request);
                jsonObject.put("success", "1");
            }else {
                jsonObject.put("success", "0");
            }
        }
        return jsonObject.toString();
    }

    @RequestMapping(value = "fast_query_news",method = RequestMethod.GET)
    @ResponseBody
    public String fast_query_news(String condition, HttpServletRequest request){
        //模糊查询
        JSONObject jsonObject = new JSONObject();
        int start = Integer.parseInt(request.getParameter("start"));
        int length = Integer.parseInt(request.getParameter("length"));
        try {
            List<News> newsList = newsService.fast_query_news(start, length, condition);
            int count = newsService.fast_query_count(condition);
            jsonObject.put("data",newsList);
            jsonObject.put("recordsTotal", count);
            jsonObject.put("recordsFiltered",count);
        } catch (JSONException e) {
            e.printStackTrace();
        }
        return jsonObject.toString();
    }

}
