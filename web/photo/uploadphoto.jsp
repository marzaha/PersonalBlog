<%--
  Created by IntelliJ IDEA.
  User: asus
  Date: 2018-11-15
  Time: 23:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/photo/css/uploadphoto.css">
    <script type="text/javascript" src="../js/jquery-3.2.1.js"></script>
    <script type="text/javascript" src="../js/ajaxfileupload.js"></script>
    <script type="text/javascript" src="../layer/layer.js"></script>
</head>
<body>
<div id="uploadmain">
    <div id="headdiv">
        <input type="button" id="back" value="返回" onclick="history.go(-1);"/>
        <a id="upload" href="${pageContext.request.contextPath}/photo/uploadphoto.jsp">上传照片</a>
        <input type="button" id="choose" value="选择照片" onclick="choosePhoto()"/>
        <input type="file" id="uploadfile" name="uploadfile" accept="image/jpeg" multiple="multiple" onchange="uploadImage()"/>
    </div>
    <hr class="headline">
    <div>
        <ul id="photolist">

        </ul>
    </div>
</div>
</body>

<script type="text/javascript">

    function uploadImage() {
        layer.load(2);
        $.ajaxFileUpload({
            type: 'POST',
            url: '${pageContext.request.contextPath}/UploadImageServlet',
            secureurl: false,
            fileElementId: 'uploadfile',
            dataType: 'text',
            success: function (response) {
                var data = response.replace(/<.*?>/ig, "");
                var array = JSON.parse(data);
                addPhotoNode(array);

                layer.closeAll();
            },
            error: function (response) {
                alert(response)
                layer.close(tip);
            }
        })
    }

    function addPhotoNode(array) {
        var ulEle = document.getElementById("photolist");
        for (var i = 0; i < array.length; i++) {

            var liEle = document.createElement("li");
            var imgEle = document.createElement("img");
            imgEle.setAttribute("class", "photo");
            imgEle.src = "${pageContext.request.contextPath}" + "/" + array[i].imagepath;

            liEle.appendChild(imgEle);

            ulEle.appendChild(liEle);
        }

    }

    function choosePhoto() {
        document.getElementById("uploadfile").click();
    }

</script>

</html>
