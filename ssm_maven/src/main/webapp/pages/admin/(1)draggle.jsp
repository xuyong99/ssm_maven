<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort() +request.getContextPath()+"/";
%>
<!DOCTYPE html>
<html>
<head>
	<base href="<%=basePath %>">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>拖动组件</title>
	<style type="text/css">
		#box1{
			width: 100px;
			height: 100px;
			background: red;
		}

		#box2{
			width: 600px;
			height: 400px;
		}
	</style>
	<link rel="stylesheet" type="text/css" href="<%=basePath %>/static/js/easyui/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="<%=basePath %>/static/js/easyui/themes/icon.css">
	<script type="text/javascript" src="<%=basePath %>/static/js/easyui/jquery.min.js"></script>
	<script type="text/javascript" src="<%=basePath %>/static/js/easyui/jquery.easyui.min.js"></script>
</head>
<body>
	<%--通过class调用：easyui-控件名 --%>
	<%--<div id="box1" class="easyui-draggable" data-options="revert:true,cursor:'pointer',edge:10"></div>--%>
	<div id="box1"></div>

	<%--通过js调用--%>
	<script type="text/javascript">
		$("#box1").draggable({
			revert:true,
			cursor:'pointer'
		});
	</script>

	<%--窗口--%>
	<%--<div id="box2" class="easyui-window"></div>--%>
</body>
</html>
