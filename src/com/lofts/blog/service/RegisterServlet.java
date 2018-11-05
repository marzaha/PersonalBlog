package com.lofts.blog.service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lofts.blog.bean.User;
import com.lofts.blog.dao.UserDao;

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    public RegisterServlet() {
        super();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        resp.setContentType("text/html;charset=utf-8");

        String name = req.getParameter("username");
        String password = req.getParameter("password");
        String inputcode = req.getParameter("verifycode");
        String inputcodeUpper = inputcode.toUpperCase();
        String sessionCode = (String) req.getSession().getAttribute("verifycode");

        if (!inputcodeUpper.equals(sessionCode)) {
            req.getSession().setAttribute("registerresult", "验证码错误");
            req.getRequestDispatcher("/login/register.jsp").forward(req, resp);
            return;
        }

        UserDao userDAO = new UserDao();
        String result = userDAO.queryUser(name);
        if (result != null && !result.isEmpty()) {
            req.getSession().setAttribute("registerresult", "该用户名已被注册");
            req.getRequestDispatcher("/login/register.jsp").forward(req, resp);
            return;
        }

        User user = new User();
        user.setName(name);
        user.setPassword(password);
        userDAO.register(user);

        req.getSession().setAttribute("registerresult", "");
        req.getRequestDispatcher("/index.jsp").forward(req, resp);
        System.out.println("注册成功");
    }

}
