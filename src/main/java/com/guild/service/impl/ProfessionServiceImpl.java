package com.guild.service.impl;

import com.guild.mapper.ProfessionMapper;
import com.guild.model.Profession;
import com.guild.service.ProfessionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by LJH on 2017/10/20.
 */
@Service
public class ProfessionServiceImpl implements ProfessionService {

    @Autowired
    ProfessionMapper professionMapper;

    @Override
    public List<Profession> list() {
        return professionMapper.list();
    }
}
