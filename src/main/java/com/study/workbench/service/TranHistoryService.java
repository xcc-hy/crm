package com.study.workbench.service;

import com.study.workbench.model.TranHistory;

import java.util.List;

public interface TranHistoryService {
    List<TranHistory> queryByTranId(String id);
}
