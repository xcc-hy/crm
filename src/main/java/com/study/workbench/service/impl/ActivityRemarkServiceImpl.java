package com.study.workbench.service.impl;

import com.study.utils.DateTimeUtil;
import com.study.utils.UUIDUtil;
import com.study.workbench.dao.ActivityRemarkMapper;
import com.study.workbench.model.ActivityRemark;
import com.study.workbench.model.ActivityRemarkExample;
import com.study.workbench.service.ActivityRemarkService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ActivityRemarkServiceImpl implements ActivityRemarkService {
    @Autowired
    private ActivityRemarkMapper activityRemarkMapper;

    @Override
    public List<ActivityRemark> queryByActivityId(String id) {
        ActivityRemarkExample example = new ActivityRemarkExample();
        example.setOrderByClause("createTime desc");
        ActivityRemarkExample.Criteria criteria = example.createCriteria();
        criteria.andActivityidEqualTo(id);
        return activityRemarkMapper.selectByExample(example);
    }

    @Override
    public boolean create(ActivityRemark activityRemark) {
        activityRemark.setId(UUIDUtil.getUUID());
        activityRemark.setCreatetime(DateTimeUtil.getSysTime());
        activityRemark.setEditflag("0");
        return activityRemarkMapper.insertSelective(activityRemark) > 0;
    }

    @Override
    public boolean update(ActivityRemark activityRemark) {
        activityRemark.setEdittime(DateTimeUtil.getSysTime());
        activityRemark.setEditflag("1");
        return activityRemarkMapper.updateByPrimaryKeySelective(activityRemark) > 0;
    }

    @Override
    public boolean delete(String id) {
        return activityRemarkMapper.deleteByPrimaryKey(id) > 0;
    }

    @Override
    public ActivityRemark queryById(String id) {
        return activityRemarkMapper.selectByPrimaryKey(id);
    }
}
