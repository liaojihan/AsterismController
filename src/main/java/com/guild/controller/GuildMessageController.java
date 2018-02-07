package com.guild.controller;
import com.guild.model.GuildMessage;
import com.guild.service.GuildMessageService;
import net.sf.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * Created by LJH on 2017/10/13.
 */
@Controller
@RequestMapping("/com/guild")
public class GuildMessageController {

    @Autowired
    GuildMessageService guildMessageService;


    @RequestMapping(value = "/add_guild", method = RequestMethod.POST)
    @ResponseBody
    public String add_guild(GuildMessage guildMessage){
        JSONObject jsonObject = new JSONObject();
        try {
            guildMessageService.add(guildMessage);
            jsonObject.put("success", "1");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return jsonObject.toString();
    }

    @RequestMapping(value = "/update_guild", method = RequestMethod.POST)
    @ResponseBody
    public String update_guild(GuildMessage guildMessage){
        JSONObject jsonObject = new JSONObject();
        try {
            guildMessageService.update(guildMessage);
            jsonObject.put("success", "1");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return jsonObject.toString();
    }

    @RequestMapping(value = "/query_guild", method = RequestMethod.GET)
    public String query_guild(Model model){

        try {
            GuildMessage guild = guildMessageService.list();
            model.addAttribute("com/guild", guild);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "back-stage_manage/guild/guild";
    }

}
