package com.guild.controller;

import com.guild.model.Boss;
import com.guild.service.BossService;
import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * Created by LJH on 2017/11/23.
 */
@Controller
@RequestMapping("boss")
public class BossController {

    @Autowired
    BossService bossService;

    @RequestMapping(value = "boss", method = RequestMethod.GET)
    public String boss(){
        return "back-stage_manage/boss/boss";
    }

    @RequestMapping(value = "query_boss", method = RequestMethod.GET)
    @ResponseBody
    public String query_boss(HttpServletRequest request){
        JSONObject jsonObject = new JSONObject();
        try {
            List<Boss> bosses = bossService.query_boss(request);
            int boss_count = bossService.count();
            jsonObject.put("data",bosses);
            jsonObject.put("recordsTotal", boss_count);
            jsonObject.put("recordsFiltered",boss_count);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return jsonObject.toString();
    }

    @RequestMapping(value = "add_boss", method = RequestMethod.POST)
    @ResponseBody
    public String add_boss(Boss boss, MultipartFile boss_pic,HttpServletRequest request){
        JSONObject jsonObject = new JSONObject();
        try {
            bossService.add_boss(boss,boss_pic,request);
            jsonObject.put("success","1");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return jsonObject.toString();
    }

    @RequestMapping(value = "delete_boss", method = RequestMethod.POST)
    @ResponseBody
    public String delete_boss(int id){
        JSONObject jsonObject = new JSONObject();
        try {
            bossService.delete_boss(id);
            jsonObject.put("success","1");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return jsonObject.toString();
    }

    @RequestMapping(value = "get_boss", method = RequestMethod.GET)
    @ResponseBody
    public String get_boss(int id){
        JSONObject jsonObject = new JSONObject();
        try {
            Boss boss = bossService.get_boss(id);
            jsonObject.put("id",id);
            jsonObject.put("name",boss.getName());
        } catch (JSONException e) {
            e.printStackTrace();
        }
        return jsonObject.toString();
    }

    @RequestMapping(value = "update_boss", method = RequestMethod.POST)
    @ResponseBody
    public String update_boss(Boss boss, MultipartFile boss_pic, HttpServletRequest request){
        JSONObject jsonObject = new JSONObject();
        try {
            bossService.update_boss(boss,boss_pic,request);
            jsonObject.put("success","1");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return jsonObject.toString();
    }

    @RequestMapping(value = "update_status", method = RequestMethod.POST)
    @ResponseBody
    public String update_status(int id){
        JSONObject jsonObject = new JSONObject();
        try {
            bossService.update_status(id);
            jsonObject.put("success", "1");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return jsonObject.toString();
    }

    @RequestMapping(value = "search_boss", method = RequestMethod.GET)
    @ResponseBody
    public String search_boss(String boss_name, HttpServletRequest request){
        JSONObject jsonObject = new JSONObject();
        try {
            List<Boss> bossList = bossService.search_boss(boss_name, request);
            int boss_count = bossService.boss_count(boss_name);
            jsonObject.put("data",bossList);
            jsonObject.put("recordsTotal", boss_count);
            jsonObject.put("recordsFiltered",boss_count);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return jsonObject.toString();
    }
}
