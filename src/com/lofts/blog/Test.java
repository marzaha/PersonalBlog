package com.lofts.blog;

import com.lofts.blog.bean.Diary;
import com.lofts.blog.dao.CommonDao;
import com.lofts.blog.dao.DiaryDao;

import java.util.List;

public class Test {

    public static void main(String[] args) {
        DiaryDao dao = new DiaryDao();
        Diary diary = dao.queryDiarybyId("1");

        System.out.print(diary.getTitle());
    }
}
