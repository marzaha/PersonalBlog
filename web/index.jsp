<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>
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
    <form action="LoginServlet" methon="post" onsubmit="return checkLogin()">
        <div class="inputitem">
            <input class="input" id="username" name="username" type="text" maxlength="20" placeholder="请输入用户名">
        </div>
        <div class="inputitem">
            <input class="input" id="password" name="password" type="password" maxlength="20" placeholder="请输入密码">
        </div>
        <div class="inputitem">
            <input class="verifycode" id="verifycode" name="verifycode" type="text" maxlength="4" placeholder="请输入验证码">
            <img id="imagecode" src="<%=request.getContextPath()%>/VerifyCodeServlet" onclick="refreshVerifyCode()"
                 alt="验证码"/>
        </div>
        <div class="inputitem">
            <input class="loginbutton" name="login" onclick="return checkLogin();" type="submit" value="登录">
        </div>
    </form>
    <a href="user/register.jsp" class="rigbutton">用户注册</a>
    <a href="#" onclick='return alert("敬请期待")' class="forbutton">忘记密码？</a>
</div>
</body>

<script type="text/javascript">

    function refreshVerifyCode() {
        var time = new Date().getTime();
        document.getElementById("imagecode").src = "<%=request.getContextPath()%>/VerifyCodeServlet?" + time;
    }

    function checkLogin() {
        var username = document.getElementById("username").value;
        var password = document.getElementById("password").value;
        var verifycodeinput = document.getElementById("verifycode").value;
        var verifycode = '<%=session.getAttribute("verifycode")%>';
        if (username == "") {
            alert("请输入用户名")
            return false;
        }
        if (password == "") {
            alert("请输入密码")
            return false;
        }
        if (verifycodeinput == "") {
            alert("请输入验证码")
            return false;
        }
        // if(verifycodeinput != verifycode){
        // 	alert("验证码输入错误");
        // 	return false;
        // }
        return true;
    }
</script>

</html>
