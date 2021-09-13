<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort() +request.getContextPath()+"/";
%>
<!DOCTYPE html>
<html>
<head>
	<base href="<%=basePath %>">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>系统用户列表页面</title>
</head>
<body>
<table id="systemUserDg"></table>
<script type="text/javascript">
    $(function(){
        /*请求后台系统用户列表数据*/
        $("#systemUserDg").datagrid({
            columns:[//定义表头
                [
                    {title:'全选',checkbox:true},
                    {title:'管理员账号',field:'account',width:150},
                    {title:'管理员姓名',field:'uName',width:150},
                    {title:'管理员手机',field:'phone',width:150},
                    {title:'管理员邮箱',field:'email',width:150},
                    {title:'管理员状态',field:'status',width:150,formatter: function(value,row,index)
						{
							if (value=='1'){
								return '启用';
							} else {
								return '禁用';
							}
						}
                    },
                    {title:'角色管理',field:'operate1',width:150,formatter: function(value,row,index)
						{
							return "<a href='javascript:void(0)'>角色设置</a>";
						}
					},
                    {title:'操作',field:'operate2',width:150,formatter: function(value,row,index)
						{
							return "<a href='javascript:void(0)'>查看</a><a href='javascript:void(0)'>编辑</a><a href='javascript:void(0)'>停用</a>";
						}
					}
                ]
            ],
            url:"<%=basePath %>/admin/authority/getSystemUser.do",
            pagination:true,
            rownumbers:true,
            fit:true,
            toolbar: [{
                iconCls: 'icon-add',
                text:'添加系统用户',
                handler: function(){
                    //打开窗口
                    $("#addSystemUser").window('open').panel('refresh','<%=basePath %>/pages/admin/systemManager/addSystemUserContent.jsp');
                }
            },'-',{
                iconCls: 'icon-remove',
                text:'删除系统用户',
                handler: function(){alert('添加系统用户')}
            }]
        })
    });
</script>

<%--添加角色窗口--%>
<div id="addSystemUser">

</div>
<script type="text/javascript">
    $(function(){
        $("#addSystemUser").window({
            width:600,  //设置窗口的宽度
            height:400,
            iconCls:'icon-add',
            title:'添加系统用户',
            minimizable:false,//关闭最小化菜单
            maximizable:false,//关闭最大化菜单
            resizable:false,//窗口不可更改尺寸
            closed:true,  //窗口初始化时，默认隐藏
            modal:true //窗口当前任务没有完成，不能进行其他操作
        });
    });
</script>
</body>
</html>
