package com.study.workbench.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.study.utils.DateTimeUtil;
import com.study.utils.UUIDUtil;
import com.study.workbench.dao.ActivityMapper;
import com.study.workbench.dao.ActivityRemarkMapper;
import com.study.workbench.dao.ClueActivityRelationMapper;
import com.study.workbench.dao.ContactsActivityRelationMapper;
import com.study.workbench.model.*;
import com.study.workbench.service.ActivityService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

@Service
public class ActivityServiceImpl implements ActivityService {
    @Autowired
    private ActivityMapper activityMapper;

    @Autowired
    private ActivityRemarkMapper activityRemarkMapper;

    @Autowired
    private ClueActivityRelationMapper clueActivityRelationMapper;

    @Autowired
    private ContactsActivityRelationMapper contactsActivityRelationMapper;

    @Override
    public Activity queryById(String id) {
        return activityMapper.selectByPrimaryKey(id);
    }

    @Override
    public PageInfo<Activity> query(Activity activity, Integer pageNum, Integer pageSize) {
        if (pageNum == 0) {
            pageNum = 1;
        }
        PageHelper.startPage(pageNum, pageSize);
        List<Activity> activities = activityMapper.query(activity);
        return new PageInfo<>(activities);
    }

    @Override
    public boolean create(Activity activity) {
        activity.setCreatetime(DateTimeUtil.getSysTime());
        activity.setId(UUIDUtil.getUUID());
        int res = activityMapper.insertSelective(activity);
        return res > 0;
    }

    @Override
    public boolean update(Activity activity) {
        activity.setEdittime(DateTimeUtil.getSysTime());
        int res = activityMapper.updateByPrimaryKeySelective(activity);
        return res > 0;
    }

    @Override
    @Transactional
    public boolean delete(List<String> ids) {
        ActivityExample example = new ActivityExample();
        example.createCriteria().andIdIn(ids);
        activityMapper.deleteByExample(example);
        // 删除所有相关联的数据
        ActivityRemarkExample activityRemarkExample = new ActivityRemarkExample();
        activityRemarkExample.createCriteria().andActivityidIn(ids);
        activityRemarkMapper.deleteByExample(activityRemarkExample);
        ClueActivityRelationExample clueActivityRelationExample = new ClueActivityRelationExample();
        clueActivityRelationExample.createCriteria().andActivityidIn(ids);
        clueActivityRelationMapper.deleteByExample(clueActivityRelationExample);
        ContactsActivityRelationExample contactsActivityRelationExample = new ContactsActivityRelationExample();
        contactsActivityRelationExample.createCriteria().andActivityidIn(ids);
        contactsActivityRelationMapper.deleteByExample(contactsActivityRelationExample);
        return true;
    }

    @Override
    public List<Activity> queryByName(String name) {
        Activity activity = new Activity();
        activity.setName(name);
        return activityMapper.query(activity);
    }

    @Override
    public List<Activity> queryByIds(String[] ids) {
        return activityMapper.queryByIds(Arrays.stream(ids).collect(Collectors.toList()));
    }
}
