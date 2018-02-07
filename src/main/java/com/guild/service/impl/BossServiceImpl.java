package com.guild.service.impl;

import com.guild.model.Boss;
import com.guild.util.Handle_Pic;
import com.guild.util.Handle_Sort;
import com.guild.mapper.BossMapper;
import com.guild.service.BossService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.util.List;

/**
 * Created by LJH on 2017/11/23.
 */
@Service
public class BossServiceImpl implements BossService{
    @Autowired
    BossMapper bossMapper;

    @Override
    public List<Boss> query_boss(HttpServletRequest request) {
        List<Boss> bossList;
        int start = Integer.parseInt(request.getParameter("start"));
        int length = Integer.parseInt(request.getParameter("length"));
        int order_column = Handle_Sort.check_sort_parameter(request);
        if (order_column != 0){
            String order_column_condition = "columns["+order_column+"][data]";
            String order_column_data = request.getParameter(order_column_condition);
            String order_dir = request.getParameter("order[0][dir]");
            bossList = bossMapper.query_boss_by_order(start,length,order_column_data,order_dir);
            for (Boss boss:bossList){
                System.out.println(boss.getBelong_to());
            }
        }else {
            bossList = bossMapper.query_boss(start,length);
        }
        return bossList;
    }

    @Override
    public int count() {
        return bossMapper.count();
    }

    @Override
    public void add_boss(Boss boss, MultipartFile boss_pic, HttpServletRequest request) throws IOException {
        String search = "boss";
        //boss头像处理
        String boss_path = Handle_Pic.manage_pic(boss_pic,request,search);
        boss.setBoss_pic_pic(boss_path);
        //默认未通过
        boss.setIs_pass(false);
        bossMapper.add_boss(boss);
    }

    @Override
    public void delete_boss(int id) {
        bossMapper.delete_boss(id);
    }

    @Override
    public Boss get_boss(int id) {
        return bossMapper.get_boss(id);
    }

    @Override
    public void update_boss(Boss boss, MultipartFile boss_pic, HttpServletRequest request) throws IOException {
        String search = "boss";
        //boss头像处理
        String boss_path = Handle_Pic.manage_pic(boss_pic,request,search);
        boss.setBoss_pic_pic(boss_path);
        bossMapper.update_boss(boss);
    }

    @Override
    public void update_status(int id) {
        boolean flag = bossMapper.select_status(id);
        System.out.println(flag);
        if (flag){
            flag = false;
        }else {
            flag = true;
        }
        bossMapper.update_status(id, flag);
    }

    @Override
    public List<Boss> search_boss(String boss_name, HttpServletRequest request) {
        List<Boss> bossList;
        int start = Integer.parseInt(request.getParameter("start"));
        int length = Integer.parseInt(request.getParameter("length"));
        int order_column = Handle_Sort.check_sort_parameter(request);
        if (order_column != 0){
            String order_column_condition = "columns["+order_column+"][data]";
            String order_column_data = request.getParameter(order_column_condition);
            String order_dir = request.getParameter("order[0][dir]");
            bossList = bossMapper.search_boss_by_order(start,length,order_column_data,order_dir,boss_name);
        }else {
            bossList = bossMapper.search_boss(start,length,boss_name);
        }
        return bossList;
    }

    @Override
    public int boss_count(String boss_name) {
        return bossMapper.boss_count(boss_name);
    }
}
