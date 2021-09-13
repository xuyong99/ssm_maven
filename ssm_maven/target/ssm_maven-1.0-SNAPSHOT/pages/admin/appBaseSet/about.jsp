<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort() +request.getContextPath()+"/";
%>
<!DOCTYPE html>
<html>
<head>
	<base href="<%=basePath %>">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>关于我们</title>
	<style>
		form {
			margin: 0;
		}
		textarea {
			display: block;
		}
	</style>
	<script type="text/javascript">
        //var editor;
        //KindEditor.ready(function(K) {
        //editor = K.create('textarea[name="content"]', {
        var editor = KindEditor.create('textarea[name=content]', options);

       /* K('input[name=getHtml]').click(function(e) {
            alert(editor.html());
        });

        K('input[name=setHtml]').click(function(e) {
            editor.html('<h3>Hello KindEditor</h3>');
        });*/

        //});
	</script>
</head>
<body>
	<form>
		<textarea name="content" style="width:800px;height:400px;visibility:hidden;">
			${aboutMap.content}
		</textarea>
		<p>
			<input type="button" name="getHtml" value="取得HTML" />
			<input type="button" name="setHtml" value="设置HTML" />
		</p>
	</form>
</body>
</html>