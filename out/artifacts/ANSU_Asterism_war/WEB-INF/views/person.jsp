<%--
  Created by IntelliJ IDEA.
  User: knife
  Date: 2017/10/17
  Time: 20:01
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
    //初始化表格
    $(document).ready(function () {
        person_table = $('#person_table').DataTable({
            "serverSide": true,
            "retrieve": true,
            "processing": true,
            "ordering": false,
            "searching": false,
            "pagingType": "full_numbers",
            "lengthMenu": [5, 10 ,20 ,30],
            language: dtLanguage,
            "ajax": {
                url: "query_person",
                type: 'POST'
            },
            columnDefs: [
                {
                    "targets":[11],
                    data:"id",
                    "render": function (data, type, row) {
                        if (row['is_display']) {
                            return '<a href="#" onclick="edit_person(' + row['id'] + ')" data-toggle="modal" data-target="#editModal"><i class="fa fa-wrench"></i></a>&nbsp;&nbsp;&nbsp;&nbsp;' +
                                '<a href="#" onclick="delete_person(' + row['id'] + ')" role="button" data-toggle="modal"><i class="fa fa-trash-o"></i></a>&nbsp;&nbsp;&nbsp;&nbsp;' +
                                '<a href="#" onclick="update_status(' + row['id'] + ')" role="button" data-toggle="modal"><i class="fa fa-long-arrow-down"></i></a>'
                        }else {
                            return '<a href="#" onclick="edit_person(' + row['id'] + ')" data-toggle="modal" data-target="#editModal"><i class="fa fa-wrench"></i></a>&nbsp;&nbsp;&nbsp;&nbsp;' +
                                '<a href="#" onclick="delete_person(' + row['id'] + ')" role="button" data-toggle="modal"><i class="fa fa-trash-o"></i></a>&nbsp;&nbsp;&nbsp;&nbsp;' +
                                '<a href="#" onclick="update_status(' + row['id'] + ')" role="button" data-toggle="modal"><i class="fa fa-long-arrow-up"></i></a>'
                        }
                    }
                },{
                    "targets": [9],
                    data:"is_display",
                    "render":function (data,type,row) {
                        if (data){
                            return "上榜"
                        }else {
                            return "未上榜"
                        }
                    }
                },{
                    "targets": [10],
                    data:"pic_path",
                    "render":function (data,type,row) {
                        return '<img src="${path}/'+data+'" style="width:40px;height:auto">'
                    }
                }
            ],
            columns: [
                {data: "name"},
                {data: "pro_name"},
                {data: "equip_level"},
                {data: "remark"},
                {data: "feel"},
                {data: "nick_name"},
                {data: "join_time"},
                {data: "will_order"},
                {data: "location"},
                {data: "is_display"},
                {data: "pic_path"}
            ]
        });
    });

    $(function () {
        profession_query();
    });
    
    function profession_query() {
        $.ajax({
            url: "../profession/query_profession",
            type: "post",
            success:function (data) {
                $("#profession_all_id").append(data);
                $("#edit_profession_all_id").append(data);
            }
        });
    }
    
    $(document).on('click', '#save', function () {
        var name = $("#add_name").val().trim();
        var equip_level = $("#add_equip_level").val().trim();
        var remark = $("#add_remark").val().trim();
        var feel = $("#add_feel").val().trim();
        var nick_name = $("#add_nick_name").val().trim();
        var join_time = $("#add_join_time").val().trim();
        var pic = $("#add_pic").val();
        if (name.length == 0 || name == ""){
            layer.msg("请填写名称");
            $("#add_name").focus();
            return;
        }
        if (equip_level.length == 0 || equip_level == ""){
            layer.msg("请填写装等");
            $("#add_equip_level").focus();
            return;
        }
        if (remark.length == 0 || remark == ""){
            layer.msg("请填写简介");
            $("#add_remark").focus();
            return;
        }
        if (feel.length == 0 || feel == ""){
            layer.msg("请填写感受");
            $("#add_feel").focus();
            return;
        }
        if (nick_name.length == 0 || nick_name == ""){
            layer.msg("请填写昵称/外号");
            $("#add_equip_level").focus();
            return;
        }
        if (join_time.length == 0 || join_time == ""){
            layer.msg("请填写时间");
            $("#add_join_time").focus();
            return;
        }
        if (pic.length == 0 || pic == undefined){
            layer.msg("请上传团员头像");
            $("#add_pic").focus();
            return;
        }
        var dataForm = new FormData($("#add_form")[0]);
        $.ajax({
            url: "add_person",
            data: dataForm,
            cache: false,
            processData: false,
            contentType: false,
            dataType: "json",
            type: "post",
            success:function (result) {
                if (result == "1"){
                    layer.msg("成功加入公会");
                    $("#add_name").val("");
                    $("#add_equip_level").val("");
                    $("#add_remark").val("");
                    $("#add_feel").val("");
                    $("#add_join_time").val("");
                    $("#add_nick_name").val("");
                    $("#add_pic").val("");
                    $("#addModal").modal("hide");
                    person_table.ajax.reload();
                }else {
                    layer.msg("公会有这个人啦");
                }
            },
            error:function () {
                layer.alert("服务响应超时");
            }
        });
    });
    
    function delete_person(id) {
        var person_id = id;
        layer.confirm("确认删除？",{icon: 2},function () {
            $.ajax({
                url: "delete_person?person_id="+person_id,
                dataType: "json",
                Type: "get",
                success:function (data) {
                    layer.msg(data.delete);
                    person_table.ajax.reload();
                },
                error:function () {
                    layer.alert("服务响应超时");
                }
            });
        })
    }

    function edit_person(id) {
        $('#editModal').modal({backdrop: 'static', keyboard: true});
        $.ajax({
            url: "get_person?person_id="+id,
            dataType: "json",
            type: "post",
            success:function (data) {
                $("#edit_id").val(data.id);
                $("#edit_name").val(data.name);
                $("#edit_equip_level").val(data.equip_level);
                $("#edit_remark").val(data.remark);
                $("#edit_feel").val(data.feel);
                $("#edit_nick_name").val(data.nick_name);
                $("#edit_pic").val("");
                $("#edit_join_time").val(data.join_time);
            }
        });
    }

    $(document).on('click', '#edit', function () {
        var name = $("#edit_name").val();
        var equip_level = $("#edit_equip_level").val();
        var remark = $("#edit_remark").val();
        var feel = $("#edit_feel").val();
        var nick_name = $("#edit_nick_name").val();
        var join_time =  $("#edit_join_time").val();
        var pic = $("#edit_pic").val();
        if (name.length == 0 || name == ""){
            layer.msg("请填写名称");
            $("#edit_name").focus();
            return;
        }
        if (equip_level.length == 0 || equip_level == ""){
            layer.msg("请填写装等");
            $("#edit_equip_level").focus();
            return;
        }
        if (remark.length == 0 || remark == ""){
            layer.msg("请填写简介");
            $("#edit_remark").focus();
            return;
        }
        if (feel.length == 0 || feel == ""){
            layer.msg("请填写感受");
            $("#edit_feel").focus();
            return;
        }
        if (nick_name.length == 0 || nick_name == ""){
            layer.msg("请填写昵称/外号");
            $("#edit_nick_name").focus();
            return;
        }
        if (join_time.length == 0 || join_time == ""){
            layer.msg("请填写时间");
            $("#edit_join_time").focus();
            return;
        }
        if (pic.length == 0 || pic == undefined){
            layer.msg("请上传团员头像");
            $("#edit_pic").focus();
            return;
        }
        var dataForm = new FormData($("#edit_form")[0]);
        $.ajax({
            url: "update_person",
            data: dataForm,
            cache: false,
            processData: false,
            contentType: false,
            dataType: "json",
            type: "post",
            success:function (result) {
                if (result == "1"){
                    layer.msg("修改成功");
                    $("#editModal").modal("hide");
                    person_table.ajax.reload();
                }else {
                    layer.msg("公会有这个人啦");
                }
            },
            error:function () {
                layer.alert("服务响应超时");
            }
        });
    });
    
    $(document).on('keyup', "#search_input", function () {
        var search_input = $("#search_input").val();
        if (search_input.length === 0 || search_input === ""){
            person_table.ajax.reload();
        }
        $('#person_table').DataTable().ajax.url("fast_query?person_name="+search_input).load();
    });

    //更改是否上榜
    function update_status(id) {
        $.ajax({
            url: "update_status?person_id="+id,
            dataType: "json",
            type: "get",
            success:function (data) {
                if (data.success == "OK"){
                    layer.msg("状态更新成功");
                    person_table.ajax.reload();
                }else {
                    layer.msg("状态更新失败");
                }
            },
            error:function () {
                layer.alert("服务响应超时");
            }
        });
    }
