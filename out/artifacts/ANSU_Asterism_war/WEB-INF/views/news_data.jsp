<%--
  Created by IntelliJ IDEA.
  User: LJH
  Date: 2017/11/13
  Time: 14:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path=request.getContextPath();
    session.setAttribute("path", request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path);
%>
<!DOCTYPE HTML>
<html lang="en">
<%@include file="../public_page/public_import.jsp" %>
<body class=" theme-blue">


<script>
    //初始化dataTable
    $(document).ready(function () {
        news_table = $("#news_table").DataTable({
            "serverSide": true,
            "retrieve": true,
            "processing": true,
            "ordering": false,
            "searching": false,
            "pagingType": "full_numbers",
            "lengthMenu": [5, 10 ,20 ,30],
            language: newsLanguage,
            "ajax":{
                url:"query_news",
                type: "get"
            },
            columnDefs:[
                {
                    "targets":[3],
                    data: "id",
                    "render":function (data,type,row) {
                        return '<a href="#" onclick="edit_news(' + data + ')" role="button" data-toggle="modal" data-target="#editModal"><i class="fa fa-wrench"></i></a>&nbsp;&nbsp;&nbsp;&nbsp;'+
                        '<a href="#" onclick="delete_news(' + data + ')" role="button" data-toggle="modal"><i class="fa fa-trash-o"></i></a>'
                    }
                }
            ],
            columns:[
                {data:"title"},
                {data:"release_time"},
                {data:"source"}
            ]
        });
    });

    function delete_news(id) {
        $.ajax({
            url:"delete_news?news_id=" + id,
            dataType:"json",
            type:"post",
            success:function (data) {
                layer.msg(data['success']);
                news_table.ajax.reload();
            },
            error:function () {
                layer.alert("删除失败");
            }
        });
    }

    function edit_news(id) {
        $.ajax({
            url: "get_news?news_id="+ id,
            dataType:"json",
            type: "get",
            success:function (data) {
                $("#edit_id").val(data['news_id']);
                $("#edit_title").val(data['title']);
                $("#edit_source").val(data['source']);
                editor_edit.txt.html(data['content']);
            }
        });
    }
</script>
<!-- 增加 -->
<div class="modal fade" id="addModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document" style="width: 800px">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span>
                </button>
                <h4 class="modal-title">新的 新闻</h4>
                <div class="modal-body">
                    <div class="box-body">
                        <form id="add_form" enctype="multipart/form-data">
                            <div style="width:680px; margin:0 auto;">

                                标题：<input style="width:400px;height:30px;line-height:30px;font-size:18px;" name="title" id="add_title"><br><br>
                                来源：<input style="width:400px;height:30px;line-height:30px;font-size:18px;" name="source" id="add_source"><br>
                                <br>
                                <input id="add_content_data" name="content" type="hidden">
                                图片：<input type="file" name="header_pic" id="add_pic" accept="image/*" /><br><br>

                            </div>
                        </form>
                        内容：<br>
                        <div id="div_add">
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                <button type="button" class="btn btn-primary" id="save">保存</button>
            </div>
        </div>
    </div>
</div>
<!-- 编辑 -->
<div class="modal fade" id="editModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document" style="width: 800px">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span>
                </button>
                <h4 class="modal-title">编辑 新闻</h4>
                <div class="modal-body">
                    <div class="box-body">
                        <form id="edit_form" enctype="multipart/form-data">
                            <div style="width:680px; margin:0 auto;">
                                <input type="hidden" name="id" id="edit_id">
                                标题：<input style="width:400px; height:30px; line-height:30px; font-size:18px; " name="title" id="edit_title"><br><br>
                                来源：<input style="width:400px; height:30px; line-height:30px; font-size:18px; " name="source" id="edit_source"><br>
                                <br>
                                图片：<input type="file" name="pic" id="pic1" accept="image/*" /> <br><br>

                            </div>

                        </form>
                        内容：<br>
                        <div id="div_edit">
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                <button type="button" class="btn btn-primary" id="edit">修改</button>
            </div>
        </div>
    </div>
</div>
<%@include file="../public_page/public_header_navigation.jsp" %>
<div class="content">
    <div class="header">

        <h1 class="page-title">新 闻 管 理</h1>
        <ul class="breadcrumb">
            <li>Home </li>
            <li class="active"> News </li>
        </ul>

    </div>
    <div class="main-content">

        <div class="btn-toolbar list-toolbar">
            <button class="btn btn-primary" data-toggle="modal" data-target="#addModal"><i class="fa fa-plus" id="add_person"></i> 新的 新闻</button>
            <div class="btn-group">
            </div>

            <div class="col-lg-6" style="float:right;width:280px;margin-right:50px">
                <div class="input-group">
                    <input type="text" class="form-control" placeholder="快速搜索新闻..." id="search_news">
                </div><!-- /input-group -->
            </div><!-- /.col-lg-6 -->
        </div>

        <table id="news_table" class="table table-bordered table-hover" style="overflow: hidden;white-space: nowrap;text-overflow: ellipsis;">
            <thead>
            <tr>
                <th>标题</th>
                <th>发布时间</th>
                <th>来源</th>
                <th>操作</th>
            </tr>
            </thead>
            <tbody>

            </tbody>

        </table>


        <div class="modal small fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                        <h3 id="myModalLabel">Delete Confirmation</h3>
                    </div>
                    <div class="modal-body">
                        <p class="error-text"><i class="fa fa-warning modal-icon"></i>Are you sure you want to delete the user?<br>This cannot be undone.</p>
                    </div>
                    <div class="modal-footer">
                        <button class="btn btn-default" data-dismiss="modal" aria-hidden="true">Cancel</button>
                        <button class="btn btn-danger" data-dismiss="modal">Delete</button>
                    </div>
                </div>
            </div>
        </div>


        <%@include file="../public_page/public_footer.jsp" %>
    </div>
