<%--
  Created by IntelliJ IDEA.
  User: LJH
  Date: 2017/11/23
  Time: 16:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" pageEncoding="UTF-8"%>
<%
    String path=request.getContextPath();
    session.setAttribute("path", request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path);
%>
<html lang="en">
<%@include file="../public_page/public_import.jsp"%>
<body class=" theme-blue">
<script>
    //query
    var instance_table;
    $(document).ready(function () {
        instance_table = $("#instance_table").DataTable({
            "serverSide": true,
            "retrieve": true,
            "processing": true,
            "ordering": false,
            "searching": false,
            "pagingType": "full_numbers",
            "lengthMenu": [5,10,15,20],
            language: instanceLanguage,
            "ajax":{
                url: "<c:url value="/instance/query_instance"/>",
                type:"get"
            },
            columnDefs:[
                {
                    "targets": [1],
                    data:"id",
                    "render": function (data, type, row) {
                        return '<a href="#" onclick="update_instance(' + data + ')" role="button" data-toggle="modal" data-target="#editInstanceModal"><i class="fa fa-external-link"></i></a>&nbsp;&nbsp;&nbsp;&nbsp;'+
                            '<a href="#" onclick="remove_instance(' + data + ')" role="button" data-toggle="modal"><i class="fa fa fa-trash-o"></i></a>';
                    }
                }
            ],
            columns:[
                {data:"name"}
            ]
        });
    });


    <%-- INSTANCE --%>

    //add
    $(document).on('click', '#instance_save', function () {
        var name = $("#instance_name_add").val().trim();
        if (name.length==0 || name == ""){
            layer.msg("名称还没填");
            return;
        }
        $.ajax({
            url: "<c:url value="/instance/add_instance"/>",
            data: $("#add_form_instance").serialize(),
            dataType: "json",
            type:"post",
            success:function (data) {
                if (data['success'] == "1"){
                    $("#addInstanceModal").modal("hide");
                    $("#instance_name_add").val("");
                    layer.msg("添加成功");
                    instance_table.ajax.reload();
                }else {
                    layer.alert("副本已经存在！");
                }
            },
            error:function () {
                layer.alert("添加失败");
            }
        });
    });
    //delete
    function remove_instance(id) {
        layer.confirm("确认删除？",{icon: 2},function () {
            $.ajax({
                url:"<c:url  value="/instance/delete_instance?id="/>" + id,
                dataType:"json",
                type:"post",
                success:function (data) {
                    if (data['success'] == "1"){
                        layer.msg("删除成功");
                        instance_table.draw(false);
                    }
                },
                error:function () {
                    layer.alert("删除失败");
                }
            });
        });
    }
    //get
    function update_instance(id) {
        $.ajax({
            url: "<c:url  value="/instance/get_instance?id="/>" + id,
            dataType:"json",
            type:"get",
            success:function (data) {
                if (data != null && data != ""){
                    $("#edit_instance_id").val(data['id']);
                    $("#instance_name_edit").val(data['name']);
                }
            }
        });
    }
    //update
    $(document).on('click', '#instance_edit', function () {
        var name = $("#instance_name_edit").val().trim();
        if (name.length==0 || name == ""){
            layer.msg("名称还没填");
            return;
        }
        $.ajax({
            url: "<c:url value="/instance/update_instance"/>",
            data: $("#edit_form_instance").serialize(),
            dataType: "json",
            type:"post",
            success:function (data) {
                if (data['success'] == "1"){
                    $("#editInstanceModal").modal("hide");
                    layer.msg("添加成功");
                    instance_table.draw(false);
                }else {
                    layer.alert("副本已经存在！");
                }
            },
            error:function () {
                layer.alert("添加失败");
            }
        });
    });

    function search_instance() {
        var instance = $("#instance_data").val().trim();
        if (instance.length === 0 || instance === ""){
            instance_table.ajax.reload();
        }
        $('#instance_table').DataTable().ajax.url("search_instance?instance_name="+instance).load();
    }
</script>
<!-- 修改 instance -->
<div class="modal fade" id="editInstanceModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span>
                </button>
                <h4 class="modal-title" >修改副本信息</h4>
            </div>
            <div class="modal-body">
                <div class="box-body">
                    <form id="edit_form_instance">
                        <div class="row">
                            <input type="hidden" id="edit_instance_id">
                            <label>名称</label>
                            <input type="text" id="instance_name_edit" name="name" class="form-control"/>
                        </div>
                    </form>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                <button type="button" class="btn btn-primary" id="instance_edit">修改</button>
            </div>
        </div>
    </div>
</div>

<!-- 增加 instance -->
<div class="modal fade" id="addInstanceModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span>
                </button>
                <h4 class="modal-title" >新增副本</h4>
            </div>
            <div class="modal-body">
                <div class="box-body">
                    <form id="add_form_instance">
                        <div class="row">
                            <label>名称</label>
                            <input type="text" id="instance_name_add" name="name" class="form-control"/>
                        </div>
                    </form>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                <button type="button" class="btn btn-primary" id="instance_save">保存</button>
            </div>
        </div>
    </div>
</div>
<%@include file="../public_page/public_header_navigation.jsp" %>
<div class="content">
    <div class="header">

        <h1 class="page-title">副 本 管 理</h1>
        <ul class="breadcrumb">
            <li>Home </li>
            <li class="active"> instances </li>
        </ul>

    </div>
    <div class="main-content">

        <div class="btn-toolbar list-toolbar">
            <button class="btn btn-primary" data-toggle="modal" data-target="#addInstanceModal"><i class="fa fa-plus"></i> 新的 副本</button>
            <div class="btn-group">
            </div>

            <div class="col-lg-6" style="float:right;width:280px;margin-right:50px">
                <div class="input-group">
                    <input type="text" class="form-control" placeholder="请输入副本名称..." id="instance_data" onkeyup="search_instance()">
                </div><!-- /input-group -->
            </div><!-- /.col-lg-6 -->
        </div>

        <table id="instance_table" class="table table-bordered table-hover" style="overflow: hidden;white-space: nowrap;text-overflow: ellipsis;">
            <thead>
            <tr>
                <th>名称</th>
                <th>操作</th>
            </tr>
            </thead>
            <tbody>

            </tbody>

        </table>

    </div>
</div>
<%@include file="../public_page/public_footer.jsp" %>
</body>
</html>
