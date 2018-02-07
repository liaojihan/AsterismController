package com.guild.mapper;

import com.guild.model.Applicanter;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by LJH on 2017/10/27.
 */
@Repository
public interface ApplicantMapper {
    void add_applicanter(Applicanter applicanter);

    void delete_applicanter(int id);

    int quert_count();

    List<Applicanter> query_applicanter(@Param("start") int start, @Param("length") int length);

    Applicanter get_applicant_msg(int id);

    int query_app_count(String applicant_name);

    List<Applicanter> fast_query_applicant(int start, int length, String applicant_name);
}
