package com.study.workbench.service;

import com.study.workbench.model.ClueRemark;

import java.util.List;

public interface ClueRemarkService {
    List<ClueRemark> queryByClueId(String id);

    boolean create(ClueRemark clueRemark);

    boolean update(ClueRemark clueRemark);

    boolean delete(String id);

    ClueRemark queryById(String id);
}
