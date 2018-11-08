package com.lofts.blog;

import com.lofts.blog.dao.CommonDataDao;

import java.util.List;

public class Test {

    public static void main(String[] args) {
        List<String> list = CommonDataDao.getHobbyList();

        System.out.print(list.toString());
    }
}
