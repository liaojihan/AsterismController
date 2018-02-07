<%--
  Created by IntelliJ IDEA.
  User: LJH
  Date: 2017/10/16
  Time: 17:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path=request.getContextPath();
    session.setAttribute("realPath", request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/");
%>
<html xmlns="http://www.w3.org/1999/xhtml"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <title>Bootstrap Admin</title>
    <script src="js/jQuery/jQuery-2.1.4.min.js"></script>
    <script src="js/layer-v3.1.0/layer/layer.js"></script>
    <link href="Wopop_files/style_log.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" type="text/css" href="Wopop_files/style.css">
    <link rel="stylesheet" type="text/css" href="Wopop_files/userpanel.css">
    <link rel="stylesheet" type="text/css" href="Wopop_files/jquery.ui.all.css">


    <link rel="stylesheet" type="text/css" href="static/StarrySky/css/normalize.css" />
    <link rel="stylesheet" type="text/css" href="static/StarrySky/css/demo.css" />
    <!--必要样式-->
    <link rel="stylesheet" type="text/css" href="static/StarrySky/css/component.css" />
    <!--[if IE]>
    <script src="static/StarrySky/js/html5.js"></script>
    <![endif]-->

</head>

<script type="text/javascript">

    document.onkeydown = function (event) {
        switch (event.keyCode){
            case 13:
                if (!window.buttonIsFocused) login($("#check_sub"));
                break;
        }
    };

    function login() {
        var name = $("#user_name").val().trim();
        var password = $("#user_pwd").val().trim();
        if (name == "" || name.length == 0) {
            layer.msg("请输入用户名");
            $("#username").focus();
            return;
        }
        if (password == "" || password.length == 0) {
            layer.msg("请输入密码");
            $("#password").focus();
            return;
        }
        $.ajax({
            url: "user/login?name=" + name + "&&password=" + password,
            dataType: "json",
            type: "get",
            success: function (result) {
                if (result.success == "1") {
                    window.location.href = "person/person";
                }
                if (result.success == "0") {
                    layer.msg("账号不匹配，请重新输入");
                }
            },
            error: function () {
                layer.alert("服务响应超时")
            }
        });
    }

    $("body").keydown(function () {
        if (event.keyCode === "13") {//keyCode=13是回车键

        }
    });
</script>
<style>
    button {
        cursor: pointer;
        width: 330px;
        height: 46px;
        margin-top: 25px;
        padding: 0;
        background: #00b3ee;
        -moz-border-radius: 6px;
        -webkit-border-radius: 6px;
        border-radius: 50px;
        border: 1px solid #00b3ee;
        -moz-box-shadow:
                0 15px 30px 0 rgba(255,255,255,.25) inset,
                0 2px 7px 0 rgba(0,0,0,.2);
        -webkit-box-shadow:
                0 15px 30px 0 rgba(255,255,255,.25) inset,
                0 2px 7px 0 rgba(0,0,0,.2);
        box-shadow:
                0 15px 30px 0 rgba(255,255,255,.25) inset,
                0 2px 7px 0 rgba(0,0,0,.2);
        font-family: 'PT Sans', Helvetica, Arial, sans-serif;
        font-size: 14px;
        font-weight: 700;
        color: #fff;
        text-shadow: 0 1px 2px rgba(0,0,0,.1);
        -o-transition: all .2s;
        -moz-transition: all .2s;
        -webkit-transition: all .2s;
        -ms-transition: all .2s;
    }

    button:hover {
        -moz-box-shadow:
                0 15px 30px 0 rgba(255,255,255,.15) inset,
                0 2px 7px 0 rgba(0,0,0,.2);
        -webkit-box-shadow:
                0 15px 30px 0 rgba(255,255,255,.15) inset,
                0 2px 7px 0 rgba(0,0,0,.2);
        box-shadow:
                0 15px 30px 0 rgba(255,255,255,.15) inset,
                0 2px 7px 0 rgba(0,0,0,.2);
    }

    button:active {
        -moz-box-shadow:
                0 15px 30px 0 rgba(255,255,255,.15) inset,
                0 2px 7px 0 rgba(0,0,0,.2);
        -webkit-box-shadow:
                0 15px 30px 0 rgba(255,255,255,.15) inset,
                0 2px 7px 0 rgba(0,0,0,.2);
        box-shadow:
                0 5px 8px 0 rgba(0,0,0,.1) inset,
                0 1px 4px 0 rgba(0,0,0,.1);

        border: 0px solid #00b3ee;
    }
</style>
<body>
<div class="container demo-1">
    <div class="content">
        <div id="large-header" class="large-header">
            <canvas id="demo-canvas"></canvas>
            <div class="logo_box">
                <h3>欢迎你</h3>
                <form action="#" name="f" method="post">
                    <div class="input_outer">
                        <span class="u_user"></span>
                        <input id="user_name" name="logname" class="text" style="color: #FFFFFF !important" type="text" placeholder="请输入账户">
                    </div>
                    <div class="input_outer">
                        <span class="us_uer"></span>
                        <input id="user_pwd" name="logpass" class="text" style="color: #FFFFFF !important; position:absolute; z-index:100;" type="password" placeholder="请输入密码">
                    </div>
                    <div class="mb2">
                        <button type="button" id="check_sub" onclick="login(this)" onfocus="window.buttonIsFocused=true;"
                                onblur="window.buttonIsFocused=false;">Sign me in</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div><!-- /container -->
<script src="static/StarrySky/js/TweenLite.min.js"></script>
<script src="static/StarrySky/js/EasePack.min.js"></script>
<script src="static/StarrySky/js/rAF.js"></script>
<script src="static/StarrySky/js/demo-1.js"></script>
<div style="text-align:center;">
</div>

</body></html>
