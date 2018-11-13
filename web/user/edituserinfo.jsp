<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.lofts.blog.dao.CommonDataDao" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


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
    request.setAttribute("birthdaylist", birthdaylist);
    List<String> constellationlist = CommonDataDao.getConstellationList();
    request.setAttribute("constellationlist", constellationlist);
    List<String> hobbylist = CommonDataDao.getHobbyList();
    request.setAttribute("hobbylist", hobbylist);
%>


<body>
<div id="maincontent">
    <h4>编辑个人信息</h4>
    <form action="${pageContext.request.contextPath}/EditUserInfoServlet" method="post">
        <div id="editheaddiv">
            <c:if test="${empty user}">
                <img id="headimg" src="<%=request.getContextPath()%>/user/img/img_default_head.jpg">
            </c:if>
            <c:if test="${!empty user}">
                <img id="headimg" src="${pageContext.request.contextPath}/${user.headimage}">
            </c:if>
            <input type="file" id="imagefile" name="imagefile" accept="image/jpeg" onchange="updateImage()">
            <input type="text" id="imagepath" name="imagepath" size="40" value="${user.headimage}" readonly>
            <input type="button" name="upload" class="bluebutton" value="选择图片" onclick="chooseImage()">
        </div>
        <div class="userinfoedit">
            <span class="tag">用户名</span>
            <input type="text" class="inputedit" id="username" name="username" size="40" value="${username}" readonly>
        </div>
        <div class="userinfoedit">
            <span class="tag">昵称</span>
            <input type="text" class="inputedit" id="nickname" name="nickname" size="40" value="${user.nickname}" placeholder="请输入昵称">
        </div>
        <div class="userinfoedit">
            <span class="tag">性别</span>
            <input type="radio" class="inputedit" id="sexmale" name="sex" value="1" checked><span class="radiovalue">男</span>
            <input type="radio" class="inputedit" id="sexfemale" name="sex" value="0"><span class="radiovalue">女</span>
        </div>
        <div class="userinfoedit">
            <span class="tag">年龄</span>
            <select class="selectedit" size="1" name="birthday" id="birthday">
                <option>--请选择--</option>
                <c:forEach items="${birthdaylist}" var="birthday">
                    <option value="${birthday}">${birthday}</option>
                </c:forEach>
            </select>
        </div>
        <div class="userinfoedit">
            <span class="tag">星座</span>
            <select class="selectedit" size="1" name="constellation" id="constellation">
                <option>--请选择--</option>
                <c:forEach items="${constellationlist}" var="constellation">
                    <option value="${constellation}">${constellation}</option>
                </c:forEach>
            </select>
        </div>
        <div class="userinfoedit">
            <span class="tag">爱好</span>
            <c:forEach items="${hobbylist}" var="hobby">
                <input type="checkbox" class="inputedit" name="hobby" value="${hobby}"><span class="radiovalue">${hobby}</span>
            </c:forEach>
        </div>
        <div class="userinfoedit">
            <span class="tag">Email</span>
            <input type="text" class="inputedit" id="email" name="email" size="40" value="${user.email}" placeholder="请输入邮箱">
        </div>
        <div class="userinfoedit">
            <span class="tag">城市</span>
            <input type="text" class="inputedit" id="address" name="address" size="30" placeholder="请选择省/市/县区" readonly>
            <select class="selectcityedit" size="1" name="province" id="province" onchange="getCity()">
                <option>--请选择省--</option>
            </select>
            <select class="selectcityedit" size="1" name="city" id="city" onchange="getCounty()">
                <option>--请选择市--</option>
            </select>
            <select class="selectcityedit" size="1" name="county" id="county" onchange="appendAddress()">
                <option>--请选择县区--</option>
            </select>
        </div>
        <input type="submit" value="保存" class="bluebutton">
    </form>
</div>
</body>


<script type="text/javascript">

    window.onload = function () {
        getProvince();

        setUserdata();
    }

    function uploadImage() {
        layer.load(2);
        $.ajaxFileUpload({
            type: 'POST',
            url: '${pageContext.request.contextPath}/UploadImageServlet',
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

    function getProvince() {
        $.ajax({
            type: 'POST',
            url: '${pageContext.request.contextPath}/CityServlet?type=province',
            dateType: 'json',
            success: function (response) {
                var provinceList = response;
                var str = '';
                for (var i = 0; i < provinceList.length; i++) {
                    str += '<option value=' + provinceList[i].provinceid + '>' + provinceList[i].province + '</option>'
                }
                document.getElementById("province").innerHTML = str;

                getCity();
            },
            error: function (response) {
                console.log(response);
            }
        })
    }

    function getCity() {
        var provinceIndex = document.getElementById("province").selectedIndex;
        var provinceId = document.getElementById("province").options[provinceIndex].value;
        $.ajax({
            type: 'POST',
            url: '${pageContext.request.contextPath}/CityServlet?type=city&lastId=' + provinceId,
            dateType: 'json',
            success: function (response) {
                var cityList = response;
                var str = '';
                for (var i = 0; i < cityList.length; i++) {
                    str += '<option value=' + cityList[i].cityid + '>' + cityList[i].city + '</option>'
                }
                document.getElementById("city").innerHTML = str;

                getCounty();
            },
            error: function (response) {
                console.log(response);
            }
        })
    }

    function getCounty() {
        var cityIndex = document.getElementById("city").selectedIndex;
        var cityId = document.getElementById("city").options[cityIndex].value;
        $.ajax({
            type: 'POST',
            url: '${pageContext.request.contextPath}/CityServlet?type=county&lastId=' + cityId,
            dateType: 'json',
            success: function (response) {
                var countyList = response;
                var str = '';
                for (var i = 0; i < countyList.length; i++) {
                    str += '<option value=' + countyList[i].countyid + '>' + countyList[i].county + '</option>'
                }
                document.getElementById("county").innerHTML = str;

                appendAddress();
            },
            error: function (response) {
                console.log(response);
            }
        })
    }

    function appendAddress() {
        var provinceIndex = document.getElementById("province").selectedIndex;
        var province = document.getElementById("province").options[provinceIndex].text;

        var cityIndex = document.getElementById("city").selectedIndex;
        var city = document.getElementById("city").options[cityIndex].text;

        var countyIndex = document.getElementById("county").selectedIndex;
        var county = document.getElementById("county").options[countyIndex].text;

        document.getElementById("address").value = province + city + county;

        if ("${user.address}" != null) {
            document.getElementById("address").value = "${user.address}";
        }
    }

    function setUserdata() {
        if ("${user.sex}" == "男") {
            document.getElementsByName("sex")["value:contains(${user.sex})"].checked = true;
        } else {
            document.getElementById("sexfemale").checked = true;
        }

        $("#birthday option:contains(${user.birthday})").attr("selected", true);
        $("#constellation option:contains(${user.constellation})").attr("selected", true);

    }


</script>

</html>
