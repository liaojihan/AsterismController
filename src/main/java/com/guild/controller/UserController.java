package com.guild.controller;

import com.guild.model.User;
import com.guild.service.UserService;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

/**
 * Created by knife on 2017/10/16.
 */
@Controller
@RequestMapping("/user")
@SessionAttributes("user_name")
public class UserController {

    @Autowired
    UserService userService;

    @RequestMapping(value = "/login", method = RequestMethod.GET,produces="text/html;charset=UTF-8")
    @ResponseBody
    public String login(User user, Model model){
        JSONObject jsonObject = new JSONObject();
        model.addAttribute("user_name",user.getName());
        Boolean flag_user = userService.check_user(user);
        if (flag_user){
            jsonObject.put("success", "1");
        }else {
            jsonObject.put("success", "0");
        }
        return jsonObject.toString();
    }

    @RequestMapping("add")
    @ResponseBody
    public String add(User user){
        Boolean flag_user = userService.check_rename(user);
        if (flag_user) {
            return "1";
        }else {
            return "0";
        }
    }
}
