package com.guild.service.impl;

import com.guild.mapper.PersonMapper;
import com.guild.mapper.ProfessionMapper;
import com.guild.model.Applicanter;
import com.guild.service.ApplicantService;
import com.guild.mapper.ApplicantMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

/**
 * Created by LJH on 2017/10/27.
 */
@Service
public class ApplicantServiceImpl implements ApplicantService {

    @Autowired
    ApplicantMapper applicantMapper;

    @Autowired
    PersonMapper personMapper;

    @Autowired
    ProfessionMapper professionMapper;

    @Override
    public void add_applicanter(Applicanter applicanter) {
        String name = professionMapper.get_pro_name(applicanter.getProfession());
        applicanter.setProfession_name(name);
        applicantMapper.add_applicanter(applicanter);
    }

    @Override
    public void delete_applicanter(int id) {
        applicantMapper.delete_applicanter(id);
    }

    @Override
    public int quert_count() {
        return applicantMapper.quert_count();
    }

    @Override
    public List<Applicanter> query_applicanter(int start, int length) {
        return applicantMapper.query_applicanter(start, length);
    }

    @Override
    public void import_guild(int id) {
        Applicanter applicanter = applicantMapper.get_applicant_msg(id);
        personMapper.insert_applicanter(applicanter.getName(),applicanter.getEquip_level(),new Date().getTime(),false);
        applicantMapper.delete_applicanter(id);
    }

    @Override
    public List<Applicanter> fast_query_applicant(int start, int length, String applicant_name) {
        return applicantMapper.fast_query_applicant(start,length,applicant_name);
    }

    @Override
    public int query_app_count(String applicant_name) {
        return applicantMapper.query_app_count(applicant_name);
    }
}
