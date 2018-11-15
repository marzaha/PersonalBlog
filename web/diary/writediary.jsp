<%--
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
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/diary/css/writediary.css">
    <script type="text/javascript" src="../js/wangEditor.js"></script>
</head>
<body>
<div id="writemain">
    <div id="headdiv">
        <input type="button" id="back" value="返回" onclick="history.go(-1);"/>
        <input type="button" id="publish" value="发表" onclick="publishDiary()"/>
    </div>
    <hr class="headline">
    <form id="writeform" action="${pageContext.request.contextPath}/AddDiaryServlet" method="post">
        <div class="writediv">
            <span class="tag">标题</span>
            <input type="text" class="inputedit" id="title" name="title" size="40" maxlength="20" placeholder="请输入标题">
        </div>
        <div class="writediv">
            <span class="tag">类型</span>
            <select class="selectedit" size="1" name="type" id="type">
                <option>--请选择类型--</option>
                <option value="心情">心情</option>
                <option value="纪实">纪实</option>
                <option value="随笔">随笔</option>
                <option value="情感">情感</option>
                <option value="文学">文学</option>
            </select>
        </div>
        <div class="writediv">
            <div id="topdiv" class="toolbar"></div>
            <div id="bottomdiv" class="content">
                <p class="contenttip">写下你的点点滴滴</p>
            </div>
        </div>
        <input type="hidden" id="content" name="content">
    </form>
</div>
</body>

<script type="text/javascript">

    window.onload = function () {
        initEditer();
    }

    function initEditer() {
        var E = window.wangEditor;
        var editor = new E("#topdiv", "#bottomdiv");
        var contentInput = document.getElementById("content");
        editor.customConfig.onchange = function (html) {
            contentInput.value = html;
        };
        editor.create();
    }

    function publishDiary() {
        document.getElementById("writeform").submit();
    }


</script>

</html>
