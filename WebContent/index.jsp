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
		<h2>个人博客</h2>
		<form action="LoginServlet" methon="post">
			<table style="margin-left: 40%">
				<marquee width="200" scrolldelay="250">用户登录</marquee>
				<tr>
					<td>账号：</td>
					<td><input name="username" type="text" size="21"></td>
				</tr>
				<tr>
					<td>密码：</td>
					<td><input name="password" type="password" size="21"></td>
				</tr>
			</table>
			<input type="submit" value="登录"> <input type="reset"
				value="重置">
		</form>
		<br> <a href="user/register.jsp">注册</a>
	</div>
</body>
</html>
