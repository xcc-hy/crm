package com.study.workbench.service.impl;

import com.study.utils.UUIDUtil;
import com.study.workbench.dao.ActivityMapper;
import com.study.workbench.dao.ClueActivityRelationMapper;
import com.study.workbench.model.Activity;
import com.study.workbench.model.ActivityExample;
import com.study.workbench.model.ClueActivityRelation;
import com.study.workbench.service.ClueActivityRelationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class ClueActivityRelationServiceImpl implements ClueActivityRelationService {

    @Autowired
    private ClueActivityRelationMapper clueActivityRelationMapper;

    @Autowired
    private ActivityMapper activityMapper;

    @Override
    public List<Activity> queryActivityByClueId(String id) {
        return clueActivityRelationMapper.queryActivityByClueId(id);
    }

    @Override
    public boolean delete(String id) {
        int res = clueActivityRelationMapper.deleteByPrimaryKey(id);
        return res > 0;
    }

    @Override
    public List<Activity> queryUnRelationActivityByClueId(String id, String name) {
        List<String> aIds = clueActivityRelationMapper.queryActivityIdByClueId(id);
        ActivityExample example = new ActivityExample();
        ActivityExample.Criteria criteria = example.createCriteria();
        if (name != null && !"".equals(name)) {
            criteria.andNameLike("%" + name + "%");
        }
        if (aIds.size() > 0) {
            criteria.andIdNotIn(aIds);
        }
        return activityMapper.selectByExample(example);
    }

    @Override
    @Transactional
    public boolean create(String id, List<String> aIds) {
        if (aIds == null || aIds.size() == 0) {
            return false;
        }
        int res = clueActivityRelationMapper.countRelation(id, aIds);
        if (res == 0) {
            ClueActivityRelation clueActivityRelation = new ClueActivityRelation();
            clueActivityRelation.setClueid(id);
            for (String var : aIds) {
                clueActivityRelation.setActivityid(var);
                clueActivityRelation.setId(UUIDUtil.getUUID());
                clueActivityRelationMapper.insert(clueActivityRelation);
            }
            return true;
        }
        return false;
    }
}
