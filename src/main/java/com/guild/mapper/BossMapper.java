package com.guild.mapper;

import com.guild.model.Boss;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by LJH on 2017/11/23.
 */
@Repository
public interface BossMapper {
    List<Boss> query_boss(@Param("start") int start, @Param("length") int length);

    int count();

    void add_boss(Boss boss);

    void delete_boss(int id);

    Boss get_boss(int id);

    void update_boss(Boss boss);

    boolean select_status(int id);

    void update_status(@Param("id") int id, @Param("flag") boolean flag);

    List<Boss> query_boss_by_order(@Param("start") int start,
                                   @Param("length") int length,
                                   @Param("order_column_data") String order_column_data,
                                   @Param("order_dir") String order_dir);

    List<Boss> search_boss_by_order(@Param("start") int start, @Param("length") int length,
                                    @Param("order_column_data") String order_column_data,
                                    @Param("order_dir") String order_dir,
                                    @Param("boss_name") String boss_name);

    List<Boss> search_boss(@Param("start") int start, @Param("length") int length, @Param("boss_name") String boss_name);

    int boss_count(@Param("boss_name") String boss_name);

    List<Boss> get_boss_information();
}
