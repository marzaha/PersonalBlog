package com.lofts.blog.service;

import com.lofts.blog.bean.Photo;
import com.lofts.blog.dao.PhotoDao;
import com.lofts.blog.utils.DateUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/UploadPhotoServlet")
public class UploadPhotoServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");

        response.setCharacterEncoding("utf-8");
        response.setContentType("text/html,charset=utf-8");

        int index = 0;
        String imagePath = null;
        String remark = null;
        PhotoDao dao = new PhotoDao();

        while (request.getParameter("imagepath" + index) != null && !request.getParameter("imagepath" + index).isEmpty()) {
            Photo photo = new Photo();
            imagePath = request.getParameter("imagepath" + index);
            remark = request.getParameter("remark" + index);

            photo.setImagepath(imagePath);
            photo.setRemark(remark == null || remark.isEmpty() ? "未命名" : remark);
            photo.setUploaddate(DateUtil.getCurrentDate());

            dao.addPhoto(photo);

            index++;
        }

        request.getRequestDispatcher("/photo/photogrid.jsp").forward(request, response);
    }

}
