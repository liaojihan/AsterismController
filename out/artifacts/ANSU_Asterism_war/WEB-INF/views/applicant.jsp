<%--
  Created by IntelliJ IDEA.
  User: knife
  Date: 2017/10/27
  Time: 23:57
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
    $(document).ready(function () {
        applicant_table = $("#applicant_table").DataTable({
            "serverSide": true,
            "retrieve": true,
            "processing": true,
            "ordering": false,
            "searching": false,
            "pagingType": "full_numbers",
            "lengthMenu": [10, 20, 30, 40],
            language: dtLanguage,
            "ajax":{
                url: "query_applicanter",
                type:"get"
            },
            columnDefs:[
                {
                    "targets": [5],
                    data:"id",
                    "render": function (data, type, row) {
                        return '<a href="#" onclick="import_guild(' + data + ')" role="button" data-toggle="modal"><i class="fa fa-external-link"></i></a>&nbsp;&nbsp;&nbsp;&nbsp;'+
                            '<a href="#" onclick="remove_guild(' + data + ')" role="button" data-toggle="modal"><i class="fa fa fa-trash-o"></i></a>';
                    }
                }
            ],
            columns:[
                {data:"name"},
                {data:"wechat"},
                {data:"equip_level"},
                {data:"experience"},
                {data:"assart_time"}
            ]
        });
    });

    function import_guild(id) {
        layer.confirm("确认加入?",{icon: 1},function () {
            $.ajax({
                url: "import_guild",
                data:{"id":id},
                dataType:"json",
                type:"post",
                success:function (data) {
                    if (data.success == "1"){
                        layer.msg("成功加入公会，请移至人员管理配置基础信息");
                        applicant_table.ajax.reload();
                    }else {
                        layer.alert("出错啦");
                    }
                },
                error:function () {
                    layer.alert("服务响应超时");
                }
            });
        });
    }

    function remove_guild(id) {
        layer.confirm("确认移除?",{icon:2},function () {
            $.ajax({
                url:"delete_applicanter",
                data:{"id":id},
                dataType:"json",
                type:"post",
                success:function (data) {
                    if (data.success == "1"){
                        layer.msg("已经移除");
                        applicant_table.ajax.reload();
                    }else {
                        layer.alert("出错啦");
                    }
                },
                error:function () {
                    layer.alert("服务响应超时");
                }
            });
        });
    }

    function search_query() {
        var search_query_value =  $("#search_input").val();
        if (search_query_value.length == 0 || search_query_value == ""){
            applicant_table.ajax.reload();
        }
        $('#applicant_table').DataTable().ajax.url("fast_query_applicant?applicant_name="+search_query_value).load();
    }
</script>

<%@include file="../public_page/public_header_navigation.jsp"%>

<div class="content">
    <div class="header">

        <h1 class="page-title">申 请 管 理</h1>
        <ul class="breadcrumb">
            <li>Home </li>
            <li class="active"> Applicants </li>
        </ul>

    </div>
    <div class="main-content">

        <div class="btn-toolbar list-toolbar">
            <div class="btn-group">
            </div>

            <div class="col-lg-6" style="float:right;width:280px;margin-right:50px">
                <div class="input-group">
                    <input type="text" class="form-control" placeholder="请输入申请人员名字..." onkeyup="search_query()" id="search_input">
                </div><!-- /input-group -->
            </div><!-- /.col-lg-6 -->
        </div>

        <table id="applicant_table" class="table table-bordered table-hover" >
            <thead>
            <tr>
                <th>名称</th>
                <th>微信</th>
                <th>装等</th>
                <th>副本经验</th>
                <th>能适应的开荒时间</th>
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


       <%@include file="../public_page/public_footer.jsp"%>
    </div>
</div>
</body></html>
