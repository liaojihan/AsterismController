package com.guild.service;

import com.guild.model.Applicanter;

import java.util.List;

/**
 * Created by LJH on 2017/10/27.
 */
public interface ApplicantService {
    void add_applicanter(Applicanter applicanter);

    void delete_applicanter(int id);

    int quert_count();

    List<Applicanter> query_applicanter(int start, int length);

    void import_guild(int id);

    List<Applicanter> fast_query_applicant(int start, int length, String applicant_name);

    int query_app_count(String applicant_name);
}
