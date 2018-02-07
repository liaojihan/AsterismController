package com.guild.service;

import com.guild.model.User;

/**
 * Created by knife on 2017/10/16.
 */
public interface UserService {
    Boolean check_user(User user);

    Boolean check_rename(User user);

}
