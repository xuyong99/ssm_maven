<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort() +request.getContextPath()+"/";
%>
<!DOCTYPE html>
<html>
<head>
	<base href="<%=basePath %>">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>选项卡</title>
	<link rel="stylesheet" type="text/css" href="<%=basePath %>/static/js/easyui/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="<%=basePath %>/static/js/easyui/themes/icon.css">
	<script type="text/javascript" src="<%=basePath %>/static/js/easyui/jquery.min.js"></script>
	<script type="text/javascript" src="<%=basePath %>/static/js/easyui/jquery.easyui.min.js"></script>
</head>
<body>
<div id="tt" class="easyui-tabs" style="width:500px;height:250px;">
	<div title="Tab1" style="padding:20px;">
		欢迎使用xxx管理系统
	</div>
</div>

	<input id="btn1" type="button" value="添加新选项卡">

<script type="text/javascript">
	$(function(){
	    $("#btn1").click(function(){
	        $("#tt").tabs('add',{
	            title:'新选项卡',
				iconCls:'icon-add',
                closable:true
			});
		});
	});
</script>
</body>
</html>