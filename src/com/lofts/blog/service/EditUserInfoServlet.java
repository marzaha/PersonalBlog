package com.lofts.blog.service;

import com.lofts.blog.bean.User;
import com.lofts.blog.dao.UserDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Arrays;

@WebServlet("/EditUserInfoServlet")
public class EditUserInfoServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        PrintWriter out = response.getWriter();

        int id = ((User) request.getSession().getAttribute("user")).getId();
        String headimage = request.getParameter("imagepath");
        String username = request.getParameter("username");
        String nickname = request.getParameter("nickname");
        String sex = request.getParameter("sex");
        String birthday = request.getParameter("birthday");
        String constellation = request.getParameter("constellation");
        String[] hobby = request.getParameterValues("hobby");
        String email = request.getParameter("email");
        String address = request.getParameter("address");

        User user = new User();
        user.setId(id);
        user.setHeadimage(headimage);
        user.setUsername(username);
        user.setSex(sex);
        user.setNickname(nickname);
        user.setSex(sex);
        user.setBirthday(birthday);
        user.setConstellation(constellation);
        user.setHobby(getHobbyStr(hobby));
        user.setEmail(email);
        user.setAddress(address);

        UserDao dao = new UserDao();
        User result = dao.saveUserInfo(user);
        if (result != null) {
            request.getSession().setAttribute("user", result);
            request.getRequestDispatcher("dynamic/dynamiclist.jsp").forward(request, response);
        } else {
            request.getSession().setAttribute("loginresult", "修改失败");
            request.getRequestDispatcher("user/edituserinfo.jsp").forward(request, response);
        }
    }

    private String getHobbyStr(String[] hobbys) {
        StringBuilder builder = new StringBuilder();
        for (int i = 0; i < hobbys.length; i++) {
            builder.append(hobbys[i]);
            if (i != hobbys.length - 1) {
                builder.append(",");
            }
        }

        return builder.toString();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }


}
