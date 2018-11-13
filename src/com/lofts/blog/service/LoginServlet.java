package com.lofts.blog.service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lofts.blog.bean.User;
import com.lofts.blog.dao.UserDao;

/**
 * 登录servlet
 *
 * @author Administrator
 */

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    public LoginServlet() {
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

        String username = req.getParameter("username");
        String password = req.getParameter("password");
        String inputcode = req.getParameter("verifycode");
        String inputcodeUpper = inputcode.toUpperCase();
        String sessionCode = (String) req.getSession().getAttribute("verifycode");

        if (!inputcodeUpper.equals(sessionCode)) {
            req.getSession().setAttribute("loginresult", "验证码错误");
            req.getRequestDispatcher("index.jsp").forward(req, resp);
        }

        UserDao dao = new UserDao();
        User user = dao.login(username, password);

        if (user != null) {
            req.getSession().setAttribute("id", user.getId());
            req.getSession().setAttribute("username", user.getUsername());
            req.getSession().setAttribute("password", user.getPassword());
            resp.sendRedirect("user/main.jsp");
        } else {
            req.getSession().setAttribute("loginresult", "用户名或密码错误");
            req.getRequestDispatcher("index.jsp").forward(req, resp);
        }
    }

}
