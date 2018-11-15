<%@ page import="com.lofts.blog.bean.Diary" %>
<%@ page import="java.util.List" %>
<%@ page import="com.lofts.blog.dao.DiaryDao" %>

<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/11/14
  Time: 17:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/diary/css/diarylist.css">
</head>

<%
    DiaryDao diaryDao = new DiaryDao();
    List<Diary> list = diaryDao.queryAllDiary();
    request.setAttribute("diarylist", list);
%>

<body>
<div id="diarymain">
    <div id="headdiv">
        <a id="write" href="${pageContext.request.contextPath}/diary/writediary.jsp">写日志</a>
    </div>
    <hr class="headline">
    <div id="diarylist">
        <ul>
            <c:forEach items="${diarylist}" var="diary">
                <li>
                    <div>
                        <a href="${pageContext.request.contextPath}/diary/diaryshow.jsp?diaryid=${diary.id}">${diary.title}</a>
                        <span class="diarytype">${diary.type}</span><span class="diarydate">${diary.createdate}</span>
                    </div>
                </li>
                <hr class="listline">
            </c:forEach>
        </ul>
    </div>
</div>
</body>
</html>
