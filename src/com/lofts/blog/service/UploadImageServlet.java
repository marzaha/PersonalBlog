package com.lofts.blog.service;

import com.alibaba.fastjson.JSON;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

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
import java.io.PrintWriter;
import java.util.*;

/**
 * 图片上传
 */

@WebServlet("/UploadImageServlet")
public class UploadImageServlet extends HttpServlet {

    private static final String IMAGE_UPLOAD_DIR = "upload/image/";

    private static final String TEMP_UPLOAD_DIR = "upload/temp/";

    private static final Long TOTAL_FILE_MAXSIZE = 10000000L;

    private static final int SINGLE_FILE_MAXSIZE = 2 * 1024 * 1024;


    protected void doGet(HttpServletRequest request, HttpServletResponse response) {
        doGet(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("application/json;charset=UTF-8");

        ServletContext context = getServletConfig().getServletContext();
        PrintWriter out = response.getWriter();

        String realPath = context.getRealPath(IMAGE_UPLOAD_DIR) + "/";
        String tempPath = context.getRealPath(TEMP_UPLOAD_DIR) + "/";
        File realPathFile = new File(realPath);
        File tempPathFile = new File(tempPath);
        if (!realPathFile.exists()) {
            realPathFile.mkdirs();
        }
        if (!tempPathFile.exists()) {
            tempPathFile.mkdirs();
        }
        // 文件对象的工厂类
        DiskFileItemFactory factory = new DiskFileItemFactory();
        // 设置最大上传大小
        factory.setSizeThreshold(SINGLE_FILE_MAXSIZE);
        // 将临时文件夹交给文件对象的工厂类
        factory.setRepository(tempPathFile);
        // 创建一个上传文件的处理者
        ServletFileUpload upload = new ServletFileUpload(factory);
        // 设置所有请求的总大小
        upload.setSizeMax(TOTAL_FILE_MAXSIZE);
        // 解析request
        List<FileItem> items;

        try {
            items = upload.parseRequest(request);
            Iterator<FileItem> iterator = items.iterator();
            List<Map<String, String>> imageList = new ArrayList<>();
            while (iterator.hasNext()) {
                FileItem item = iterator.next();
                String fileName = UUID.randomUUID() + ".jpg";
                if (!item.isFormField()) {
                    try {
                        item.write(new File(realPath + fileName));

                        Map<String, String> map = new HashMap<>();
                        map.put("imagepath", IMAGE_UPLOAD_DIR + fileName);
                        imageList.add(map);
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                }
            }
            out.print(JSON.toJSONString(imageList));
        } catch (FileUploadException e) {
            out.print("上传失败");
        }
        out.close();
        out.flush();

    }


}
