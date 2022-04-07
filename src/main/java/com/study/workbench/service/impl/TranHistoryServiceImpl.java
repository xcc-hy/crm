package com.study.workbench.service.impl;

import com.study.workbench.dao.TranHistoryMapper;
import com.study.workbench.model.TranHistory;
import com.study.workbench.model.TranHistoryExample;
import com.study.workbench.service.TranHistoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TranHistoryServiceImpl implements TranHistoryService {
    @Autowired
    private TranHistoryMapper tranHistoryMapper;

    @Override
    public List<TranHistory> queryByTranId(String id) {
        TranHistoryExample example = new TranHistoryExample();
        example.setOrderByClause("createTime asc");
        example.createCriteria().andTranidEqualTo(id);
        return tranHistoryMapper.selectByExample(example);
    }
}
