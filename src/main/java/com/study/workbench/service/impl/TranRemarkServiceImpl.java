package com.study.workbench.service.impl;

import com.study.utils.DateTimeUtil;
import com.study.utils.UUIDUtil;
import com.study.workbench.dao.TranRemarkMapper;
import com.study.workbench.model.TranRemark;
import com.study.workbench.model.TranRemarkExample;
import com.study.workbench.service.TranRemarkService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TranRemarkServiceImpl implements TranRemarkService {
    @Autowired
    private TranRemarkMapper tranRemarkMapper;

    @Override
    public List<TranRemark> queryByTranId(String id) {
        TranRemarkExample example = new TranRemarkExample();
        example.setOrderByClause("createTime desc");
        example.createCriteria().andTranidEqualTo(id);
        return tranRemarkMapper.selectByExample(example);
    }

    @Override
    public boolean create(TranRemark tranRemark) {
        tranRemark.setId(UUIDUtil.getUUID());
        tranRemark.setCreatetime(DateTimeUtil.getSysTime());
        tranRemark.setEditflag("0");
        return tranRemarkMapper.insertSelective(tranRemark) > 0;
    }

    @Override
    public boolean update(TranRemark tranRemark) {
        tranRemark.setEdittime(DateTimeUtil.getSysTime());
        tranRemark.setEditflag("1");
        return tranRemarkMapper.updateByPrimaryKeySelective(tranRemark) > 0;
    }

    @Override
    public boolean delete(String id) {
        return tranRemarkMapper.deleteByPrimaryKey(id) > 0;
    }
}
