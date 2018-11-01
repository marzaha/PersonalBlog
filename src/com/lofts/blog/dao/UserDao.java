package com.lofts.blog.dao;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.lofts.blog.bean.User;
import com.lofts.blog.utils.JdbcUtils;
import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;

/**
 * 用户表操作类
 * 
 * @author Administrator
 * 
 */
public class UserDao {

	public User login(String name, String password) {
		User user = null;
		Connection connection = null;
		PreparedStatement statement = null;
		ResultSet resultSet = null;
		try {
			connection = JdbcUtils.getConnection();
			String sql = "select * from user where name=? and password=?";
			statement = (PreparedStatement) connection.prepareStatement(sql);
			statement.setString(1, name);
			statement.setString(2, password);
			resultSet = statement.executeQuery();
			if (resultSet.next()) {
				user = new User();
				user.setName(resultSet.getString(name));
				user.setPassword(resultSet.getString(password));
				System.out.print("登录成功");
			} else {
				System.out.print("用户名或密码错误，请重试！");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JdbcUtils.close(statement, connection);
		}

		return user;
	}

	public void addUser(User user) {
		Connection connection = null;
		PreparedStatement statement = null;
		try {
			connection = JdbcUtils.getConnection();
			String sql = "insert into user(id,name,password,role) values (?,?,?,?);";
			statement = (PreparedStatement) connection.prepareStatement(sql);
			statement.setInt(1, user.getId());
			statement.setString(2, user.getName());
			statement.setString(3, user.getPassword());
			statement.setInt(4, user.getRole());
			statement.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JdbcUtils.close(statement, connection);
		}
	}

}
