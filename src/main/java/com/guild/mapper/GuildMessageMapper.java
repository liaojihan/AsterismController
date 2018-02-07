package com.guild.mapper;
import com.guild.model.GuildMessage;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by LJH on 2017/10/13.
 */
@Repository
public interface GuildMessageMapper{

    void add(GuildMessage guildMessage);


    GuildMessage list();

    void update_recruit_msg(GuildMessage guildMessage);

    void update_guild_msg(GuildMessage guildMessage);

    void add_recruit_msg(GuildMessage guildMessage);

    void add_guild_msg(GuildMessage guildMessage);

    List<GuildMessage> check_guildMessage_is_empty();

    GuildMessage get_guild_message();
}
