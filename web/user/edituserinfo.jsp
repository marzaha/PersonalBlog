<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.lofts.blog.dao.CommonDataDao" %>

<!DOCTYPE HTML>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/user/css/main.css" type="text/css"></link>
</head>

<%
    List<String> birthdaylist = CommonDataDao.getBirthdayList();
    List<String> constellationlist = CommonDataDao.getConstellationList();
    List<String> hobbylist = CommonDataDao.getHobbyList();
%>

<body>
<div id="maincontent">
    <div id="editheaddiv">
        <h4>编辑个人信息</h4>

        <img id="headimg" src="<%=request.getContextPath()%>/user/img/img_default_head.jpg">
        <form action="<%=request.getContextPath()%>/UploadImageServlet" method="post" enctype="multipart/form-data">
        <input type="file" id="imagefile" name="imagefile" accept="image/jpeg" onchange="changeImagePath()">
        <input type="submit"  value="提交">
        </form>
        <input type="text" id="imagepath" name="imagepath" size="40" readonly>
        <input type="button" name="upload" id="upload" value="上传头像" onclick="uploadImage()">
    </div>
    <div class="userinfoedit">
        <span class="tag">用户名</span>
        <input type="text" class="inputedit" id="username" name="username" size="40" readonly>
    </div>
    <div class="userinfoedit">
        <span class="tag">昵称</span>
        <input type="text" class="inputedit" id="nickname" name="nickname" size="40" placeholder="请输入昵称">
    </div>
    <div class="userinfoedit">
        <span class="tag">性别</span>
        <input type="radio" class="inputedit" id="sexmale" name="sex" value="男" checked><span class="radiovalue">男</span>
        <input type="radio" class="inputedit" id="sexfemale" name="sex" value="女"><span class="radiovalue">女</span>
    </div>
    <div class="userinfoedit">
        <span class="tag">年龄</span>
        <select class="selectedit" size="1" name="birthday">
            <option>--请选择--</option>
            <%for (int i = 0; i < birthdaylist.size(); i++) {%>
                <option value="<%=birthdaylist.get(i)%>"><%=birthdaylist.get(i)%></option>
            <%}%>
        </select>
    </div>
    <div class="userinfoedit">
        <span class="tag">星座</span>
        <select class="selectedit" size="1" name="constellation">
            <option>--请选择--</option>
            <%for (int i = 0; i < constellationlist.size(); i++) {%>
                <option value="<%=constellationlist.get(i)%>"><%=constellationlist.get(i)%></option>
            <%}%>
        </select>
    </div>
    <div class="userinfoedit">
        <span class="tag">爱好</span>
        <div id="hobbydiv">
        <%for (int i = 0; i < hobbylist.size(); i++) {%>
            <input type="checkbox" class="inputcheckbox" name="hobby" value="<%=hobbylist.get(i)%>"><span class="radiovalue"><%=hobbylist.get(i)%></span>
        <%}%>
        </div>
    </div>
    <div class="userinfoedit">
        <span class="tag">Email</span>
        <input type="text" class="inputedit" id="email" name="nickname" size="40" placeholder="请输入邮箱">
    </div>
    <div class="userinfoedit">
        <span class="tag">城市</span>
        <select class="selectedit" size="1" name="address">
            <option>--请选择--</option>
            <option value="北京">北京</option>
            <option value="上海">上海</option>
            <option value="广州">广州</option>
        </select>
    </div>
</div>
</body>


<script type="text/javascript">
    function uploadImage() {
        document.getElementById("imagefile").click();
    }

    function changeImagePath() {
        document.getElementById("imagepath").value = document.getElementById("imagefile").value;

        var file = document.getElementById("imagefile").files[0];
        var reader = new FileReader();
        reader.readAsDataURL(file);
        reader.onload = function (ev) {
            document.getElementById("headimg").src = ev.target.result;
        }
    }

</script>

</html>
