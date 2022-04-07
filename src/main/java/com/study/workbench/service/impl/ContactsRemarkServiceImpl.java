package com.study.workbench.service.impl;

import com.study.utils.DateTimeUtil;
import com.study.utils.UUIDUtil;
import com.study.workbench.dao.ContactsRemarkMapper;
import com.study.workbench.model.ContactsRemark;
import com.study.workbench.model.ContactsRemarkExample;
import com.study.workbench.service.ContactsRemarkService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ContactsRemarkServiceImpl implements ContactsRemarkService {
    @Autowired
    private ContactsRemarkMapper contactsRemarkMapper;

    @Override
    public List<ContactsRemark> queryByContactsId(String id) {
        ContactsRemarkExample example = new ContactsRemarkExample();
        example.setOrderByClause("createTime desc");
        ContactsRemarkExample.Criteria criteria = example.createCriteria();
        criteria.andContactsidEqualTo(id);
        return contactsRemarkMapper.selectByExample(example);
    }

    @Override
    public boolean create(ContactsRemark contactsRemark) {
        contactsRemark.setId(UUIDUtil.getUUID());
        contactsRemark.setCreatetime(DateTimeUtil.getSysTime());
        contactsRemark.setEditflag("0");
        return contactsRemarkMapper.insertSelective(contactsRemark) > 0;
    }

    @Override
    public boolean update(ContactsRemark contactsRemark) {
        contactsRemark.setEdittime(DateTimeUtil.getSysTime());
        contactsRemark.setEditflag("1");
        return contactsRemarkMapper.updateByPrimaryKeySelective(contactsRemark) > 0;
    }

    @Override
    public boolean delete(String id) {
        return contactsRemarkMapper.deleteByPrimaryKey(id) > 0;
    }

    @Override
    public ContactsRemark queryById(String id) {
        return contactsRemarkMapper.selectByPrimaryKey(id);
    }
}
