package com.guild.controller;

import com.guild.model.Instance;
import com.guild.service.InstanceService;
import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * Created by LJH on 2017/11/23.
 */
@Controller
@RequestMapping("instance")
public class InstanceController {
    @Autowired
    InstanceService instanceService;

    @RequestMapping(value = "add_instance",method = RequestMethod.POST)
    @ResponseBody
    public String add_instance(Instance instance){
        JSONObject jsonObject = new JSONObject();
        try {
            List<Instance> instances = instanceService.check_rename(instance.getName());
            if (instances.size() == 0){
                instanceService.add_instance(instance);
                jsonObject.put("success","1");
            }else {
                jsonObject.put("success", "0");
            }
        } catch (JSONException e) {
            e.printStackTrace();
        }
        return jsonObject.toString();
    }

    @RequestMapping(value = "delete_instance",method = RequestMethod.POST)
    @ResponseBody
    public String delete_instance(int id){
        JSONObject jsonObject = new JSONObject();
        try {
            instanceService.delete_instance(id);
            jsonObject.put("success", "1");
        } catch (Exception e) {
            e.printStackTrace();
        }

        return jsonObject.toString();
    }

    @RequestMapping(value = "get_instance", method = RequestMethod.GET)
    @ResponseBody
    public String get_instance(int id){
        JSONObject jsonObject = new JSONObject(id);
        try {
            Instance instance = instanceService.get_instance(id);
            System.out.println(instance.getName());
            jsonObject.put("id",instance.getId());
            jsonObject.put("name",instance.getName());
        } catch (JSONException e) {
            e.printStackTrace();
        }
        return jsonObject.toString();
    }

    @RequestMapping(value = "update_instance", method = RequestMethod.POST)
    @ResponseBody
    public String update_instance(Instance instance){
        JSONObject jsonObject = new JSONObject();
        try {
            instanceService.update_instance(instance);
            jsonObject.put("success", "1");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return jsonObject.toString();
    }

    @RequestMapping(value = "query_instance", method = RequestMethod.GET)
    @ResponseBody
    public String query_instance(HttpServletRequest request){
        int start = Integer.parseInt(request.getParameter("start"));
        int length = Integer.parseInt(request.getParameter("length"));
        JSONObject jsonObject = new JSONObject();
        try {
            List<Instance> instances = instanceService.query_instance(start,length);
            int instance_count = instanceService.count();
            jsonObject.put("data",instances);
            jsonObject.put("recordsTotal", instance_count);
            jsonObject.put("recordsFiltered",instance_count);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return jsonObject.toString();
    }

    @RequestMapping(value = "query_instance_option", method = RequestMethod.GET)
    @ResponseBody
    public String query_instance_option(){
        JSONObject jsonObject = new JSONObject();
        String result_option = "";
        List<Instance> instances = instanceService.query_instance_option();
        for (Instance instance:instances){
            String name = instance.getName();
            result_option += "<option value='"+name+"'>"+name+"</option>";
        }
        jsonObject.put("instance_option",result_option);
        return jsonObject.toString();
    }

    @RequestMapping(value = "search_instance", method = RequestMethod.GET)
    @ResponseBody
    public String search_instance(String instance_name, HttpServletRequest request){
        JSONObject jsonObject = new JSONObject();
        try {
            List<Instance> instanceList = instanceService.search_instance(instance_name, request);
            System.out.println(instanceList.size());
            int instance_count = instanceService.instance_count(instance_name);
            jsonObject.put("data",instanceList);
            jsonObject.put("recordsTotal", instance_count);
            jsonObject.put("recordsFiltered",instance_count);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return jsonObject.toString();
    }

    @RequestMapping(value = "instance", method = RequestMethod.GET)
    public String instance(){
        return "back-stage_manage/instance/instance";
    }
}
