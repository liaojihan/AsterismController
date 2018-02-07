<%--
  Created by IntelliJ IDEA.
  User: LJH
  Date: 2017/11/23
  Time: 11:08
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
    $(function () {
        query_instance_list();
    });

    function query_instance_list() {
        $.ajax({
            url: "/instance/query_instance_option",
            dataType: "json",
            type: "get",
            success:function (data) {
                $("#boss_select_add").append(data['instance_option']);
                $("#boss_select_edit").append(data['instance_option']);
            }
        });
    }

    var boss_table;

    $(document).ready(function () {
            boss_table = $("#boss_table").DataTable({
            "serverSide": true,
            "retrieve": true,
            "processing": true,
            "ordering": true,
            "order":[],
            "searching": false,
            "pagingType": "full_numbers",
            "lengthMenu": [10,15,20,40],
            language: bossLanguage,
            "ajax":{
                url: "query_boss",
                type:"get"
            },
            columnDefs:[
                {
                    "targets": [4],
                    data:"id",
                    "render": function (data, type, row) {
                        if (row['is_pass']){
                            return '<a href="#" onclick="edit_boss(' + row['id'] + ')" data-toggle="modal" data-target="#editBossModal"><i class="fa fa-wrench"></i></a>&nbsp;&nbsp;&nbsp;&nbsp;' +
                                '<a href="#" onclick="delete_boss(' + row['id'] + ')" role="button" data-toggle="modal"><i class="fa fa-trash-o"></i></a>&nbsp;&nbsp;&nbsp;&nbsp;' +
                                '<a href="#" onclick="update_status(' + row['id'] + ')" role="button" data-toggle="modal"><i class="fa fa-ban"></i></a>'
                        }else {
                            return '<a href="#" onclick="edit_boss(' + row['id'] + ')" data-toggle="modal" data-target="#editBossModal"><i class="fa fa-wrench"></i></a>&nbsp;&nbsp;&nbsp;&nbsp;' +
                                '<a href="#" onclick="delete_boss(' + row['id'] + ')" role="button" data-toggle="modal"><i class="fa fa-trash-o"></i></a>&nbsp;&nbsp;&nbsp;&nbsp;' +
                                '<a href="#" onclick="update_status(' + row['id'] + ')" role="button" data-toggle="modal"><i class="fa fa-gavel"></i></a>'
                        }
                    }
                },{
                    "targets": [3],
                    data:"is_pass",
                    "render": function (data,type,row) {
                        if (data){
                            return "已通过"
                        }else {
                            return "未通过"
                        }
                    }
                },{
                    "targets":[0],
                    data:"boss_pic_pic",
                    "render":function (data,type,row) {
                        return '<img src="${path}/'+data+'" style="width:40px;height:auto">'
                    }
                }
            ],
            columns:[
                {data:"boss_pic_pic"},
                {data:"name"},
                {data:"belong_to"},
                {data:"is_pass"}
            ]
        });
    });



    <%-- BOSS --%>
    //add
    $(document).on('click', '#boss_save',function () {
        var name = $("#boss_name_add").val().trim();
        if (name.length == 0 || name == ""){
            layer.msg("boss名称为空");
            $("#boss_name_add").focus();
            return;
        }
        var dataForm = new FormData($("#add_form_boss")[0]);
        $.ajax({
            url:"add_boss",
            data: dataForm,
            cache: false,
            processData: false,
            contentType: false,
            dataType: "json",
            type: "post",
            success:function (data) {
                if (data['success'] == "1"){
                    $("#addBossModal").modal("hide");
                    $("#boss_name_add").val("");
                    $("#add_pic").val("");
                    layer.msg("添加成功");
                    boss_table.ajax.reload();
                }
            },
            error:function () {
                layer.alert("添加失败");
            }
        });
    });
    //delete
    function delete_boss(id) {
        layer.confirm("确认删除？",{icon: 2},function () {
            $.ajax({
                url:"delete_boss?id="+id,
                dataType: "json",
                type:"post",
                success:function (data) {
                    if (data['success'] == "1"){
                        layer.msg("已经移除");
                        boss_table.draw(false);
                    }
                },
                error:function () {
                    layer.alert("删除失败");
                }
            });
        });
    }
    //get
    function edit_boss(id) {
        $.ajax({
            url:"get_boss?id="+id,
            dataType:"json",
            type:"get",
            success:function (data) {
                $("#edit_boss_id").val(data['id']);
                $("#edit_boss_name").val(data['name']);
            }
        });
    }
    //update
    $(document).on('click', '#boss_edit', function () {
        var name = $("#boss_name_edit").val().trim();
        if (name.length == 0 || name == ""){
            layer.msg("boss名称为空");
            $("#boss_name_edit").focus();
            return;
        }
        var dataForm = new FormData($("#edit_form_boss")[0]);
        $.ajax({
            url: "update_boss",
            data: dataForm,
            cache: false,
            processData: false,
            contentType: false,
            dataType: "json",
            type: "post",
            success:function (data) {
                if (data['success'] == "1"){
                    $("#editBossModal").modal("hide");
                    $("#edit_pic").val("");
                    layer.msg("修改成功");
                    boss_table.draw(false);
                }
            },
            error:function () {
                layer.alert("修改失败");
            }
        });
    });

    //更改状态

    function update_status(id) {
        $.ajax({
            url: "update_status?id="+id,
            dataType:"json",
            type:"post",
            success:function (data) {
                if (data['success'] == "1"){
                    boss_table.draw(false);
                    layer.msg("状态更改成功");
                }
            },
            error:function () {
                layer.msg("状态更改失败");
            }
        });
    }

    function search_boss() {
        var boss = $("#boss_data").val().trim();
        if (boss === "" || boss.length === 0){
            boss_table.ajax.reload();
        }
        $('#boss_table').DataTable().ajax.url("search_boss?boss_name="+boss).load();
    }

