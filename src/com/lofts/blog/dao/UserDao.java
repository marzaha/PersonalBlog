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
 */
public class UserDao {

    /**
     * 用户登录
     *
     * @param name
     * @param password
     * @return
     */
    public User login(String name, String password) {
        User user = null;
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        try {
            connection = JdbcUtils.getConnection();
            String sql = "select * from user where username=? and password=?";
            statement = (PreparedStatement) connection.prepareStatement(sql);
            statement.setString(1, name);
            statement.setString(2, password);
            resultSet = statement.executeQuery();
            if (resultSet.next()) {
                user = new User();
                user.setUsername(resultSet.getString("username"));
                user.setPassword(resultSet.getString("password"));
                System.out.print("登录成功");
            } else {
                System.out.print("用户名或密码错误，请重试！");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            JdbcUtils.close(statement, connection);
        }

        return user;
    }

    /**
     * 用户注册
     *
     * @param user
     */
    public void register(User user) {
        Connection connection = null;
        PreparedStatement statement = null;
        try {
            connection = JdbcUtils.getConnection();
            String sql = "insert into user(username,password,registerdate) values (?,?,?);";
            statement = (PreparedStatement) connection.prepareStatement(sql);
            statement.setString(1, user.getUsername());
            statement.setString(2, user.getPassword());
            statement.setString(3, user.getRegisterdate());
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            JdbcUtils.close(statement, connection);
        }
    }

    /**
     * 用户名查询
     *
     * @param userName
     * @return
     */
    public String queryUser(String userName) {
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        try {
            connection = JdbcUtils.getConnection();
            String sql = "select * from user where username=?";
            statement = (PreparedStatement) connection.prepareStatement(sql);
            statement.setString(1, userName);
            resultSet = statement.executeQuery();
            if (resultSet.next()) {
                System.out.print("该用户名已注册");
                return userName;
            } else {
                System.out.print("该用户可用");
                return "";
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            JdbcUtils.close(statement, connection);
        }
        System.out.print("用户注册异常");
        return "";
    }


}
