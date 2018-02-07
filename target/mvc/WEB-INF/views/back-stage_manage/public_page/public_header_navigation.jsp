<%--
  Created by IntelliJ IDEA.
  User: knife
  Date: 2017/11/5
  Time: 15:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" pageEncoding="UTF-8"%>
<div class="navbar navbar-default" role="navigation">
    <div class="navbar-header">
        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target=".navbar-collapse">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
        </button>
        <a class="" href="person/person"><span class="navbar-brand"><span class="fa fa-paper-plane"></span> ASTERISM</span></a>
    </div>

    <div class="navbar-collapse collapse" style="height: 1px;">
        <ul id="main-menu" class="nav navbar-nav navbar-right">
            <li class="dropdown hidden-xs">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                    <span class="glyphicon glyphicon-user padding-right-small" style="position:relative;top: 3px;"></span> ${user_name}
                    <i class="fa fa-caret-down"></i>
                </a>

                <ul class="dropdown-menu">
                    <li><a href="">占xxxx位</a></li>
                    <li class="divider"></li>
                    <li class="dropdown-header">占xxxx位</li>
                    <li><a href="">占xxxx位</a></li>
                    <li><a href="">占xxxx位</a></li>
                    <li><a tabindex="-1" href="">占xxxx位</a></li>
                    <li class="divider"></li>
                    <li><a tabindex="-1" href="../../../../login.jsp">退出登录</a></li>
                </ul>
            </li>
        </ul>

    </div>
</div>

<div class="sidebar-nav">
    <ul>
        <li><a href="#" data-target=".dashboard-menu" class="nav-header" data-toggle="collapse"><i class="fa fa-home"></i> 公会管理<i class="fa fa-collapse"></i></a></li>
        <li>
            <ul class="dashboard-menu nav nav-list collapse in">
                <li ><a href="${path}/person/person"><span class="fa fa-paw"></span>&nbsp;&nbsp;人员管理</a></li>
                <li ><a href="${path}/guild/query_guild"><span class="fa fa-envelope"></span>&nbsp;&nbsp;公会信息</a></li>
                <li ><a href="${path}/applicant/applicant"><span class="fa fa-plus"></span>&nbsp;&nbsp;申请管理</a></li>
                <li ><a href="${path}/news/news"><span class="fa fa-hacker-news"></span>&nbsp;&nbsp;新闻管理</a></li>
                <li ><a href="${path}/instance/instance"><span class="fa fa-slack"></span>&nbsp;&nbsp;副本管理</a></li>
                <li ><a href="${path}/boss/boss"><span class="fa fa-spinner"></span>&nbsp;&nbsp;进度管理</a></li>
            </ul>
        </li>
    </ul>
</div>

