package com.lofts.blog.service;

import com.alibaba.fastjson.JSON;
import com.lofts.blog.bean.City;
import com.lofts.blog.bean.County;
import com.lofts.blog.bean.Province;
import com.lofts.blog.dao.CityDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet("/CityServlet")
public class CityServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        response.setContentType("application/json;charset=utf-8");
        PrintWriter out = response.getWriter();

        String type = request.getParameter("type");
        String lastId = request.getParameter("lastId");
        if ("province".equals(type)) {
            List<Province> provinceList = CityDao.getProvinceList();
            out.print(JSON.toJSONString(provinceList));
        } else if ("city".equals(type)) {
            List<City> cityList = CityDao.getCityListById(lastId);
            out.print(JSON.toJSONString(cityList));
        } else if ("county".equals(type)) {
            List<County> countyList = CityDao.getCountyListById(lastId);
            out.print(JSON.toJSONString(countyList));
        } else {
            out.print("数据为空");
        }

        out.close();
        out.flush();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
