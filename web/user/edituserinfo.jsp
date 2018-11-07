<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE HTML>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/user/css/main.css" type="text/css"></link>
</head>
<body>
<div id="maincontent">
    <div id="editheaddiv">
        <img id="headimg" src="<%=request.getContextPath()%>/user/img/img_default_head.jpg">
        <input type="file" name="file" accept="image/jpeg" value="选择图片">
    </div>
</div>
</body>
</html>
