package com.study.workbench.service.impl;

import com.study.utils.DateTimeUtil;
import com.study.utils.UUIDUtil;
import com.study.workbench.dao.ClueRemarkMapper;
import com.study.workbench.model.ClueRemark;
import com.study.workbench.model.ClueRemarkExample;
import com.study.workbench.service.ClueRemarkService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ClueRemarkServiceImpl implements ClueRemarkService {
    @Autowired
    private ClueRemarkMapper clueRemarkMapper;

    @Override
    public List<ClueRemark> queryByClueId(String id) {
        ClueRemarkExample example = new ClueRemarkExample();
        example.setOrderByClause("createTime desc");
        ClueRemarkExample.Criteria criteria = example.createCriteria();
        criteria.andClueidEqualTo(id);
        return clueRemarkMapper.selectByExample(example);
    }

    @Override
    public boolean create(ClueRemark clueRemark) {
        clueRemark.setId(UUIDUtil.getUUID());
        clueRemark.setCreatetime(DateTimeUtil.getSysTime());
        clueRemark.setEditflag("0");
        return clueRemarkMapper.insertSelective(clueRemark) > 0;
    }

    @Override
    public boolean update(ClueRemark clueRemark) {
        clueRemark.setEdittime(DateTimeUtil.getSysTime());
        clueRemark.setEditflag("1");
        return clueRemarkMapper.updateByPrimaryKeySelective(clueRemark) > 0;
    }

    @Override
    public boolean delete(String id) {
        return clueRemarkMapper.deleteByPrimaryKey(id) > 0;
    }

    @Override
    public ClueRemark queryById(String id) {
        return clueRemarkMapper.selectByPrimaryKey(id);
    }
}
