<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE HTML>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/user/css/main.css" type="text/css"></link>
</head>
<body>
<div id="maintop">
    <div id="mainlogo">
        <img id="logo" src="<%=request.getContextPath()%>/user/img/img_logo.png">
    </div>
    <div id="mainnav">
        <div id="navigation">
            <div>
                <a href="${pageContext.request.contextPath}/dynamic/dynamiclist.jsp" target="maincontent">动态</a>
            </div>
            <div>
                <a href="${pageContext.request.contextPath}/diary/diarylist.jsp" target="maincontent">日志</a>
            </div>
            <div>
                <a href="${pageContext.request.contextPath}/photo/photogrid.jsp" target="maincontent">相册</a>
            </div>
            <div>
                <a href="${pageContext.request.contextPath}/friend/friendlist.jsp" target="maincontent">好友</a>
            </div>
        </div>
    </div>
</div>
</body>
</html>
