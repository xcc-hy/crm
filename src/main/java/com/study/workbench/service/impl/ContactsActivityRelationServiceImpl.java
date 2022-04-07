package com.study.workbench.service.impl;

import com.study.utils.UUIDUtil;
import com.study.workbench.dao.ActivityMapper;
import com.study.workbench.dao.ContactsActivityRelationMapper;
import com.study.workbench.model.Activity;
import com.study.workbench.model.ActivityExample;
import com.study.workbench.model.ContactsActivityRelation;
import com.study.workbench.service.ContactsActivityRelationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ContactsActivityRelationServiceImpl implements ContactsActivityRelationService {
    @Autowired
    private ContactsActivityRelationMapper contactsActivityRelationMapper;
    @Autowired
    private ActivityMapper activityMapper;

    @Override
    public List<Activity> queryActivityByContactsId(String id) {
        return contactsActivityRelationMapper.queryActivityByContactsId(id);
    }

    @Override
    public boolean delete(String id) {
        return contactsActivityRelationMapper.deleteByPrimaryKey(id) > 0;
    }

    @Override
    public boolean create(String id, List<String> aIds) {
        if (aIds == null || aIds.size() == 0) {
            return false;
        }
        int res = contactsActivityRelationMapper.countRelation(id, aIds);
        if (res == 0) {
            ContactsActivityRelation contactsActivityRelation = new ContactsActivityRelation();
            contactsActivityRelation.setContactsid(id);
            for (String var : aIds) {
                contactsActivityRelation.setActivityid(var);
                contactsActivityRelation.setId(UUIDUtil.getUUID());
                contactsActivityRelationMapper.insert(contactsActivityRelation);
            }
            return true;
        }
        return false;
    }

    @Override
    public List<Activity> queryUnRelationActivityByContactsId(String id, String name) {
        List<String> aIds = contactsActivityRelationMapper.queryActivityIdByContactsId(id);
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
}
