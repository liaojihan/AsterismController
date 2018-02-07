package com.guild.controller;
import com.guild.model.Person;
import com.guild.service.PersonService;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import javax.servlet.http.HttpServletRequest;
import java.io.UnsupportedEncodingException;
import java.util.List;

/**
 * Created by LJH on 2017/10/12.
 */

@Controller
@RequestMapping("/person")
public class PersonController {
    boolean flag = false;
    @Autowired
    private PersonService personService;

    @RequestMapping(value ="add_person", method = RequestMethod.POST)
    @ResponseBody
    public String add_person(Person person, MultipartFile pic, HttpServletRequest request){
        //新增成员
        person.setIs_display(flag);
        String result = "";
        try {
            List<Person> flag_person = personService.check_rename(person.getName());
            if (flag_person.size() == 0 ){
                personService.add(person,pic,request);
                result = "1";
            }else {
                result = "0";
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }

    @RequestMapping(value = "delete_person", method = RequestMethod.GET,produces="text/html;charset=UTF-8")
    @ResponseBody
    public String delete_person(int person_id){
        //删除成员
        JSONObject jsonObject = new JSONObject();
        try {
            String name = personService.get_name(person_id);
            personService.delete(person_id);
            jsonObject.put("delete",name+"被无情移除公会");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return jsonObject.toString();
    }

    @RequestMapping(value = "get_person",method = RequestMethod.POST)
    @ResponseBody
    public String get_person(int person_id){
        //根据id获取对应成员信息
        JSONObject jsonObject = new JSONObject();
        try {
            List<Person> personList = personService.get(person_id);
            String name = personList.get(0).getName();
            String equip_level = personList.get(0).getEquip_level();
            String remark = personList.get(0).getRemark();
            String feel = personList.get(0).getFeel();
            String nick_name = personList.get(0).getNick_name();
            String join_time = personList.get(0).getJoin_time();
            String pic_path = personList.get(0).getPic_path();
            jsonObject.put("id",person_id);
            jsonObject.put("name", name);
            jsonObject.put("equip_level",equip_level);
            jsonObject.put("remark", remark);
            jsonObject.put("feel", feel);
            jsonObject.put("nick_name", nick_name);
            jsonObject.put("join_time",join_time);
            jsonObject.put("pic_path", pic_path);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return jsonObject.toString();
    }

    @RequestMapping(value = "update_person", method = RequestMethod.POST)
    @ResponseBody
    public String update_person(Person person,MultipartFile file,HttpServletRequest request){
        //更新成员
        String result = "";
        try {
            List<Person> flag_person = personService.check_rename(person.getName());
            if (flag_person.size() == 0){
                personService.update(person,file,request);
                result = "1";
            }else {
                if (flag_person.get(0).getName().equals(person.getName())){
                    personService.update(person,file,request);
                    result = "1";
                }else {
                    result = "0";
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }

    @RequestMapping(value = "update_status", method = RequestMethod.GET, produces="text/html;charset=UTF-8")
    @ResponseBody
    public String update_status(int person_id){
        //更改成员状态
        JSONObject jsonObject = new JSONObject();
        try {
            personService.update_status(person_id);
            jsonObject.put("success","OK");
        } catch (Exception e) {
            e.printStackTrace();
            jsonObject.put("success", "NO");
        }
        return jsonObject.toString();
    }
    @RequestMapping(value = "query_person", method = RequestMethod.POST)
    @ResponseBody
    public String query_person(HttpServletRequest request) throws UnsupportedEncodingException {
        //查询所有成员信息
        int start = Integer.parseInt(request.getParameter("start"));
        int length = Integer.parseInt(request.getParameter("length"));
        JSONObject jsonObject = new JSONObject();
        try {
            List<Person> personList = personService.list(start,length);
            int person_count = personService.count();
            jsonObject.put("data",personList);
            jsonObject.put("recordsTotal", person_count);
            jsonObject.put("recordsFiltered",person_count);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return jsonObject.toString();
    }

    @RequestMapping(value = "fast_query", method = RequestMethod.POST)
    @ResponseBody
    public String fast_query(String person_name, HttpServletRequest request){
        //模糊查询
        JSONObject jsonObject = new JSONObject();
        int start = Integer.parseInt(request.getParameter("start"));
        int length = Integer.parseInt(request.getParameter("length"));
        try {
            List<Person> personList = personService.fast_query(start,length,person_name);
            int person_count = personService.fast_query_count(person_name);
            jsonObject.put("data",personList);
            jsonObject.put("recordsTotal", person_count);
            jsonObject.put("recordsFiltered",person_count);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return jsonObject.toString();
    }

    @RequestMapping(value = "page_one_person", method = RequestMethod.GET)
    @ResponseBody
    public String page_one_person(int person_id){
        //首页单个显示人员信息
        JSONObject jsonObject = new JSONObject();
        try {
            Person person = personService.page_one_person(person_id);
            jsonObject.put("person",person);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return jsonObject.toString();
    }

    @RequestMapping(value = "person", method = RequestMethod.GET)
    public String person(){
        //成员主视图
        return "back-stage_manage/person/person";
    }

}
