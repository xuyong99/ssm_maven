<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort() +request.getContextPath()+"/";
%>
<!DOCTYPE html>
<html>
<head>
	<base href="<%=basePath %>">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>角色窗口内容</title>
</head>
<body>
	<center style="padding-top: 100px">
        <table>
            <tr>
                <td>角色名：</td>
                <td><input id="roleName" class="easyui-validatebox" data-options="required:true,validType:'length[1,20]'" />  </td>
            </tr>
            <tr>
                <td>授权：</td>
                <td>
                    <ul id="authorityTree"></ul>
                </td>
            </tr>
            <tr>
                <td><a id="roleBtn1" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-save'">保存</a></td>
                <td>
                    <a id="roleBtn2" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-cancel'">取消</a>
                </td>
            </tr>
        </table>
    </center>
<script type="text/javascript">
    $(function(){
        /*自动获取角色可以授予的权限*/
        $('#authorityTree').tree({
            url:'<%=basePath %>/admin/authority/getRoleAuthority.do',
            checkbox:true,//在树节点前添加复选框
            lines:true//节点之间通过虚线连接
        });

        $("#roleBtn1").click(function(){
            var roleName = $("#roleName").val();
            var nodes = $('#authorityTree').tree('getChecked', ['checked','indeterminate']);
            var authorityIdStr = "";
            for(var i in nodes){
                authorityIdStr+=nodes[i].id+",";
            }
            $.ajax({
                url:"<%=basePath %>/admin/authority/addRole.do",
                type:"POST",
                dataType:"json",
                data:{
                    "roleName":roleName,
                    "authorityIdStr":authorityIdStr
                },
                success:function(rs){
                    var status = rs.status;
                    //0成功,1失败，2角色名重复,3数据格式错误  -1未知错误
                    if(status=='0'){
                        //1、关闭角色弹窗
                        $("#addRole").window('close')
                        //2、刷新角色列表
                        $("#roleDg").datagrid("reload");
                        //3、右下角滑动提示
                        $.messager.show({
                            title:'提示',
                            msg:'成功添加一条记录',
                            timeout:3000,
                            showType:'slide'
                        });
                    }else if(status=='1'){
                        $.messager.alert('提示','添加失败，请重试!');
                    }else if(status=='2'){
                        //消息提示框
                        $.messager.confirm('提示','角色名已存在，要重新填写吗？',function(r){
                            if (r){//确定重新填写
                               $("#roleName").val("");
                               $("#roleName").focus();
                            }
                        });
                    }else if(status=='3'){
                        $.messager.alert('提示','添加失败，数据格式有误，请重填!');
                    }else{
                        $.messager.alert('提示','添加失败，请重试!');
                    }
                },
                error:function(rs){

                }
            });
        });
    });
</script>
</body>
</html>