</script>

<!-- 修改 -->
<div class="modal fade" id="editModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span>
                </button>
                <h4 class="modal-title" >修改人员信息</h4>
            </div>
            <div class="modal-body">
                <div class="box-body">
                    <form id="edit_form">
                        <div class="row">
                            <div class="col-md-6">
                                <input type="hidden" name="id" id="edit_id">
                                <label>人员名称</label>
                                <input type="text" id="edit_name" name="name" class="form-control"/>
                                <label>装备等级</label>
                                <input type="text" id="edit_equip_level" name="equip_level" class="form-control"/>
                                <label>人员简介</label>
                                <input type="text" id="edit_remark" name="remark" class="form-control"/>
                                <label>职业</label>
                                <select class="form-control" name="pro_id" id="edit_profession_all_id">

                                </select>
                                <label>头像</label>
                                <input type="file" id="edit_pic" name="file" class="file" accept="image/*"/>
                            </div>
                            <div class="col-md-6">
                                <label>人员感受</label>
                                <input type="text" id="edit_feel" name="feel" class="form-control"/>
                                <label>外号/昵称</label>
                                <input type="text" id="edit_nick_name" name="nick_name" class="form-control"/>
                                <label>团队定位</label>
                                <select class="form-control" name="location">
                                    <option value="坦克">坦克</option>
                                    <option value="坦克/DPS">坦克/DPS</option>
                                    <option value="坦克/DPS/治疗">坦克/DPS/治疗</option>
                                    <option value="DPS">DPS</option>
                                    <option value="DPS/治疗">DPS/治疗</option>
                                    <option value="治疗">治疗</option>
                                </select>
                                <label>会阶</label>
                                <select class="form-control" name="will_order">
                                    <option value="会长">会长</option>
                                    <option value="副会长">副会长</option>
                                    <option value="公会一团">公会一团</option>
                                    <option value="杜蕾斯">杜蕾斯</option>
                                    <option value="小黑屋">小黑屋</option>
                                    <option value="1cm">1cm</option>
                                    <option value="休闲">休闲</option>
                                </select>
                                <label>入会时间</label>
                                <input type="text" id="edit_join_time" name="join_time" class="form-control" data-beatpicker="true"/>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                <button type="button" class="btn btn-primary" id="edit">修改</button>
            </div>
        </div>
    </div>
