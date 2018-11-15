package com.lofts.blog.service;

import com.lofts.blog.bean.Diary;
import com.lofts.blog.dao.DiaryDao;
import com.lofts.blog.utils.DateUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/AddDiaryServlet")
public class AddDiaryServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset-utf-8");

        String title = request.getParameter("title");
        String type = request.getParameter("type");
        String content = request.getParameter("content");

        Diary diary = new Diary();
        diary.setTitle(title);
        diary.setType(type);
        diary.setContent(content);
        diary.setCreatedate(DateUtil.getCurrentDate());

        DiaryDao dao = new DiaryDao();
        dao.addDiary(diary);

        request.getRequestDispatcher("/diary/diarylist.jsp").forward(request, response);

    }


}
