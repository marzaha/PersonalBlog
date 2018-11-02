<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<!DOCTYPE HTML>
<html>
<head>
<meta charset="UFT-8">
<base href="<%=basePath%>">
<title>FashionLife个人博客</title>
<style type="text/css">
body {
	background-image: url(images/img_index_bg.jpg);
	background-size: 100%;
}

#login {
	background-color: rgba(255, 255, 255, 0.4);
	border-radius: 8px;
	width: 460px;
	height: 260px;
	/*以下代码设置剧中*/
	margin: auto;
	position: absolute;
	left: 0;
	right: 0;
	margin-top: 300px;
	text-align: center;
	padding-top: 20px;
	padding-bottom: 20px
}

.inputitem {
	width: 100%;
	height: 20%;
	margin-top: 2%;
	margin-bottom: 2%;
	float: left;
}

.input {
	width: 370px;
	height: 40px;
	size: 20px; 
	background : white;
	border-width: 0px;
	border-radius: 5px;
	background: white;
}

.input[type=submit] {
	background-color: #46A5FF;
	color: white;
	size: 30px; 
}
</style>
</head>

<body>
	<div id="login">
		<form action="LoginServlet" methon="post">
			<div class="inputitem">
				<input class="input" name="username" type="text" size="20"
					placeholder="请输入用户名">
			</div>
			<div class="inputitem">
				<input class="input" name="password" type="password" size="20"
					placeholder="请输入密码">
			</div>
			<div class="inputitem">
				<input class="input" name="checkcode" type="text" size="20"
					placeholder="请输入验证码">
			</div>
			<div class="inputitem">
				<input class="input" name="login" type="submit" value="登录">
			</div>
		</form>
		<br> <a href="user/register.jsp">注册</a>
	</div>
</body>
</html>
