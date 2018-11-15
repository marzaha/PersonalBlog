package com.lofts.blog.dao;

import com.lofts.blog.bean.Diary;
import com.lofts.blog.utils.JdbcUtils;
import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class DiaryDao {

    public void addDiary(Diary diary) {
        Connection connection = null;
        PreparedStatement statement = null;
        try {
            connection = JdbcUtils.getConnection();
            String sql = "insert into diary(title,type,content,createdate) values (?,?,?,?);";
            statement = (PreparedStatement) connection.prepareStatement(sql);
            statement.setString(1, diary.getTitle());
            statement.setString(2, diary.getType());
            statement.setString(3, diary.getContent());
            statement.setString(4, diary.getCreatedate());
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            JdbcUtils.close(statement, connection);
        }
    }

    public List<Diary> queryAllDiary() {
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        List<Diary> list = new ArrayList<>();
        try {
            connection = JdbcUtils.getConnection();
            String sql = "select * from diary";
            statement = (PreparedStatement) connection.prepareStatement(sql);
            resultSet = statement.executeQuery();
            while (resultSet.next()) {
                Diary diary = new Diary();
                diary.setId(resultSet.getInt("id"));
                diary.setTitle(resultSet.getString("title"));
                diary.setType(resultSet.getString("type"));
                diary.setCreatedate(resultSet.getString("createdate"));

                list.add(diary);
            }
            return list;
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            JdbcUtils.close(statement, connection);
        }
        return list;
    }

    public Diary queryDiarybyId(String id) {
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        Diary diary = null;
        try {
            connection = JdbcUtils.getConnection();
            String sql = "select * from diary where id=?";
            statement = (PreparedStatement) connection.prepareStatement(sql);
            statement.setString(1, id);
            resultSet = statement.executeQuery();
            if (resultSet.next()) {
                diary = new Diary();
                diary.setId(resultSet.getInt("id"));
                diary.setTitle(resultSet.getString("title"));
                diary.setType(resultSet.getString("type"));
                diary.setContent(resultSet.getString("content"));
                diary.setCreatedate(resultSet.getString("createdate"));
            }
            return diary;
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            JdbcUtils.close(statement, connection);
        }
        return diary;
    }

}
