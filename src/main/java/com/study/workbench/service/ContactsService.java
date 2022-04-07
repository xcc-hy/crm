package com.study.workbench.service;

import com.github.pagehelper.PageInfo;
import com.study.workbench.model.Contacts;

import java.util.List;

public interface ContactsService {
    List<Contacts> queryByCustomerId(String id);

    PageInfo<Contacts> query(Contacts contacts, Integer pageNum, Integer pageSize);

    boolean create(Contacts contacts);

    boolean update(Contacts contacts);

    Contacts queryById(String id);

    boolean delete(List<String> ids);

    List<Contacts> queryByName(String name);
}
