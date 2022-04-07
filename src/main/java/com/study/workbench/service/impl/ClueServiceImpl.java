package com.study.workbench.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.study.utils.DateTimeUtil;
import com.study.utils.UUIDUtil;
import com.study.workbench.dao.*;
import com.study.workbench.model.*;
import com.study.workbench.service.ClueService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class ClueServiceImpl implements ClueService {

    @Autowired
    private ClueMapper clueMapper;

    @Autowired
    private ClueRemarkMapper clueRemarkMapper;

    @Autowired
    private ClueActivityRelationMapper clueActivityRelationMapper;

    @Autowired
    private CustomerMapper customerMapper;

    @Autowired
    private ContactsMapper contactsMapper;

    @Autowired
    private TranMapper tranMapper;

    @Autowired
    private TranHistoryMapper tranHistoryMapper;


    @Override
    public PageInfo<Clue> query(Clue clue, Integer pageNum, Integer pageSize) {
        if (pageNum == 0) {
            pageNum = 1;
        }
        PageHelper.startPage(pageNum, pageSize);
        ClueExample infoExample = new ClueExample();
        infoExample.setOrderByClause("createTime desc");
        ClueExample.Criteria criteria = infoExample.createCriteria();
        if (clue != null) {
            if (clue.getFullname() != null && ! "".equals(clue.getFullname())) {
                criteria.andFullnameLike("%" + clue.getFullname() + "%");
            }
            if (clue.getCompany() != null && ! "".equals(clue.getCompany())) {
                criteria.andCompanyEqualTo("%" + clue.getCompany() + "%");
            }
            if (clue.getPhone() != null && ! "".equals(clue.getPhone())) {
                criteria.andPhoneLike("%" + clue.getPhone() + "%");
            }
            if (clue.getMphone() != null && ! "".equals(clue.getMphone())) {
                criteria.andMphoneLike("%" + clue.getMphone() + "%");
            }
            if (clue.getOwner() != null && ! "".equals(clue.getOwner())) {
                criteria.andOwnerEqualTo(clue.getOwner());
            }
            if (clue.getSource() != null && ! "".equals(clue.getSource())) {
                criteria.andSourceEqualTo(clue.getSource());
            }
            if (clue.getState() != null && ! "".equals(clue.getState())) {
                criteria.andStateEqualTo(clue.getState());
            }
        }
        List<Clue> clues = clueMapper.selectByExample(infoExample);
        return new PageInfo<>(clues);
    }

    @Override
    public boolean create(Clue clue) {
        clue.setId(UUIDUtil.getUUID());
        clue.setCreatetime(DateTimeUtil.getSysTime());
        return clueMapper.insertSelective(clue) > 0;
    }

    @Override
    public boolean update(Clue clue) {
        clue.setEdittime(DateTimeUtil.getSysTime());
        return clueMapper.updateByPrimaryKeySelective(clue) > 0;
    }

    @Override
    @Transactional
    public boolean delete(List<String> ids) {
        ClueExample example = new ClueExample();
        example.createCriteria().andIdIn(ids);
        clueMapper.deleteByExample(example);
        ClueRemarkExample clueRemarkExample = new ClueRemarkExample();
        clueRemarkExample.createCriteria().andClueidIn(ids);
        clueRemarkMapper.deleteByExample(clueRemarkExample);
        ClueActivityRelationExample clueActivityRelationExample = new ClueActivityRelationExample();
        clueActivityRelationExample.createCriteria().andClueidIn(ids);
        clueActivityRelationMapper.deleteByExample(clueActivityRelationExample);
        return true;
    }

    @Override
    public Clue queryById(String id) {
        return clueMapper.selectByPrimaryKey(id);
    }

    @Override
    @Transactional
    public boolean saveConvert(String clueId, String createBy, Boolean hasTran, Tran tran) {
        Clue clue = clueMapper.selectByPrimaryKey(clueId);
        if (clue == null) {
            return false;
        }
        // 保存相应数据
        Customer customer = new Customer();
        customer.setId(UUIDUtil.getUUID());
        customer.setOwner(clue.getOwner());
        customer.setName(clue.getCompany());
        customer.setWebsite(clue.getWebsite());
        customer.setPhone(clue.getPhone());
        customer.setCreateby(createBy);
        customer.setCreatetime(DateTimeUtil.getSysTime());
        customer.setContactsummary(clue.getContactsummary());
        customer.setNextcontacttime(clue.getNextcontacttime());
        customer.setDescription(clue.getDescription());
        customer.setAddress(clue.getAddress());
        customerMapper.insertSelective(customer);
        Contacts contacts = new Contacts();
        contacts.setId(UUIDUtil.getUUID());
        contacts.setOwner(clue.getOwner());
        contacts.setSource(clue.getSource());
        contacts.setCustomerid(customer.getId());
        contacts.setFullname(clue.getFullname());
        contacts.setAppellation(clue.getAppellation());
        contacts.setEmail(clue.getEmail());
        contacts.setMphone(clue.getMphone());
        contacts.setJob(clue.getJob());
        contacts.setCreateby(createBy);
        contacts.setCreatetime(DateTimeUtil.getSysTime());
        contacts.setContactsummary(clue.getContactsummary());
        contacts.setNextcontacttime(clue.getNextcontacttime());
        contacts.setDescription(clue.getDescription());
        contacts.setAddress(clue.getAddress());
        contactsMapper.insertSelective(contacts);
        if (hasTran != null && tran != null && hasTran) {
            tran.setId(UUIDUtil.getUUID());
            tran.setOwner(clue.getOwner());
            tran.setCustomerid(customer.getId());
            tran.setContactsid(contacts.getId());
            tran.setCreateby(createBy);
            tran.setCreatetime(DateTimeUtil.getSysTime());
            tran.setContactsummary(clue.getContactsummary());
            tran.setNextcontacttime(clue.getNextcontacttime());
            tran.setDescription(clue.getDescription());
            tran.setSource(clue.getSource());
            tran.setStage(clue.getState());
            tranMapper.insertSelective(tran);
            TranHistory tranHistory = new TranHistory();
            tranHistory.setId(UUIDUtil.getUUID());
            tranHistory.setCreatetime(DateTimeUtil.getSysTime());
            tranHistory.setTranid(tran.getId());
            tranHistory.setExpecteddate(tran.getExpecteddate());
            tranHistory.setCreateby(tran.getCreateby());
            tranHistory.setMoney(tran.getMoney());
            tranHistory.setStage(tran.getStage());
            tranHistoryMapper.insertSelective(tranHistory);
        }
        // 删除线索相关数据
        clueMapper.deleteByPrimaryKey(clueId);
        ClueRemarkExample clueRemarkExample = new ClueRemarkExample();
        clueRemarkExample.createCriteria().andClueidEqualTo(clueId);
        clueRemarkMapper.deleteByExample(clueRemarkExample);
        ClueActivityRelationExample clueActivityRelationExample = new ClueActivityRelationExample();
        clueActivityRelationExample.createCriteria().andClueidEqualTo(clueId);
        clueActivityRelationMapper.deleteByExample(clueActivityRelationExample);
        return true;
    }


}
