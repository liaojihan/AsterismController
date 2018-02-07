<%--
  Created by IntelliJ IDEA.
  User: LJH
  Date: 2017/11/21
  Time: 16:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path=request.getContextPath();
    session.setAttribute("path", request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path);
%>
<html>
<head>
    <title>Title</title>
</head>
<link rel="stylesheet" href="${path}/static/jQueryPage/page.css">
<script type="text/javascript" src="${path}/static/plugins/jQuery/jQuery-2.1.4.min.js"></script>
<script type="text/javascript" src="${path}/static/jQueryPage/page.js"></script>
<script>
    var options;
    $.ajax({
       url:"get_news_information",
       dataType: "json",
       type: "get",
       success:function (data) {
            options={
               "id":"page",//显示页码的元素
               "data":data['newList'],//显示数据
               "maxshowpageitem":5,//最多显示的页码个数
               "pagelistcount":10,//每页显示数据个数
               "callBack":function(result){
                   var title_html="";
                   for(var i=0;i<result.length;i++){
                       title_html+= "<ul><li>"+ result[i]['title']+"</li>"+//处理数据
                                    "<li>"+ result[i]['content']+"</li>"+
                                    "<li><img src='/"+result[i]['header_pic_path']+"'></li>"+
                                    "<li>"+ result[i]['source']+"</li>"+
                                    "<li>"+ result[i]['release_time']+"</li></ul>";
                   }
                   $("#title").html(title_html);//将数据增加到页面中
               }
            };
           page.init(data['newList'].length,1,options);
       }
    });

</script>
<body>
<div id="title">

</div>
<ul class="page" id="page"></ul>
</body>
</html>
