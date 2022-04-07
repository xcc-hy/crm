package com.study.workbench.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.study.utils.DateTimeUtil;
import com.study.utils.UUIDUtil;
import com.study.workbench.dao.ContactsMapper;
import com.study.workbench.dao.ContactsRemarkMapper;
import com.study.workbench.dao.CustomerMapper;
import com.study.workbench.model.Contacts;
import com.study.workbench.model.ContactsExample;
import com.study.workbench.model.ContactsRemarkExample;
import com.study.workbench.service.ContactsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class ContactsServiceImpl implements ContactsService {
    @Autowired
    private ContactsMapper contactsMapper;

    @Autowired
    private CustomerMapper customerMapper;

    @Autowired
    private ContactsRemarkMapper contactsRemarkMapper;


    @Override
    public List<Contacts> queryByCustomerId(String id) {
        ContactsExample example = new ContactsExample();
        example.createCriteria().andCustomeridEqualTo(id);
        List<Contacts> contactsList = contactsMapper.selectByExample(example);
        contactsList.forEach(var -> {
            if (var.getCustomerid() != null && !"".equals(var.getCustomerid())) {
                var.setCustomerid(customerMapper.queryNameById(var.getCustomerid()));
            }
        });
        return contactsList;
    }

    @Override
    public PageInfo<Contacts> query(Contacts contacts, Integer pageNum, Integer pageSize) {
        if (pageNum == 0) {
            pageNum = 1;
        }
        ContactsExample infoExample = new ContactsExample();
        infoExample.setOrderByClause("createTime desc");
        ContactsExample.Criteria criteria = infoExample.createCriteria();
        if (contacts != null) {
            if (contacts.getFullname() != null && ! "".equals(contacts.getFullname())) {
                criteria.andFullnameLike("%" + contacts.getFullname() + "%");
            }
            if (contacts.getOwner() != null && ! "".equals(contacts.getOwner())) {
                criteria.andOwnerEqualTo(contacts.getOwner());
            }
            if (contacts.getBirth() != null && ! "".equals(contacts.getBirth())) {
                criteria.andBirthEqualTo(contacts.getBirth());
            }
            if (contacts.getSource() != null && ! "".equals(contacts.getSource())) {
                criteria.andSourceEqualTo(contacts.getSource());
            }
            if (contacts.getCustomerid() != null && ! "".equals(contacts.getCustomerid())) {
                List<String> ids = customerMapper.queryIdsByName(contacts.getCustomerid());
                if (ids != null && ids.size() > 0) {
                    criteria.andCustomeridIn(ids);
                }
            }
        }
        PageHelper.startPage(pageNum, pageSize);
        List<Contacts> contactss = contactsMapper.selectByExample(infoExample);
        for (Contacts var :contactss) {
            if (var.getCustomerid() != null && !"".equals(var.getCustomerid())) {
                var.setCustomerid(customerMapper.queryNameById(var.getCustomerid()));
            }
        }
        return new PageInfo<>(contactss);
    }

    @Override
    public boolean create(Contacts contacts) {
        List<String> ids = customerMapper.queryIdByName(contacts.getCustomerid());
        if (ids == null || ids.size() != 1) {
            return false;
        }
        contacts.setCustomerid(ids.get(0));
        contacts.setCreatetime(DateTimeUtil.getSysTime());
        contacts.setId(UUIDUtil.getUUID());
        return contactsMapper.insertSelective(contacts) > 0;
    }

    @Override
    public boolean update(Contacts contacts) {
        List<String> ids = customerMapper.queryIdByName(contacts.getCustomerid());
        if (ids == null || ids.size() != 1) {
            return false;
        }
        contacts.setCustomerid(ids.get(0));
        contacts.setEdittime(DateTimeUtil.getSysTime());
        return contactsMapper.updateByPrimaryKeySelective(contacts) > 0;
    }

    @Override
    public Contacts queryById(String id) {
        Contacts contacts = contactsMapper.selectByPrimaryKey(id);
        if (contacts.getCustomerid() != null && !"".equals(contacts.getCustomerid())) {
            contacts.setCustomerid(customerMapper.queryNameById(contacts.getCustomerid()));
        }
        return contacts;
    }

    @Override
    @Transactional
    public boolean delete(List<String> ids) {
        ContactsExample example = new ContactsExample();
        example.createCriteria().andIdIn(ids);
        contactsMapper.deleteByExample(example);
        ContactsRemarkExample contactsRemarkExample = new ContactsRemarkExample();
        contactsRemarkExample.createCriteria().andContactsidIn(ids);
        contactsRemarkMapper.deleteByExample(contactsRemarkExample);
        return true;
    }

    @Override
    public List<Contacts> queryByName(String name) {
        return contactsMapper.queryByName(name);
    }
}
