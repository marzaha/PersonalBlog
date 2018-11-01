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
		// TODO Auto-generated constructor stub
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		resp.setContentType("text/html;charset=utf-8");

		int id = Integer.valueOf(req.getParameter("id"));
		String name = req.getParameter("username");
		String password = req.getParameter("password");
		int role = Integer.valueOf(req.getParameter("role"));
		
		User user=new User();
        user.setId(id);
        user.setName(name);
        user.setPassword(password);
        user.setRole(role);
        UserDao userDAO=new UserDao(); 
        userDAO.addUser(user);
        
        System.out.println("注册成功");
        req.getRequestDispatcher("login.jsp").forward(req, resp);

	}

}
