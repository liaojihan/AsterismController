package com.guild.service.impl;
import com.guild.mapper.GuildMessageMapper;
import com.guild.model.GuildMessage;
import com.guild.service.GuildMessageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by LJH on 2017/10/13.
 */
@Service
public class GuildMessageServiceImpl implements GuildMessageService {

    @Autowired
    GuildMessageMapper guildMessageMapper;

    public void add(GuildMessage guildMessage) {
        List<GuildMessage> guildMessageList = guildMessageMapper.check_guildMessage_is_empty();
        if (guildMessage.getGuild_msg() == null || guildMessage.getGuild_msg().equals("")){
            if (guildMessageList.size() == 0){
                guildMessageMapper.add_recruit_msg(guildMessage);
            }else {
                guildMessageMapper.update_recruit_msg(guildMessage);
            }

        }

        if (guildMessage.getRecruit_msg() == null || guildMessage.getRecruit_msg().equals("")){
            if (guildMessageList.size() == 0){
                guildMessageMapper.add_guild_msg(guildMessage);
            }else {
                guildMessageMapper.update_guild_msg(guildMessage);
            }

        }
    }

    public void update(GuildMessage guildMessage) {

        if (guildMessage.getGuild_msg() == null || guildMessage.getGuild_msg().equals("")){
            guildMessageMapper.update_recruit_msg(guildMessage);
        }

        if (guildMessage.getRecruit_msg() == null || guildMessage.getRecruit_msg().equals("")){
            guildMessageMapper.update_guild_msg(guildMessage);
        }
    }

    public GuildMessage list() {
        return guildMessageMapper.list();
    }

}
