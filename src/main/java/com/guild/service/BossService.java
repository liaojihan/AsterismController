package com.guild.service;

import com.guild.model.Boss;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.util.List;

/**
 * Created by LJH on 2017/11/23.
 */
public interface BossService {
    List<Boss> query_boss(HttpServletRequest request);

    int count();

    void add_boss(Boss boss, MultipartFile boss_pic,HttpServletRequest request) throws IOException;

    void delete_boss(int id);

    Boss get_boss(int id);

    void update_boss(Boss boss, MultipartFile boss_pic, HttpServletRequest request) throws IOException;

    void update_status(int id);

    List<Boss> search_boss(String boss_name, HttpServletRequest request);

    int boss_count(String boss_name);
}
