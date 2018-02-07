package com.guild.mapper;

import com.guild.model.Instance;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by LJH on 2017/11/23.
 */
@Repository
public interface InstanceMapper {
    List<Instance> check_rename(String name);

    void add_instance(Instance instance);

    List<Instance> query_instance(@Param("start") int start, @Param("length") int length);

    int count();

    void update_instance(Instance instance);

    Instance get_instance(int id);

    void delete_instance(int id);

    List<Instance> query_instance_option();

    List<Instance> search_instance(int start, int length, String instance_name);

    int instance_count(@Param("instance_name") String instance_name);
}
