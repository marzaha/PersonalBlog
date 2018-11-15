<%@ page import="com.lofts.blog.bean.Diary" %>
<%@ page import="com.lofts.blog.dao.DiaryDao" %><%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/11/14
  Time: 17:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/diary/css/diaryshow.css">
</head>

<%
    String diaryid = request.getParameter("diaryid");
    DiaryDao dao = new DiaryDao();
    Diary diary = dao.queryDiarybyId(diaryid);
    request.setAttribute("diary", diary);
%>

<body>
<div id="writemain">
    <div class="headdiv">
        <input type="button" id="back" value="返回" onclick="history.go(-1);"/>
        <span id="title">${diary.title}</span>
    </div>
    <hr class="headline">
    <div class="headdiv">
        <span id="date">${diary.type}&nbsp;|&nbsp;${diary.createdate}</span>
    </div>
    <div id="diaryshow">
        ${diary.content}
    </div>
</div>
</body>

<script type="text/javascript">


</script>

</html>
