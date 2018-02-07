package com.guild.mapper;

import com.guild.model.User;
import org.springframework.stereotype.Repository;

/**
 * Created by knife on 2017/10/16.
 */
@Repository
public interface UserMapper {
    User check_user(User user);

    User check_rename(User user);

    void add(User user);
}
