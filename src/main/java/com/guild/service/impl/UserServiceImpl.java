package com.guild.service.impl;

import com.guild.model.User;
import com.guild.service.UserService;
import com.guild.mapper.UserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by knife on 2017/10/16.
 */
@Service
public class UserServiceImpl implements UserService {

    @Autowired
    UserMapper userMapper;

    @Override
    public Boolean check_user(User user) {
        User flag_user = userMapper.check_user(user);
        if (flag_user == null){
            return false;
        }else {
            return true;
        }
    }

    @Override
    public Boolean check_rename(User user) {
        User flag_user = userMapper.check_rename(user);
        if (flag_user != null){
            return false;
        }else {
            userMapper.add(user);
            return true;
        }
    }

}
