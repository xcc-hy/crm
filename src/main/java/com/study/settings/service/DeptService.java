package com.study.settings.service;

import com.github.pagehelper.PageInfo;
import com.study.settings.model.Dept;

import java.util.List;

public interface DeptService {
    PageInfo<Dept> query(Integer pageSize, Integer pageNum);
    Dept queryById(String id);
    List<Dept> queryAll();
    boolean create(Dept dept);
    boolean update(Dept dept);
    boolean delete(List<String> id);
}