</div>
<!--引入jquery和wangEditor.js-->   <!--注意：javascript必须放在body最后，否则可能会出现问题-->
<script type="text/javascript" src="${path}/static/wangEditor-3.0.13/release/wangEditor.js"></script>
<!--这里引用jquery和wangEditor.js-->
<script type="text/javascript">
    var E = window.wangEditor;
    <!--   添加   -->
    var editor_add = new E('#div_add');
    //上传图片“tab”
    editor_add.customConfig.uploadImgServer = 'upload_news_pic';
    //自定义上传name
    editor_add.customConfig.uploadFileName = 'news_pic';
    // 将图片大小限制为 30M
    editor_add.customConfig.uploadImgMaxSize = 30 * 1024 * 1024;
    // 限制一次最多上传 5 张图片
    editor_add.customConfig.uploadImgMaxLength = 5;
    //允许拼接URL
    editor_add.customConfig.uploadImgParamsWithUrl = true;
    //查看debug日志
    editor_add.customConfig.debug = true;
    //监听函数
    editor_add.customConfig.uploadImgHooks = {
        // 如果服务器端返回的不是 {errno:0, data: [...]} 这种格式，可使用该配置
        // （但是，服务器端返回的必须是一个 JSON 格式字符串！！！否则会报错）
        customInsert: function (insertImg, result, editor) {
            // 图片上传并返回结果，自定义插入图片的事件（而不是编辑器自动插入图片！！！）
            // insertImg 是插入图片的函数，editor 是编辑器对象，result 是服务器端返回的结果
            // 举例：假如上传图片成功后，服务器端返回的是 {url:'....'} 这种格式，即可这样插入图片：
            var url = result.url;
            insertImg(url)
            // result 必须是一个 JSON 格式字符串！！！否则报错
        }
    };
    // 或者 var editor = new E( document.getElementById('#editor') )
    document.getElementById('save').addEventListener('click', function () {
        // 读取 html
        var title = $("#add_title").val().trim();
        console.log(title);
        var source = $("#add_source").val().trim();
        console.log(source);
        var pic = $("#add_pic").val().trim();
        console.log(pic);
        var news_data = editor_add.txt.html();
        if (title.length == 0 || title == ""){
            layer.msg("请填写标题");
            $("#add_title").focus();
            return;
        }
        if (source.length == 0 || source == ""){
            layer.msg("请填写来源");
            $("#add_source").focus();
            return;
        }
        if (pic.length == 0 || pic == undefined){
            layer.msg("请上传标题图片");
            $("#add_pic").focus();
            return;
        }
        if (news_data.length==0 || news_data == undefined){
            layer.msg("请填写新闻内容");
            return;
        }
        $("#add_content_data").val(news_data);
        var dataForm = new FormData($("#add_form")[0]);
        $.ajax({
            url:"add_news",
            data:dataForm,
            cache: false,
            processData: false,
            contentType: false,
            dataType: "json",
            type: "post",
            success:function (data) {
                if (data['success'] == "1"){
                    layer.msg("成功添加一条新闻！");
                    news_table.ajax.reload();
                }else {
                    layer.alert("这条新闻已经存在啦！");
                }
            }
        });
    }, false);

    editor_add.create();
    <!--   编辑   -->

    var editor_edit = new E('#div_edit');
    //上传图片“tab”
    editor_edit.customConfig.uploadImgServer = 'upload_news_pic';
    //自定义上传name
    editor_edit.customConfig.uploadFileName = 'news_pic';
    // 将图片大小限制为 30M
    editor_edit.customConfig.uploadImgMaxSize = 30 * 1024 * 1024;
    // 限制一次最多上传 5 张图片
    editor_edit.customConfig.uploadImgMaxLength = 5;
    //允许拼接URL
    editor_edit.customConfig.uploadImgParamsWithUrl = true;
    //查看debug日志
    editor_edit.customConfig.debug = true;
    //监听函数
    editor_edit.customConfig.uploadImgHooks = {
        // 如果服务器端返回的不是 {errno:0, data: [...]} 这种格式，可使用该配置
        // （但是，服务器端返回的必须是一个 JSON 格式字符串！！！否则会报错）
        customInsert: function (insertImg, result, editor) {
            // 图片上传并返回结果，自定义插入图片的事件（而不是编辑器自动插入图片！！！）
            // insertImg 是插入图片的函数，editor 是编辑器对象，result 是服务器端返回的结果
            // 举例：假如上传图片成功后，服务器端返回的是 {url:'....'} 这种格式，即可这样插入图片：
            var url = result.url;
            insertImg(url)
            // result 必须是一个 JSON 格式字符串！！！否则报错
        }
    };
    editor_edit.create();
</script>

</body>
</html>