package com.lofts.blog.dao;

import com.lofts.blog.bean.Diary;
import com.lofts.blog.bean.Photo;
import com.lofts.blog.utils.JdbcUtils;
import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class PhotoDao {

    public void addPhoto(Photo photo) {
        Connection connection = null;
        PreparedStatement statement = null;
        try {
            connection = JdbcUtils.getConnection();
            String sql = "insert into photo(imagepath,remark,uploaddate) values (?,?,?);";
            statement = (PreparedStatement) connection.prepareStatement(sql);
            statement.setString(1, photo.getImagepath());
            statement.setString(2, photo.getRemark());
            statement.setString(3, photo.getUploaddate());
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            JdbcUtils.close(statement, connection);
        }
    }

    public List<Photo> queryAllPhoto() {
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        List<Photo> list = new ArrayList<>();
        try {
            connection = JdbcUtils.getConnection();
            String sql = "select * from photo";
            statement = (PreparedStatement) connection.prepareStatement(sql);
            resultSet = statement.executeQuery();
            while (resultSet.next()) {
                Photo photo = new Photo();
                photo.setId(resultSet.getInt("id"));
                photo.setImagepath(resultSet.getString("imagepath"));
                photo.setRemark(resultSet.getString("remark"));

                list.add(photo);
            }
            return list;
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            JdbcUtils.close(statement, connection);
        }
        return list;
    }


}
