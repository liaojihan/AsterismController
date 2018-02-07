package com.guild.controller;

import com.guild.model.Profession;
import com.guild.service.ProfessionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * Created by LJH on 2017/10/20.
 */
@Controller
@RequestMapping("profession")
public class ProfessionController {

    @Autowired
    ProfessionService professionService;

    @RequestMapping(value = "query_profession", method = RequestMethod.POST, produces="text/html;charset=UTF-8")
    @ResponseBody
    public String list(HttpServletResponse response){
        String result_option = "";
        try {
            List<Profession> professionList = professionService.list();
            String name;
            int id;
            for (Profession profession:professionList) {
                name = profession.getName();
                id = profession.getId();
                result_option = result_option + "<option value='"+id+"'>"+name+"</option>";
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result_option;
    }
}
