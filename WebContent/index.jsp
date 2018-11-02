<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML>
<html>
<head>
<meta charset="UFT-8">
<base href="<%=basePath%>">
<title>FashionLife空间</title>
<link rel="stylesheet" href="login/css/login.css" type="text/css"></link>
</head>

<body>
	<div id="login">
		<form action="LoginServlet" methon="post">
			<div class="inputitem">
				<input class="input" name="username" type="text" size="20" maxlength="20" placeholder="请输入用户名">
			</div>
			<div class="inputitem">
				<input class="input" name="password" type="password" size="20" maxlength="20" placeholder="请输入密码">
			</div>
			<div class="inputitem">
				<input class="input" name="checkcode" type="text" size="20" maxlength="4" placeholder="请输入验证码">
			</div>
			<div class="inputitem">
				<input class="loginbutton" name="login" type="submit" value="登录">
			</div>
		</form>
		<a href="user/register.jsp" class="rigbutton">用户注册</a>
	    <a href="#" onclick='return alert("敬请期待")' class="forbutton">忘记密码？</a>
	</div>
</body>
</html>
