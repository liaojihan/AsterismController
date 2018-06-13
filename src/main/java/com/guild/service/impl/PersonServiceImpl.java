package com.guild.service.impl;
import com.guild.model.Person;
import com.guild.util.Handle_Pic;
import com.guild.mapper.PersonMapper;
import com.guild.mapper.ProfessionMapper;
import com.guild.service.PersonService;
import com.guild.util.Handle_Time;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.text.ParseException;
import java.util.List;

/**
 * Created by LJH on 2017/10/12.
 */
@Service
public class PersonServiceImpl implements PersonService {


    @Autowired
    private PersonMapper personMapper;
    @Autowired
    private ProfessionMapper professionMapper;

    //添加成员
    public void add(Person person, MultipartFile file, HttpServletRequest request) throws IOException {
        //头像文件处理
        String search = "person";
        String pic_path = Handle_Pic.manage_pic(file, request, search);
        person.setPic_path(pic_path);
        //时间处理
        String time = person.getJoin_time();
        String join_time;
        try {
            join_time = Handle_Time.dateToStamp(time);
            person.setJoin_time(join_time);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        personMapper.add(person);
    }

    //删除成员信息
    public void delete(int id) {
        personMapper.delete(id);
    }

    //编辑成员信息
    public List<Person> get(int id) {

        List<Person> personList = personMapper.get(id);
        for (Person person:personList) {
            String time = person.getJoin_time();
            String join_time = Handle_Time.stampToDate(time);
            person.setJoin_time(join_time);
        }

        return personList;

    }

    //更改成员信息
    public void update(Person person,MultipartFile file,HttpServletRequest request) throws IOException {
        //头像文件处理
        String search = "person";
        String pic_path = Handle_Pic.manage_pic(file, request, search);
        person.setPic_path(pic_path);
        //时间处理
        String time = person.getJoin_time();
        String join_time;
        try {
            join_time = Handle_Time.dateToStamp(time);
            person.setJoin_time(join_time);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        personMapper.update(person);

    }

    //遍历所有成员
    public List<Person> list(int start, int length){

        List<Person> personList = personMapper.list(start, length);
        for (Person person:personList) {
            String time = person.getJoin_time();
            String join_time = Handle_Time.stampToDate(time);
            person.setJoin_time(join_time);
            int pro_id = person.getPro_id();
            if(pro_id == 0){
                person.setPro_name("未知职业");
            }else {
                String pro_name = professionMapper.get_pro_name(pro_id);
                person.setPro_name(pro_name);
            }
        }
        return personList;

    }

    //重名验证
    public List<Person> check_rename(String name) {
        return personMapper.check_rename(name);
    }

    @Override
    //查询成员数量
    public int count() {
        return personMapper.count();
    }

    @Override
    //查询单个成员名
    public String get_name(int person_id) {
        return personMapper.get_name(person_id);
    }

    @Override
    public void update_status(int person_id) {
        Boolean person_status = personMapper.select_status(person_id);
        person_status = !person_status;
        personMapper.update_status(person_id, person_status);
    }

    @Override
    public List<Person> fast_query(int start, int length, String person_name) {
        List<Person> personList = personMapper.fast_query(start, length, person_name);
        for (Person person:personList) {
            String time = person.getJoin_time();
            String join_time = Handle_Time.stampToDate(time);
            person.setJoin_time(join_time);
            int pro_id = person.getPro_id();
            String pro_name = professionMapper.get_pro_name(pro_id);
            person.setPro_name(pro_name);
        }
        return personList;
    }


    @Override
    public int fast_query_count(String person_name) {
        return personMapper.fast_query_count(person_name);
    }

    @Override
    public Person page_one_person(int person_id) {
        Person person;
        while (true){
            person = personMapper.page_one_person(person_id);
            if (person == null){
                person_id +=1;
            }else {
                break;
            }
        }
        return person;
    }
}
