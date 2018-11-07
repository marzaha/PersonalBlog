<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE HTML>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/user/css/main.css" type="text/css"></link>
</head>
<body id="mainleftbody">
<div id="mainleft">
    <div id="headdiv">
        <img id="headimg" src="<%=request.getContextPath()%>/user/img/img_default_head.jpg">
        <a href="<%=request.getContextPath()%>/user/edituserinfo.jsp" target="maincontent">编辑</a>
    </div>
    <div class="userinfo">
        <span class="tag">用户名</span><span class="uservalue">jiang</span>
    </div>
    <div class="userinfo">
        <span class="tag">昵称</span><span class="uservalue">未填写</span>
    </div>
    <div class="userinfo">
        <span class="tag">性别</span><span class="uservalue">未填写</span>
    </div>
    <div class="userinfo">
        <span class="tag">年龄</span><span class="uservalue">未填写</span>
    </div>
    <div class="userinfo">
        <span class="tag">星座</span><span class="uservalue">未填写</span>
    </div>
    <div class="userinfo">
        <span class="tag">爱好</span><span class="uservalue">未填写</span>
    </div>
    <div class="userinfo">
        <span class="tag">Email</span><span class="uservalue">未填写</span>
    </div>
    <div class="userinfo">
        <span class="tag">城市</span><span class="uservalue">未填写</span>
    </div>
</div>
</body>
</html>
