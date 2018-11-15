<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/11/13
  Time: 14:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<p>暂无动态</p>
</body>

<script>
    window.onload = function () {
        refreshLeft();
    }

    //修改用户信息后跳转动态界面，需要刷新左边用户信息
    function refreshLeft() {
        window.parent.frames["mainleft"].location.reload();
    }
</script>
</html>
