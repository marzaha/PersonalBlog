package com.lofts.blog.utils;

import java.io.IOException;
import java.io.InputStream;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;
import com.mysql.jdbc.ResultSet;
import com.mysql.jdbc.Statement;

/**
 * 数据库连接辅助类
 * 
 * @author Administrator
 * 
 */

public class JdbcUtils {

	private static String url = null;

	private static String user = null;

	private static String password = null;

	private static String driver = null;

	static {
		Properties prop = new Properties();
		InputStream in = JdbcUtils.class
				.getResourceAsStream("/dataSource.properties");

		try {
			prop.load(in);

			url = prop.getProperty("url");
			user = prop.getProperty("user");
			password = prop.getProperty("password");
			driver = prop.getProperty("driver");

			// 注册驱动
			try {
				Class.forName(driver);
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public static Connection getConnection() throws SQLException {
		Connection conn = null;
		conn = (Connection) DriverManager.getConnection(url, user, password);
		return conn;
	}

	public static void close(Statement statement, Connection conn) {
		if (statement != null) {
			try {
				statement.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		if (conn != null) {
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

	/**
	 * 关闭数据库连接
	 * 
	 * @param statement
	 * @param conn
	 * @param resultSet
	 */
	public static void close(PreparedStatement statement, Connection conn,
			ResultSet resultSet) {
		if (statement != null) {
			try {
				statement.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		if (conn != null) {
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		if (resultSet != null) {
			try {
				resultSet.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

}
