package com.study.settings.service;

import com.study.settings.model.DicValue;

import java.util.List;

public interface DicValueService {
    List<DicValue> queryAll();

    DicValue queryById(String id);

    boolean create(DicValue dicValue);

    boolean update(DicValue dicValue);

    boolean delete(List<String> vars);
}
