package com.guild.service.impl;

import com.guild.model.Instance;
import com.guild.mapper.InstanceMapper;
import com.guild.service.InstanceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * Created by LJH on 2017/11/23.
 */
@Service
public class InstanceServiceImpl implements InstanceService{
    @Autowired
    InstanceMapper instanceMapper;

    @Override
    public List<Instance> check_rename(String name) {
        return instanceMapper.check_rename(name);
    }

    @Override
    public void add_instance(Instance instance) {
        instanceMapper.add_instance(instance);
    }

    @Override
    public List<Instance> query_instance(int start, int length) {
        return instanceMapper.query_instance(start,length);
    }

    @Override
    public int count() {
        return instanceMapper.count();
    }

    @Override
    public void update_instance(Instance instance) {
        instanceMapper.update_instance(instance);
    }

    @Override
    public Instance get_instance(int id) {
        return instanceMapper.get_instance(id);
    }

    @Override
    public void delete_instance(int id) {
        instanceMapper.delete_instance(id);
    }

    @Override
    public List<Instance> query_instance_option() {
        return instanceMapper.query_instance_option();
    }

    @Override
    public List<Instance> search_instance(String instance_name, HttpServletRequest request) {
        int start = Integer.parseInt(request.getParameter("start"));
        int length = Integer.parseInt(request.getParameter("length"));
        return instanceMapper.search_instance(start, length, instance_name);
    }

    @Override
    public int instance_count(String instance_name) {
        return instanceMapper.instance_count(instance_name);
    }
}
