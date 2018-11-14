<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE HTML>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/user/css/main.css" type="text/css"></link>
</head>

<body id="mainleftbody">
<div id="mainleft">
    <div id="headdiv">
        <c:if test="${!empty user.headimage}">
            <img id="headimg" src="${pageContext.request.contextPath}/${user.headimage}">
        </c:if>
        <c:if test="${empty user.headimage}">
            <img id="headimg" src="<%=request.getContextPath()%>/user/img/img_default_head.jpg">
        </c:if>
        <a href="<%=request.getContextPath()%>/user/edituserinfo.jsp" target="maincontent">编辑</a>
    </div>
    <div class="userinfo">
        <span class="tag">用户名</span><span class="uservalue">${user.username}</span>
    </div>
    <c:if test="${!empty user}">
        <div class="userinfo">
            <span class="tag">昵称</span><span class="uservalue">${user.nickname}</span>
        </div>
        <div class="userinfo">
            <span class="tag">性别</span><span class="uservalue">${user.sex}</span>
        </div>
        <div class="userinfo">
            <span class="tag">年龄</span><span class="uservalue">${user.birthday}</span>
        </div>
        <div class="userinfo">
            <span class="tag">星座</span><span class="uservalue">${user.constellation}</span>
        </div>
        <div class="userinfo">
            <span class="tag">爱好</span><span class="uservalue">${user.hobby}</span>
        </div>
        <div class="userinfo">
            <span class="tag">Email</span><span class="uservalue">${user.email}</span>
        </div>
        <div class="userinfo">
            <span class="tag">城市</span><span class="uservalue">${user.address}</span>
        </div>
    </c:if>
</div>
</body>
</html>
