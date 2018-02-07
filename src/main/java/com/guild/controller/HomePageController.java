package com.guild.controller;
import com.guild.model.News;
import com.guild.service.HomePageService;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import java.util.List;
/**
 * Created by LJH on 2017/11/10.
 */
@Controller
public class HomePageController {

    @Autowired
    HomePageService homePageService;

    @RequestMapping(value = "home_page", method = RequestMethod.GET)
    public String home_page(){
//        ModelAndView mav = new ModelAndView();
//        try {
//            List<Person> propsalPersonList = homePageService.get_propsal_person();
//            List<News> newsList = homePageService.get_newest_news();
//            mav.addObject("pro_person_list",propsalPersonList);
//            mav.addObject("news_list",newsList);
//            mav.setViewName("homepage/home_page/home_page");
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//        return mav;
        return "homepage/home_page/home_page";
    }

    @RequestMapping(value = "news_information" ,method = RequestMethod.GET)
    public String news_information(){
        //新闻列表页
        return "news_information";
    }

    @RequestMapping(value = "get_news_information" ,method = RequestMethod.GET)
    @ResponseBody
    public String get_news_information(){
        JSONObject jsonObject = new JSONObject();
        try {
            List<News> newsList = homePageService.news_information();
//            int news_count = homePageService.news_count();
//            page.caculateLast(news_count);
            jsonObject.put("newList",newsList);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return jsonObject.toString();
    }

    @RequestMapping(value = "personnel_introduction",method = RequestMethod.GET)
    public ModelAndView personnel_introduction(){
        ModelAndView mav = new ModelAndView();
        mav.setViewName("personnel_introduction");
        return mav;
    }

    @RequestMapping(value = "about_us",method = RequestMethod.GET)
    public ModelAndView about_us(){
        ModelAndView mav = new ModelAndView();
        mav.setViewName("about_us");
        return mav;
    }
}
