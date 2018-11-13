package com.lofts.blog.dao;

import com.lofts.blog.bean.City;
import com.lofts.blog.bean.County;
import com.lofts.blog.bean.Province;
import com.lofts.blog.utils.JdbcUtils;
import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CityDao {

    /**
     * 获取省级列表
     *
     * @return
     */
    public static List<Province> getProvinceList() {
        List<Province> list = new ArrayList<>();
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        try {
            connection = JdbcUtils.getConnection();
            String sql = "select * from province";
            statement = (PreparedStatement) connection.prepareStatement(sql);
            resultSet = statement.executeQuery();
            while (resultSet.next()) {
                Province province = new Province();
                province.setId(resultSet.getInt("id"));
                province.setProvince(resultSet.getString("province"));
                province.setProvinceid(resultSet.getString("provinceid"));
                list.add(province);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            JdbcUtils.close(statement, connection);
        }
        return list;
    }


    /**
     * 根据省级ID获取城市列表
     *
     * @param provinceid
     * @return
     */
    public static List<City> getCityListById(String provinceid) {
        List<City> list = new ArrayList<>();
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        try {
            connection = JdbcUtils.getConnection();
            String sql = "select * from city where provinceid=?";
            statement = (PreparedStatement) connection.prepareStatement(sql);
            statement.setString(1, provinceid);
            resultSet = statement.executeQuery();
            while (resultSet.next()) {
                City city = new City();
                city.setId(resultSet.getInt("id"));
                city.setCity(resultSet.getString("city"));
                city.setCityid(resultSet.getString("cityid"));
                city.setProvinceid(resultSet.getString("provinceid"));
                list.add(city);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            JdbcUtils.close(statement, connection);
        }
        return list;
    }


    /**
     * 根据城市列表获取县区列表
     * @param cityid
     * @return
     */
    public static List<County> getCountyListById(String cityid) {
        List<County> list = new ArrayList<>();
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        try {
            connection = JdbcUtils.getConnection();
            String sql = "select * from county where cityid=?";
            statement = (PreparedStatement) connection.prepareStatement(sql);
            statement.setString(1, cityid);
            resultSet = statement.executeQuery();
            while (resultSet.next()) {
                County county = new County();
                county.setId(resultSet.getInt("id"));
                county.setCounty(resultSet.getString("county"));
                county.setCountyid(resultSet.getString("countyid"));
                county.setCityid(resultSet.getString("cityid"));
                list.add(county);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            JdbcUtils.close(statement, connection);
        }
        return list;
    }

}