</script>



<!-- 修改 Boss -->
<div class="modal fade" id="editBossModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span>
                </button>
                <h4 class="modal-title" >修改BOSS信息</h4>
            </div>
            <div class="modal-body">
                <div class="box-body">
                    <form id="edit_form_boss">
                        <div class="row">
                            <div class="col-md-6">
                                <input type="hidden" id="edit_boss_id">
                                <label>名称</label>
                                <input class="form-control" id="edit_boss_name" name="name">
                                <label>BOSS头像</label>
                                <input type="file" id="edit_pic" name="boss_pic" class="file" accept="image/*"/>
                            </div>
                            <div class="col-md-6">
                                <label>副本</label>
                                <select class="form-control" id="boss_select_edit" name="belong_to"></select>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                <button type="button" class="btn btn-primary" id="boss_edit">修改</button>
            </div>
        </div>
    </div>
</div>

<!-- 增加 Boss -->
<div class="modal fade" id="addBossModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span>
                </button>
                <h4 class="modal-title" >新增 BOSS</h4>
            </div>
            <div class="modal-body">
                <div class="box-body">
                    <form id="add_form_boss">
                        <div class="row">
                            <div class="col-md-6">
                                <label>名称</label>
                                <input class="form-control" id="boss_name_add" name="name">
                                <label>BOSS头像</label>
                                <input type="file" id="add_pic" name="boss_pic" class="file" accept="image/*"/>
                            </div>
                            <div class="col-md-6">
                                <label>副本</label>
                                <select class="form-control" id="boss_select_add" name="belong_to"></select>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                <button type="button" class="btn btn-primary" id="boss_save">保存</button>
            </div>
        </div>
    </div>
</div>
<%@include file="../public_page/public_header_navigation.jsp" %>
<div class="content">
    <div class="header">

        <h1 class="page-title">进 度 管 理</h1>
        <ul class="breadcrumb">
            <li>Home </li>
            <li class="active"> Bosses </li>
        </ul>

    </div>
    <div class="main-content">

        <div class="btn-toolbar list-toolbar">
            <button class="btn btn-primary" data-toggle="modal" data-target="#addBossModal"><i class="fa fa-plus"></i> 新的 BOSS</button>
            <div class="btn-group">
            </div>

            <div class="col-lg-6" style="float:right;width:280px;margin-right:80px">
                <div class="input-group">
                    <input type="text" class="form-control" placeholder="请输入BOSS名称或副本名称..." id="boss_data" onkeyup="search_boss()" style="width: 240px">
                </div><!-- /input-group -->
            </div><!-- /.col-lg-6 -->
        </div>

        <table id="boss_table" class="table table-bordered table-hover" style="overflow: hidden;white-space: nowrap;text-overflow: ellipsis;">
            <thead>
            <tr>
                <th>图片</th>
                <th>名称</th>
                <th>副本</th>
                <th>状态</th>
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


    </div>
</div>
<%@include file="../public_page/public_footer.jsp" %>
</body>
</html>
