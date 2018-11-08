package com.lofts.blog.service;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletInputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.UUID;

/**
 * 图片上传
 */

@WebServlet("/LoginServlet")
public class UploadImageServlet extends HttpServlet {

    private static final String IMAGE_SAVE_PATH = "upload/image/";

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=utf-8");

        ServletContext context = getServletConfig().getServletContext();
        String fileName = UUID.randomUUID() + ".jpeg";
        String realPath = context.getRealPath(IMAGE_SAVE_PATH) + "/";
        String filePath = realPath + fileName;

        File fileDir = new File(realPath);
        if (!fileDir.exists()) {
            fileDir.mkdir();
        }
        FileOutputStream out = new FileOutputStream(new File(fileName));
        ServletInputStream inputStream = request.getInputStream();
        byte[] b = new byte[1024];
        int len = 0;
        while ((len = inputStream.read(b)) != -1) {
            out.write(b, 0, len);
        }

        out.close();
        inputStream.close();

        try {
            request.setAttribute("path", IMAGE_SAVE_PATH + fileName);
            request.getRequestDispatcher("/user/edituserinfo.jsp").forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        }

    }

}