</div>

<!-- 增加 -->
<div class="modal fade" id="addModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span>
                </button>
                <h4 class="modal-title" id="add_id">新的 成员</h4>
            </div>
            <div class="modal-body">
                <div class="box-body">
                    <form id="add_form" enctype="multipart/form-data">
                        <div class="row">
                            <div class="col-md-6">
                                <label>人员名称</label>
                                <input type="text" id="add_name" name="name" class="form-control"/>
                                <label>装备等级</label>
                                <input type="text" id="add_equip_level" name="equip_level" class="form-control"/>
                                <label>人员简介</label>
                                <input type="text" id="add_remark" name="remark" class="form-control"/>
                                <label>职业</label>
                                <select class="form-control" name="pro_id" id="profession_all_id">
                                </select>
                                <label>头像</label>
                                <input type="file" id="add_pic" name="pic" class="file" accept="image/*"/>

                            </div>
                            <div class="col-md-6">
                                <label>人员感受</label>
                                <input type="text"  id="add_feel" name="feel" class="form-control"/>
                                <label>外号/昵称</label>
                                <input type="text"  id="add_nick_name" name="nick_name" class="form-control"/>
                                <label>团队定位</label>
                                <select class="form-control" name="location">
                                    <option value="坦克">坦克</option>
                                    <option value="坦克/DPS">坦克/DPS</option>
                                    <option value="坦克/DPS/治疗">坦克/DPS/治疗</option>
                                    <option value="DPS">DPS</option>
                                    <option value="DPS/治疗">DPS/治疗</option>
                                    <option value="治疗">治疗</option>
                                </select>
                                <label>会阶</label>
                                <select class="form-control" name="will_order">
                                    <option value="会长">会长</option>
                                    <option value="副会长">副会长</option>
                                    <option value="公会一团">公会一团</option>
                                    <option value="杜蕾斯">杜蕾斯</option>
                                    <option value="小黑屋">小黑屋</option>
                                    <option value="1cm">1cm</option>
                                    <option value="休闲">休闲</option>
                                </select>
                                <label>入会时间</label>
                                <input type="text" id="add_join_time" name="join_time" class="form-control" data-beatpicker="true"/>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                <button type="button" class="btn btn-primary" id="save">保存</button>
            </div>
        </div>
    </div>
</div>

<%@include file="../public_page/public_header_navigation.jsp" %>
<div class="content">
    <div class="header">

        <h1 class="page-title">人 员 管 理</h1>
        <ul class="breadcrumb">
            <li>Home </li>
            <li class="active"> Persons </li>
        </ul>

    </div>
    <div class="main-content">

        <div class="btn-toolbar list-toolbar">
            <button class="btn btn-primary" data-toggle="modal" data-target="#addModal"><i class="fa fa-plus" id="add_person"></i> 新的 成员</button>
            <div class="btn-group">
            </div>

            <div class="col-lg-6" style="float:right;width:280px;margin-right:50px">
                <div class="input-group">
                    <input type="text" class="form-control" placeholder="请输入公会成员名字..." id="search_input">
                </div><!-- /input-group -->
            </div><!-- /.col-lg-6 -->
        </div>

        <table id="person_table" class="table table-bordered table-hover" style="overflow: hidden;white-space: nowrap;text-overflow: ellipsis;">
            <thead>
            <tr>
                <th>人员名字</th>
                <th>职业</th>
                <th>装备等级</th>
                <th>人员简介</th>
                <th>人员感受</th>
                <th>外号/昵称</th>
                <th>入会时间</th>
                <th>会阶</th>
                <th>团队定位</th>
                <th>状态</th>
                <th>头像</th>
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





</body></html>

