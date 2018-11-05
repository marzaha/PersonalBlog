<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">
<title>个人博客</title>
<style type="text/css">
body {
	background-image: url(images/indexbg.jpg);
	background-position: center;
	background-repeat: no-repeat;
}
</style>
</head>

<body>
	<div style="text-align: center;">
		<h1>请注册</h1>
		<form action="RegisterServlet" method="post">
			<table style="margin-left: 40%">
				<caption>用户注册</caption>
				<tr>
					<td>ID:</td>
					<td><input name="id" type="text" size="20"></td>
				</tr>
				<tr>
					<td>账号：</td>
					<td><input name=username type="text" size="20"></td>
				</tr>
				<tr>
					<td>密码:</td>
					<td><input name="password" type="password" size="20"></td>
				</tr>
				<tr>
					<td>角色:</td>
					<td><input name="role" type="text" size="20"></td>
				</tr>
			</table>
			<input type="submit" value="注册"> <input type="reset"
				value="重置">
		</form>
		<br> <a href="index.jsp">登录</a>
	</div>
</body>
</html>
