package com.guild.mapper;
import com.guild.model.Person;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
/**
 * Created by LJH on 2017/10/12.
 */
@Repository
public interface PersonMapper{


    void add(Person person);

    void delete(int id);

    List<Person> get(@Param("person_id") int person_id);

    void update(Person person);

    List<Person> list(@Param("start") int start, @Param("length") int length );

    List<Person> check_rename(@Param("name") String name);

    int count();

    String get_name(@Param("person_id") int person_id);

    void update_status(int person_id, boolean person_status);

    Boolean select_status(@Param("person_id") int person_id);

    List<Person> fast_query(int start, int length, String person_name);

    int fast_query_count(@Param("person_name") String person_name);


    void insert_applicanter(String name, String equip_level, long time, boolean is_display);

    Person page_one_person(int person_id);

    List<Person> get_propsal_person();

    List<Person> list_person();
}
