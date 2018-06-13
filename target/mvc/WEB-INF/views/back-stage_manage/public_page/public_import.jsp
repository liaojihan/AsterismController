<%--
  Created by IntelliJ IDEA.
  User: knife
  Date: 2017/11/5
  Time: 15:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" pageEncoding="UTF-8"%>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta charset="utf-8">
    <title>公会管理</title>
    <link rel="icon" href="<c:url value="/static/icon/favicon.ico"/>" type="image/x-icon">
    <meta content="IE=edge,chrome=1" http-equiv="X-UA-Compatible">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
</head>
<!-- dataTABLE -->
<script src="<c:url value="/static/plugins/jQuery/jQuery-2.1.4.min.js"/>"></script>
<link rel="stylesheet" href="<c:url value="/static/plugins/datatables/dataTables.bootstrap.min.css"/>">
<script src="<c:url value="/static/dist/js/sys.js"/>"></script>
<script src="<c:url value="/static/plugins/datatables/jquery.dataTables.min.js"/>"></script>
<script src="<c:url value="/static/plugins/datatables/dataTables.bootstrap.min.js"/>"></script>
<link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.5/css/bootstrap.min.css">
<!-- jQuery-beatpicker -->
<link rel="stylesheet" href="<c:url value="/static/BeatPicker/css/BeatPicker.min.css"/>">
<script src="<c:url value="/static/BeatPicker/js/BeatPicker.min.js"/>"></script>
<!-- layer -->
<script src="<c:url value="/static/js/layer-v3.1.0/layer/layer.js"/>"></script>
<!-- bootstrap-fileinput -->
<link rel="stylesheet" href="<c:url value="/static/bootstrap-fileinput-master/css/fileinput.min.css"/>">
<script src="<c:url value="/static/bootstrap-fileinput-master/js/fileinput.min.js"/>"></script>

<link href='http://fonts.googleapis.com/css?family=Open+Sans:400,700' rel='stylesheet' type='text/css'>
<%--<link rel="stylesheet" type="text/css" href="<c:url value="/static/AircraftAdmin-Free/lib/bootstrap/css/bootstrap.min.css"/>">--%>
<link rel="stylesheet" href="<c:url value="/static/AircraftAdmin-Free/lib/font-awesome/css/font-awesome.min.css"/>">
<link rel="stylesheet" type="text/css" href="<c:url value="/static/AircraftAdmin-Free/stylesheets/theme.css"/>">
<link rel="stylesheet" type="text/css" href="<c:url value="/static/AircraftAdmin-Free/stylesheets/premium.css"/>">
<link rel="stylesheet" type="text/css" href="<c:url value="/static/font-awesome/css/font-awesome.min.css"/>">

<!-- // 引入 jQuery.TreeView 树形菜单插件文件 -->
<script src="<c:url value="/static/treeview/lib/jquery.cookie.js"/>" type="text/javascript"></script>
<script src="<c:url value="/static/treeview/jquery.treeview.js"/>" type="text/javascript"></script>
<link rel="stylesheet" type="text/css" href="<c:url value="/static/treeview/jquery.treeview.css"/>">
<!-- 富文本 -->

<!-- Demo page code -->

<script type="text/javascript">
    $(function() {
        var match = document.cookie.match(new RegExp('color=([^;]+)'));
        if(match) var color = match[1];
        if(color) {
            $('body').removeClass(function (index, css) {
                return (css.match (/\btheme-\S+/g) || []).join(' ')
            })
            $('body').addClass('theme-' + color);
        }

        $('[data-popover="true"]').popover({html: true});

    });
</script>
<style type="text/css">
    #line-chart {
        height:300px;
        width:800px;
        margin: 0px auto;
        margin-top: 1em;
    }
    .navbar-default .navbar-brand, .navbar-default .navbar-brand:hover {
        color: #fff;
    }

    /*table th{*/
    /*text-align: center;*/
    /*}*/
    /*table td{*/
    /*text-align: center;*/
    /*}*/

</style>

<script type="text/javascript">
    $(function() {
        var uls = $('.sidebar-nav > ul > *').clone();
        uls.addClass('visible-xs');
        $('#main-menu').append(uls.clone());
    });
</script>

<script src="<c:url value="/static/AircraftAdmin-Free/lib/bootstrap/js/bootstrap.min.js"/>"></script>
<script type="text/javascript">
    $("[rel=tooltip]").tooltip();
    $(function() {
        $('.demo-cancel-click').click(function(){return false;});
    });
</script>
<style>
    body, html { font-size: 100%; 	padding: 0; margin: 0;}

    /* Reset */
    *,
    *:after,
    *:before {
        -webkit-box-sizing: border-box;
        -moz-box-sizing: border-box;
        box-sizing: border-box;
    }

    /* Clearfix hack by Nicolas Gallagher: http://nicolasgallagher.com/micro-clearfix-hack/ */
    .clearfix:before,
    .clearfix:after {
        content: " ";
        display: table;
    }

    .clearfix:after {
        clear: both;
    }

    body{
        font-weight: 500;
        font-size: 1.05em;
        font-family: "Microsoft YaHei","宋体","Segoe UI", "Lucida Grande", Helvetica, Arial,sans-serif, FreeSans, Arimo;
    }
</style>

