package com.guild.service;
import com.guild.model.Person;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.util.List;
/**
 * Created by LJH on 2017/10/12.
 */
public interface PersonService {

    void add(Person person, MultipartFile file, HttpServletRequest request) throws IOException;//添加成员
    void delete(int id);//删除成员
    List<Person> get(int id);//得到成员
    void update(Person person, MultipartFile file, HttpServletRequest request) throws IOException;//修改成员
    List<Person> list(int start, int length);//查询所有成员
    List<Person> check_rename(String name);//重名验证

    int count();//成员数量

    String get_name(int person_id);//获取成员名字

    void update_status(int person_id);//更改成员状态

    List<Person> fast_query(int start, int length, String person_name);//模糊查询

    int fast_query_count(String person_name);//模糊查询_成员数量

    Person page_one_person(int person_id);
}
