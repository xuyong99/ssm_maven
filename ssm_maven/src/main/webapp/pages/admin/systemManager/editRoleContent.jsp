<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort() +request.getContextPath()+"/";
%>
<!DOCTYPE html>
<html>
<head>
	<base href="<%=basePath %>">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>编辑角色页面</title>
</head>
<body>
	<center>
        <table border="1px" width="500px" cellspacing="0px">
            <c:forEach items="${ptAuthorityList}" var="oneMenu">
                <tr>
                    <td><input type="hidden" name="oneId" value="${oneMenu.oneId}">${oneMenu.oneName}</td>
                    <td>
                         <c:forEach items="${oneMenu.twoMenuList}" var="twoMenu">
                             <input type="checkbox" name="twoId" value="${twoMenu.twoId}">${twoMenu.twoName}&nbsp;&nbsp;
                         </c:forEach>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </center>

    <%--success:function(rs){
        for(var i in rs){
            var authorityId= rs[i].authoryId;
            $("input[value="+authorityId+"]").prop("checked",true);
        }
    }--%>
</body>
</html>
