<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort() +request.getContextPath()+"/";
%>
<!DOCTYPE html>
<html>
<head>
	<base href="<%=basePath %>">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>意见反馈</title>
</head>
<body>
	<table id="dg"></table>
	<script type="text/javascript">
		/*定义好修改单个状态的方法*/
		function singleUpdate(temp){
		    console.log("temp="+temp);
            $.ajax({
                url:"<%=basePath %>/admin/appBaseSet/oneUpdate.do",
                type:"POST",
                data:"JSON",
                data:{
                    "id":temp
                },
                success:function(rs){
					if(rs){//修改成功
						$("#dg").datagrid("reload");
					}else{
                        $.messager.alert('提示','处理失败，请重试!');
					}
                },
                error:function(rs){
                    $.messager.alert('提示','哎呀，出错了，请重试!');
                }
            });
		}

		$(function(){
		    /*动态获取数据库的远程数据*/
		    $("#dg").datagrid({
				fit:true,  //让table自适应，普通整个"中神通"
                rownumbers:true,//在表格前显示行号
				url:"<%=basePath %>/admin/appBaseSet/getAdvices.do",//请求后台数据
                striped:true,//显示隔行变色
				columns:[//定义表头
				    [
						{title:'全选',checkbox:true},
						{title:'意见内容',field:'content',width:150},
						{title:'时间',field:'createTime',width:150,sortable:true},
						{title:'姓名',field:'uName',width:150},
						{title:'联系方式',field:'phone',width:150,formatter:
							function(value,row,index){
								if(value==undefined){
								    return "<span style='color:red'>无</span>";
								}else{
								    return value;
								}
							}
                        },
                        {title:'是否已处理',field:'status',width:150,formatter:
                            function(value,row,index){
                                if(value=='0'){
                                    //return "未处理";
									return "<a href='javascript:void(0)' class='s' onclick='singleUpdate("+row.id+")'>未处理</a>";
                                }else{
                                    //return "已处理";
									return "<a href='javascript:void(0)' class='s' onclick='singleUpdate("+row.id+")'>已处理</a>";
                                }
                            }
						}
					]
				],
                sortName:'createTime',//定义哪个列可以排序
                remoteSort:false,//关闭远程排序，否则前段排序失效
                pagination:true,//分页
                /*pageList:[1,5,10,20],*/  //定义每页显示的条数
				toolbar:[//在表格前定工具状态栏
				    /*已处理按钮*/
					{
						text:"已处理",
						iconCls:'icon-edit',
						handler:function(){
						    var rows = $("#dg").datagrid("getSelections");
						    var len = rows.length;
						    if(len==0){
                                $.messager.alert('提示','没有选中记录!');
                            }else{
						        //获取选中行的id
								var idStr = "";
								for(var i in rows){
								    idStr+=rows[i].id+",";
								}
								//执行ajax将拼接好的id字符串传递给后台
								$.ajax({
									url:"<%=basePath %>/admin/appBaseSet/batchUpdate.do",
									type:"POST",
									data:"JSON",
									data:{
									    "idStr":idStr
									},
									success:function(rs){
										if(rs){
                                            //修改成功后，需要局部刷新表格数据
                                            $("#dg").datagrid("reload");
										}else{//修改失败
                                            $.messager.alert('提示','处理失败，请重试!');
										}
									},
									error:function(rs){
                                        $.messager.alert('提示','哎呀，出错了，请重试!');
									}
								});

							}
						}
					},'-',
                    {
                        text:"批量删除",
                        iconCls:'icon-remove',
                        handler:function(){alert("删除")}
                    }
				]
			});

		    /*给处理按钮添加easyui-linkbutton样式，暂时未生效*/
		    $(".s").linkbutton({
				iconCls:'icon-edit'
			});
		});
	</script>
</body>
</html>
