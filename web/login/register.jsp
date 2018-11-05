<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE HTML>
<html>
<head>
    <title>FashionLife注册</title>
    <link rel="stylesheet" href="css/register.css" type="text/css"></link>
</head>

<body>
<div id="register">
    <%
        if (session.getAttribute("loginresult") != null) {
    %>
    <p class="registerresult"><%=session.getAttribute("loginresult") %>
    </p>
    <%
    } else {
    %>
    <p class="registerresult">&nbsp;&nbsp;</p>
    <%
        }
    %>

    <form action="<%=request.getContextPath()%>/RegisterServlet" methon="post" onsubmit="return checkRegister()">
        <div class="inputitem">
            <input class="input" id="username" name="username" type="text" maxlength="20" placeholder="请输入用户名">
        </div>
        <div class="inputitem">
            <input class="input" id="password" name="password" type="password" maxlength="20" placeholder="请输入密码">
        </div>
        <div class="inputitem">
            <input class="input" id="repassword" name="repassword" type="password" maxlength="20" placeholder="请再次输入密码">
        </div>
        <div class="inputitem">
            <input class="verifycode" id="verifycode" name="verifycode" type="text" maxlength="4" placeholder="请输入验证码">
            <img id="imagecode" src="<%=request.getContextPath()%>/VerifyCodeServlet" onclick="refreshVerifyCode()" alt="验证码"/>
        </div>
        <div class="inputitem">
            <input class="registerbutton" name="register" onclick="return checkLogin();" type="submit" value="注册">
        </div>
    </form>
    <a href="../index.jsp" class="gologinbutton">去登陆</a>
</div>
</body>

<script type="text/javascript">

    function refreshVerifyCode() {
        var time = new Date().getTime();
        document.getElementById("imagecode").src = "<%=request.getContextPath()%>/VerifyCodeServlet?" + time;
    }

    function checkRegister() {
        var username = document.getElementById("username").value;
        var password = document.getElementById("password").value;
        var repassword = document.getElementById("repassword").value;
        var verifycodeinput = document.getElementById("verifycode").value;
        if (username == "") {
            alert("请输入用户名")
            return false;
        }
        if (password == "") {
            alert("请输入密码")
            return false;
        }
        if (repassword == "") {
            alert("请再次输入密码")
            return false;
        }
        if (password != repassword) {
            alert("两次密码输入不一致")
            return false;
        }
        if (verifycodeinput == "") {
            alert("请输入验证码")
            return false;
        }

        return true;
    }
</script>

</html>
