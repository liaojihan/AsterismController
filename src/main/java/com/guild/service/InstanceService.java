package com.guild.service;

import com.guild.model.Instance;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * Created by LJH on 2017/11/23.
 */
public interface InstanceService {
    List<Instance> check_rename(String name);

    void add_instance(Instance instance);

    List<Instance> query_instance(int start, int length);

    int count();

    void update_instance(Instance instance);

    Instance get_instance(int id);

    void delete_instance(int id);

    List<Instance> query_instance_option();

    List<Instance> search_instance(String instance_name, HttpServletRequest request);

    int instance_count(String instance_name);
}
