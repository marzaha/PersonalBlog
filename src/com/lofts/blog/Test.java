package com.lofts.blog;

import com.lofts.blog.dao.CommonDao;

import java.util.List;

public class Test {

    public static void main(String[] args) {
        List<String> list = CommonDao.getHobbyList();

        System.out.print(list.toString());
    }
}
