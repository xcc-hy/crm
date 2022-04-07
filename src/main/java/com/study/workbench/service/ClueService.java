package com.study.workbench.service;

import com.github.pagehelper.PageInfo;
import com.study.workbench.model.Clue;
import com.study.workbench.model.Tran;

import java.util.List;

public interface ClueService {
    PageInfo<Clue> query(Clue clue, Integer pageNum, Integer pageSize);

    boolean create(Clue clue);

    boolean update(Clue clue);

    boolean delete(List<String> vars);

    Clue queryById(String id);


    boolean saveConvert(String clueId, String createBy, Boolean hasTran, Tran tran);
}
