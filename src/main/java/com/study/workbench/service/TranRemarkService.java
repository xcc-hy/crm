package com.study.workbench.service;

import com.study.workbench.model.TranRemark;

import java.util.List;

public interface TranRemarkService {
    List<TranRemark> queryByTranId(String id);

    boolean delete(String id);

    boolean update(TranRemark tranRemark);

    boolean create(TranRemark tranRemark);
}
