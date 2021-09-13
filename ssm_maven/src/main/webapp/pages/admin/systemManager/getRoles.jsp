<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort() +request.getContextPath()+"/";
%>
<!DOCTYPE html>
<html>
<head>
	<base href="<%=basePath %>">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>系统管理页面</title>
</head>
<body>
<table id="roleDg"></table>
<script type="text/javascript">
    $(function(){
        /*请求后台角色数据*/
        $("#roleDg").datagrid({
            columns:[//定义表头
                [
                    {title:'全选',checkbox:true},
                    {title:'角色名',field:'roleName',width:150},
                    {title:'状态',field:'status',width:150,formatter: function(value,row,index){
                            if (row.status=='1'){
                                return '启用';
                            } else {
                                return '禁用';
                            }
                        }
                    },
                    {title:'修改时间',field:'updateTime',width:150},
                    {title:'角色操作',field:'operate1',width:150,formatter: function(value,row,index){
							if(row.isRoot=='1'){
								return "无操作";
							}else{//普通角色
								if (row.status=='1'){
									return "<a href='javascript:void(0)'>禁用</a>";
								} else {
									return "<a href='javascript:void(0)'>启用</a>";
								}
							}
                        }
                    },
                    {title:'权限操作',field:'operate2',width:150,formatter: function(value,row,index){
							if(row.isRoot=='1'){
								return "无操作";
							}else{
                            	return "<a href='javascript:void(0)' onclick='editJueSe("+row.id+")'>编辑角色</a>";
                            }
                        }
                    }
                ]
            ],
            url:"<%=basePath %>/admin/authority/getRole.do",
            pagination:true,
            fit:true,
            toolbar: [{
                iconCls: 'icon-add',
                text:'添加角色',
                handler: function(){
                    //打开窗口
                    $("#addRole").window('open').panel('refresh','<%=basePath %>/pages/admin/systemManager/addRoleContent.jsp');
                }
            },'-',{
                iconCls: 'icon-remove',
                text:'删除角色',
                handler: function(){alert('删除角色')}
            }]
        })
    });
</script>

<%--添加角色窗口--%>
<div id="addRole">

</div>
<script type="text/javascript">
    $(function(){
        $("#addRole").window({
            width:600,  //设置窗口的宽度
            height:400,
            iconCls:'icon-add',
            title:'添加角色',
            minimizable:false,//关闭最小化菜单
            maximizable:false,//关闭最大化菜单
            resizable:false,//窗口不可更改尺寸
            closed:true,  //窗口初始化时，默认隐藏
            modal:true //窗口当前任务没有完成，不能进行其他操作
        });
    });
</script>

<%--添加角色窗口--%>
<div id="editRole">

</div>
<script type="text/javascript">
	/*点击编辑角色按钮时，触发单击事件*/
    function editJueSe(roleId){
        $("#editRole").window("open").panel("refresh","<%=basePath %>//admin/authority/getPTAuthority.do");
	}

    $(function(){
        $("#editRole").window({
            width:600,  //设置窗口的宽度
            height:400,
            iconCls:'icon-edit',
            title:'编辑角色',
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
