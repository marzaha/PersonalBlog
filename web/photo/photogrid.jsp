<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/11/14
  Time: 17:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/photo/css/photogrid.css">
</head>
<body>
<div id="photomain">
    <div id="headdiv">
        <a id="upload" href="${pageContext.request.contextPath}/photo/uploadphoto.jsp">上传照片</a>
    </div>
    <hr class="headline">
    <div>
        <ul>
            <c:forEach items="${diarylist}" var="diary">
                <li>
                    <div>

                    </div>
                </li>
            </c:forEach>
        </ul>
    </div>
</div>
</body>
</html>
