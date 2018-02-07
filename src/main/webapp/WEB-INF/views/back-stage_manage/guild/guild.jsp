<%--
  Created by IntelliJ IDEA.
  User: LJH
  Date: 2017/10/23
  Time: 13:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" pageEncoding="UTF-8"%>
<%
    String path=request.getContextPath();
    session.setAttribute("path", request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path);
%>
<!DOCTYPE HTML>
<html lang="en">
<%@include file="../public_page/public_import.jsp"%>
<body class=" theme-blue">
<script>
    $(document).on("click", "#save_guild_msg",function () {
        var id = $("#g_id").val();
        var guild_msg = $("#guild_msg").val();
        if (guild_msg.length == 0 || guild_msg == ""){
            layer.msg("输入为空");
            $("#guild_msg").focus();
            return;
        }
        if (id.length == 0 || id == ""){
            $.ajax({
                url:"add_guild?guild_msg="+guild_msg,
                dataType: "json",
                type:"post",
                success:function (data) {
                    if (data.success == "1"){
                        layer.confirm("确认保存?",{icon: 1},function () {
                            window.location.href = "/guild/query_guild";
                        });
                    }else {
                        layer.msg("出错啦");
                    }
                },
                error:function () {
                    layer.alert("服务响应超时");
                }
            });
        }else {
            $.ajax({
                url:"update_guild?guild_msg="+guild_msg+"&&id="+id,
                dataType: "json",
                type:"post",
                success:function (data) {
                    if (data.success == "1"){
                        layer.confirm("确认保存?",{icon: 1},function () {
                            window.location.href = "/guild/query_guild";
                        });
                    }else {
                        layer.msg("出错啦");
                    }
                },
                error:function () {
                    layer.alert("服务响应超时");
                }
            });
        }
    });

    $(document).on("click", "#save_recruit_msg",function () {
        var id = $("#g_id").val();
        var recruit_msg = $("#recruit_msg").val();
        if (recruit_msg.length == 0 || recruit_msg == ""){
            layer.msg("输入为空");
            $("#recruit_msg").focus();
            return;
        }
        if (id.length == 0 || id == ""){
            $.ajax({
                url:"add_guild",
                data:{"recruit_msg":recruit_msg},
                dataType: "json",
                type:"post",
                success:function (data) {
                    if (data.success == "1"){
                        layer.confirm("确认保存?",{icon: 1},function () {
                            window.location.href = "/guild/query_guild";
                        });
                    }else {
                        layer.msg("出错啦");
                    }
                },
                error:function () {
                    layer.alert("服务响应超时");
                }
            });
        }else {
            $.ajax({
                url:"update_guild",
                data:{"recruit_msg":recruit_msg,"id":id},
                dataType: "json",
                type:"post",
                success:function (data) {
                    if (data.success == "1"){
                        layer.confirm("确认保存?",{icon: 1},function () {
                            window.location.href = "/guild/query_guild";
                        });
                    }else {
                        layer.msg("出错啦");
                    }
                },
                error:function () {
                    layer.alert("服务响应超时");
                }
            });
        }
    });
</script>

<%@include file="../public_page/public_header_navigation.jsp"%>

<div class="content">
    <div class="header">

        <h1 class="page-title">公 会 管 理</h1>
        <ul class="breadcrumb">
            <li>Home </li>
            <li class="active"> guilds </li>
        </ul>

    </div>
    <div class="main-content">

        <ul class="nav nav-tabs">
            <li class="active"><a href="#home" data-toggle="tab">招募信息</a></li>
            <li><a href="#profile" data-toggle="tab">公会信息</a></li>
        </ul>

        <div class="row">
            <div class="col-md-4">
                <br>
                <div id="myTabContent" class="tab-content">
                    <div class="tab-pane active in" id="home">
                            <input type="hidden" id="g_id" value="${guild.id}">
                            <div class="form-group">
                                <label>招募信息</label>
                                <textarea value="Smith" rows="3" id="guild_msg" name="guild_msg" class="form-control">${guild.guild_msg}</textarea>
                            </div>
                            <div class="btn-toolbar list-toolbar">
                                <button class="btn btn-primary" id="save_guild_msg" type="button"><i class="fa fa-save"></i> 保存</button>
                            </div>
                    </div>

                    <div class="tab-pane fade" id="profile">

                            <div class="form-group">
                                <label>今日信息</label>
                                <textarea value="Smith" rows="3" id="recruit_msg" name="recruit_msg" class="form-control">${guild.recruit_msg}</textarea>
                            </div>
                            <div class="btn-toolbar list-toolbar">
                                <button class="btn btn-primary" id="save_recruit_msg"><i class="fa fa-save"></i> 保存</button>
                            </div>
                    </div>
                </div>


            </div>
        </div>



    </div>
</div>
<%@include file="../public_page/public_footer.jsp"%>

</body></html>
