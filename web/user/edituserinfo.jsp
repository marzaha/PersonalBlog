<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.lofts.blog.dao.CommonDataDao" %>

<!DOCTYPE HTML>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/user/css/main.css" type="text/css"></link>
    <script type="text/javascript" src="../js/jquery-3.2.1.js"></script>
    <script type="text/javascript" src="../js/ajaxfileupload.js"></script>
    <script type="text/javascript" src="../layer/layer.js"></script>
</head>

<%
    List<String> birthdaylist = CommonDataDao.getBirthdayList();
    List<String> constellationlist = CommonDataDao.getConstellationList();
    List<String> hobbylist = CommonDataDao.getHobbyList();
%>

<body>
<div id="maincontent">
    <h4>编辑个人信息</h4>
    <div id="editheaddiv">
        <img id="headimg" src="<%=request.getContextPath()%>/user/img/img_default_head.jpg">
        <input type="file" id="imagefile" name="imagefile" accept="image/jpeg" onchange="updateImage()">
        <input type="text" id="imagepath" name="imagepath" size="40" readonly>
        <input type="button" name="upload" id="upload" value="选择图片" onclick="chooseImage()">
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
            <option value="<%=birthdaylist.get(i)%>"><%=birthdaylist.get(i)%>
            </option>
            <%}%>
        </select>
    </div>
    <div class="userinfoedit">
        <span class="tag">星座</span>
        <select class="selectedit" size="1" name="constellation">
            <option>--请选择--</option>
            <%for (int i = 0; i < constellationlist.size(); i++) {%>
            <option value="<%=constellationlist.get(i)%>"><%=constellationlist.get(i)%>
            </option>
            <%}%>
        </select>
    </div>
    <div class="userinfoedit">
        <span class="tag">爱好</span>
        <%for (int i = 0; i < hobbylist.size(); i++) {%>
        <input type="checkbox" class="inputedit" name="hobby" value="<%=hobbylist.get(i)%>"><span class="radiovalue"><%=hobbylist.get(i)%></span>
        <%}%>
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
        layer.load(2);
        $.ajaxFileUpload({
            type: 'POST',
            url: '<%=request.getContextPath()%>/UploadImageServlet',
            secureurl: false,
            fileElementId: 'imagefile',
            dataType: 'text',
            success: function (response) {
                var data = response.replace(/<.*?>/ig, "");
                var obj = JSON.parse(data);
                document.getElementById("imagepath").value = obj[0].imagepath;

                layer.closeAll();
            },
            error: function (response) {
                alert(response)
                layer.close(tip);
            }
        })
    }

    function chooseImage() {
        document.getElementById("imagefile").click();
    }

    function updateImage() {
        document.getElementById("imagepath").value = document.getElementById("imagefile").value;
        var file = document.getElementById("imagefile").files[0];
        var reader = new FileReader();
        reader.readAsDataURL(file);
        reader.onload = function (ev) {
            document.getElementById("headimg").src = ev.target.result;
        }

        uploadImage();
    }

</script>

</html>
