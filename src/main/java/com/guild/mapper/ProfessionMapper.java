package com.guild.mapper;

import com.guild.model.Profession;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by LJH on 2017/10/20.
 */
@Repository
public interface ProfessionMapper {

    List<Profession> list();

    String get_pro_name(@Param("pro_id") int pro_id);
}
