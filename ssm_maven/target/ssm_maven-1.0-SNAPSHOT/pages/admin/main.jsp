<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort() +request.getContextPath()+"/";
%>
<!DOCTYPE html>
<html>
<head>
	<base href="<%=basePath %>">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>欢迎来到xxxApp后台管理系统</title>
	<link rel="stylesheet" type="text/css" href="<%=basePath %>/static/js/easyui/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="<%=basePath %>/static/js/easyui/themes/icon.css">
	<script type="text/javascript" src="<%=basePath %>/static/js/easyui/jquery.min.js"></script>
	<script type="text/javascript" src="<%=basePath %>/static/js/easyui/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="<%=basePath %>/static/js/easyui/locale/easyui-lang-zh_CN.js"></script>
	<%--引入kindeditor--%>
	<link rel="stylesheet" href="<%=basePath %>/static/js/kindeditor-4.1.10/themes/default/default.css" />
	<script charset="utf-8" src="<%=basePath %>/static/js/kindeditor-4.1.10/kindeditor-min.js"></script>
	<script charset="utf-8" src="<%=basePath %>/static/js/kindeditor-4.1.10/lang/zh_CN.js"></script>
	<%--引入json处理工具类--%>
	<script charset="utf-8" src="<%=basePath %>/static/js/jsonHandler.js"></script>
</head>
<body class="easyui-layout">
	<%--北丐--%>
	<div data-options="region:'north',title:'北丐',split:true,noheader:false" style="height: 80px">
		<%--<img src="<%=basePath %>/static/images/head.jpg" style="width: inherit;height:70px">--%>
	</div>
		<%--南帝--%>
	<div data-options="region:'south',title:'南丐',noheader:true,split:true" style="height: 80px">
		<center style="line-height: 70px">
			&copy;版权所有|维权必究
		</center>
	</div>
		<%--西毒--%>
	<div data-options="region:'west',iconCls:'icon-world',title:'菜单栏',split:true" style="width: 200px">
		<ul id="menu"></ul>
	</div>
		<%--中神通--%>
	<div data-options="region:'center',title:'中神通',noheader:true">
		<%--选项卡--%>
		<div id="tt" data-options="fit:true"  class="easyui-tabs">
			<div title="首页" data-options="iconCls:'icon-house'" style="padding:20px;">
				<center style="line-height: 400px">
					<span style="font-size: 36px;color: blue;font-weight:bolder;text-shadow: 10px 10px 5px #ccc">欢迎使用xxx管理系统</span>
				</center>
			</div>
		</div>
	</div>

	<script type="text/javascript">
		$(function(){

		    /*动态获取后台权限树*/
		    $("#menu").tree({
				url:"<%=basePath %>/admin/authority/getMenus.do",
                onClick:function(node){
				    //先判断指定的选项卡是否存在，
					var flag1 = $("#tt").tabs("exists",node.text);
					if(flag1){//选项卡存在
                        $("#tt").tabs("select",node.text);//选中一个选项卡
					}else{//选项卡不存在
                        //判断当前点击的是否是一级菜单
						if(node.href!=undefined)
							$("#tt").tabs('add',{
								title:node.text,
								iconCls:node.iconCls,
								closable:true,
								href:node.href
							});
					}
				}
			});


		});
	</script>


</body>

</html>
