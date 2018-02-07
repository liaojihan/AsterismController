package com.guild.controller;

import com.guild.model.Applicanter;
import com.guild.service.ApplicantService;
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
 * Created by LJH on 2017/10/27.
 */
@Controller
@RequestMapping("applicant")
public class ApplicanterController {

    @Autowired
    ApplicantService applicantService;

    @RequestMapping(value = "add_applicanter", method = RequestMethod.POST)
    @ResponseBody
    public String add_applicanter(Applicanter applicanter){
        JSONObject jsonObject = new JSONObject();
        try {
            applicantService.add_applicanter(applicanter);
            jsonObject.put("success", "1");
        } catch (Exception e) {
            System.out.println(e.toString());
        }
        return jsonObject.toString();
    }

    @RequestMapping(value = "delete_applicanter", method = RequestMethod.POST)
    @ResponseBody
    public String delete_applicanter(int id){
        JSONObject jsonObject = new JSONObject();
        try {
            applicantService.delete_applicanter(id);
            jsonObject.put("success","1");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return jsonObject.toString();
    }

    @RequestMapping(value = "import_guild", method = RequestMethod.POST)
    @ResponseBody
    public String import_guild(int id){
        JSONObject jsonObject = new JSONObject();
        try {
            applicantService.import_guild(id);
            jsonObject.put("success", "1");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return jsonObject.toString();
    }

    @RequestMapping(value = "query_applicanter", method = RequestMethod.GET)
    @ResponseBody
    public String query_applicanter(HttpServletRequest request){
        int start = Integer.parseInt(request.getParameter("start"));
        int length = Integer.parseInt(request.getParameter("length"));
        JSONObject jsonObject = new JSONObject();
        try {
            List<Applicanter> applicanterList = applicantService.query_applicanter(start,length);
            int app_count = applicantService.quert_count();
            jsonObject.put("data",applicanterList);
            jsonObject.put("recordsTotal", app_count);
            jsonObject.put("recordsFiltered",app_count);
        } catch (JSONException e) {
            e.printStackTrace();
        }
        return jsonObject.toString();
    }

    @RequestMapping(value = "fast_query_applicant", method = RequestMethod.GET)
    @ResponseBody
    public String fast_query_applicant(String applicant_name, HttpServletRequest request){
        JSONObject jsonObject = new JSONObject();
        int start = Integer.parseInt(request.getParameter("start"));
        int length = Integer.parseInt(request.getParameter("length"));
        try {
            List<Applicanter> applicanterList = applicantService.fast_query_applicant(start,length,applicant_name);
            int app_count = applicantService.query_app_count(applicant_name);
            jsonObject.put("data",applicanterList);
            jsonObject.put("recordsTotal", app_count);
            jsonObject.put("recordsFiltered",app_count);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return jsonObject.toString();
    }
    @RequestMapping(value = "applicant", method = RequestMethod.GET)
    public String applicant(){
        return "back-stage_manage/applicant/applicant";
    }
}
