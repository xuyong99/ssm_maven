<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort() +request.getContextPath()+"/";
%>
<!DOCTYPE html>
<html>
<head>
	<base href="<%=basePath %>">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>添加系统用户</title>
    <style type="text/css">
        tr{
            margin-bottom: 5px;
        }
    </style>
</head>
<body>
<center>
    <form action="javascript:void(0)" id="fmSystemUser">
        <table width="500px" border="1px">
            <tr>
                <td>管理员头像</td>
                <td>bigHeadImg.jpg</td>
            </tr>
            <tr>
                <td>管理员姓名</td>
                <td><input name="uName1" class="easyui-validatebox" data-options="required:true" />  </td>
            </tr>
            <tr>
                <td>管理员邮箱</td>
                <td><input name="email1" class="easyui-validatebox" data-options="required:true,validType:'email'" />  </td>
            </tr>
            <tr>
                <td>管理员手机</td>
                <td><input name="phone1" class="easyui-validatebox" data-options="required:true" />  </td>
            </tr>
            <tr>
                <td>管理员账号</td>
                <td><input name="account1" class="easyui-validatebox" data-options="required:true" />  </td>
            </tr>
            <tr>
                <td>管理员密码</td>
                <td><input name="pwd1" class="easyui-validatebox" data-options="required:true" />  </td>
            </tr>
            <tr>
                <td>确认密码</td>
                <td><input name="checkPwd1" class="easyui-validatebox" data-options="required:true" />  </td>
            </tr>
            <tr>
                <td>管理员状态</td>
                <td>
                    <select name="status1" class="easyui-combobox" name="status" style="width:200px;">
                        <option value="1">启用</option>
                        <option value="0">禁用</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td>选择角色</td>
                <td>
                    <select id="roleId" name="roleId1" style="width:200px;">

                    </select>
                </td>
            </tr>
            <tr>
                <td>
                    <input class="addSUser" type="button" value="保存">
                </td>
                <td>
                    <input type="reset" value="取消">
                </td>
            </tr>
        </table>
    </form>
</center>

<script type="text/javascript">

    $(function(){
        //添加系统用户进入到数据库中去
        $(".addSUser").click(function(){
            var json = $("#fmSystemUser").serializeObject();
            //console.log("jsonStr="+JSON.stringify(json));
            //alert(JSON.stringify(json));
            $.ajax({
                url:"<%=basePath %>/admin/authority/addSystemUser.do",//获取所有普通角色
                type:"POST",
                dataType:"json",
                data:json,
                success:function(rs){
                    var flag = rs.status;
                    if(flag=='0'){//保存成功
                        //1、关闭弹窗
                        $("#addSystemUser").window('close');
                        //2、刷新表格  element UI/lay ui
                        $("#systemUserDg").datagrid("reload");
                        //3、提示信息
                        $.messager.show({
                            title:'提示',
                            msg:'成功添加一套记录',
                            timeout:3,
                            showType:'slide'
                        });
                    }else if(flag=='2'){//账号已经存在
                        $("input[name=account1]").foucus();
                    }else{
                        $.messager.alert('提示','添加成功');
                    }
                }
            });
        });

        //动态获取普通角色
        $.ajax({
            url:"<%=basePath %>/admin/authority/getPTRoles.do",//获取所有普通角色
            type:"POST",
            dataType:"json",
            success:function(rs){
                var content = "";
                for(var i in rs){
                    content+=" <option value='"+rs[i].id+"'>"+rs[i].roleName+"</option>";
                }
                //console.log(content);
                $("#roleId").html(content);
            }
        });
    });
</script>
</body>
</html>