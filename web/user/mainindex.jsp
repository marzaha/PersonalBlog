<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE HTML>
<html>
<head>
    <title>FashionLife空间</title>
    <link rel="stylesheet" type="text/css"></link>
</head>

<frameset rows="20%,*">
    <frame src="<%=request.getContextPath()%>/user/maintop.jsp"/>
    <frameset cols="20%,*">
        <frame src="<%=request.getContextPath()%>/user/mainleft.jsp"/>
        <frame name="right"/>
    </frameset>
</frameset>

</html>
