package com.study.workbench.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.study.settings.model.DicValue;
import com.study.utils.DateTimeUtil;
import com.study.utils.UUIDUtil;
import com.study.vo.ChartVo;
import com.study.workbench.dao.*;
import com.study.workbench.model.*;
import com.study.workbench.service.TranService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Service
public class TranServiceImpl implements TranService {
    @Autowired
    private TranMapper tranMapper;

    @Autowired
    private TranRemarkMapper tranRemarkMapper;

    @Autowired
    private CustomerMapper customerMapper;

    @Autowired
    private ContactsMapper contactsMapper;

    @Autowired
    private TranHistoryMapper tranHistoryMapper;

    @Autowired
    private ActivityMapper activityMapper;

    @Override
    public List<Tran> queryByCustomerId(String id) {
        TranExample example = new TranExample();
        TranExample.Criteria criteria = example.createCriteria();
        criteria.andCustomeridEqualTo(id);
        return tranMapper.selectByExample(example);
    }

    @Override
    public List<Tran> queryByContactsId(String id) {
        TranExample example = new TranExample();
        TranExample.Criteria criteria = example.createCriteria();
        criteria.andContactsidEqualTo(id);
        return tranMapper.selectByExample(example);
    }

    @Override
    public PageInfo<Tran> query(Tran tran, Integer pageNum, Integer pageSize) {
        if (pageNum == 0) {
            pageNum = 1;
        }
        PageHelper.startPage(pageNum, pageSize);
        TranExample infoExample = new TranExample();
        infoExample.setOrderByClause("createTime desc");
        TranExample.Criteria criteria = infoExample.createCriteria();
        if (tran != null) {
            if (tran.getOwner() != null && ! "".equals(tran.getOwner())) {
                criteria.andOwnerEqualTo(tran.getOwner());
            }
            if (tran.getSource() != null && ! "".equals(tran.getSource())) {
                criteria.andSourceEqualTo(tran.getSource());
            }
            if (tran.getType() != null && ! "".equals(tran.getType())) {
                criteria.andTypeEqualTo(tran.getType());
            }
            if (tran.getStage() != null && ! "".equals(tran.getStage())) {
                criteria.andStageEqualTo(tran.getStage());
            }
            if (tran.getName() != null && ! "".equals(tran.getName())) {
                criteria.andNameLike("%" + tran.getName() + "%");
            }
            if (tran.getCustomerid() != null && ! "".equals(tran.getCustomerid())) {
                List<String> ids = customerMapper.queryIdsByName(tran.getCustomerid());
                if (ids != null && ids.size() > 0) {
                    criteria.andCustomeridIn(ids);
                }
            }
            if (tran.getContactsid() != null && ! "".equals(tran.getContactsid())) {
                List<String> ids = contactsMapper.queryIdsByName(tran.getContactsid());
                if (ids != null && ids.size() > 0) {
                    criteria.andContactsidIn(ids);
                }
            }
        }
        List<Tran> trans = tranMapper.selectByExample(infoExample);
        trans.forEach(var -> {
            if (var.getCustomerid() != null && !"".equals(var.getCustomerid())) {
                var.setCustomerid(customerMapper.queryNameById(var.getCustomerid()));
            }
            if (var.getContactsid() != null && !"".equals(var.getContactsid())) {
                var.setContactsid(contactsMapper.queryNameById(var.getContactsid()));
            }
        });
        return new PageInfo<>(trans);
    }

    @Override
    @Transactional
    public boolean create(Tran tran) {
        List<String> ids = customerMapper.queryIdByName(tran.getCustomerid());
        if (ids == null || ids.size() != 1) {
            return false;
        }
        tran.setCustomerid(ids.get(0));
        tran.setId(UUIDUtil.getUUID());
        tran.setCreatetime(DateTimeUtil.getSysTime());
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
        return true;
    }

    @Override
    @Transactional
    public boolean update(Tran tran) {
        List<String> ids = customerMapper.queryIdByName(tran.getCustomerid());
        if (ids == null || ids.size() != 1) {
            return false;
        }
        tran.setCustomerid(ids.get(0));
        tran.setEdittime(DateTimeUtil.getSysTime());
        tranMapper.updateByPrimaryKeySelective(tran);
        TranHistory tranHistory = new TranHistory();
        tranHistory.setId(UUIDUtil.getUUID());
        tranHistory.setCreatetime(DateTimeUtil.getSysTime());
        tranHistory.setTranid(tran.getId());
        tranHistory.setExpecteddate(tran.getExpecteddate());
        tranHistory.setCreateby(tran.getEditby());
        tranHistory.setMoney(tran.getMoney());
        tranHistory.setStage(tran.getStage());
        tranHistoryMapper.insertSelective(tranHistory);
        return true;
    }

    @Override
    @Transactional
    public boolean delete(List<String> ids) {
        TranExample example = new TranExample();
        example.createCriteria().andIdIn(ids);
        tranMapper.deleteByExample(example);
        TranRemarkExample tranRemarkExample = new TranRemarkExample();
        tranRemarkExample.createCriteria().andTranidIn(ids);
        tranRemarkMapper.deleteByExample(tranRemarkExample);
        TranHistoryExample tranHistoryExample = new TranHistoryExample();
        tranHistoryExample.createCriteria().andTranidIn(ids);
        tranHistoryMapper.deleteByExample(tranHistoryExample);
        return true;
    }

    @Override
    public List<ChartVo> getChartData(Map<String, DicValue> stages) {
        List<ChartVo> data = new ArrayList<>();
        Integer var;
        for (String dicId : stages.keySet()) {
            var = tranMapper.getCountByStage(dicId);
            data.add(new ChartVo(stages.get(dicId).getText(), var));
        }
        return data;
    }

    @Override
    public Tran queryById(String id, boolean replaceId) {
        Tran tran = tranMapper.selectByPrimaryKey(id);
        if (tran.getCustomerid() != null && !"".equals(tran.getCustomerid())) {
            tran.setCustomerid(customerMapper.queryNameById(tran.getCustomerid()));
        }
        if (replaceId) {
            if (tran.getActivityid() != null && !"".equals(tran.getActivityid())) {
                tran.setActivityid(activityMapper.queryNameById(tran.getActivityid()));
            }
            if (tran.getContactsid() != null && !"".equals(tran.getContactsid())) {
                tran.setContactsid(contactsMapper.queryNameById(tran.getContactsid()));
            }
        } else {
            // 编码
            String name;
            if (tran.getActivityid() != null && !"".equals(tran.getActivityid())) {
                name = activityMapper.queryNameById(tran.getActivityid());
                if (name != null && !"".equals(name)) {
                    tran.setActivityid(tran.getActivityid() + "-" + name);
                } else {
                    tran.setActivityid(null);
                }
            }
            if (tran.getContactsid() != null && !"".equals(tran.getContactsid())) {
                name = contactsMapper.queryNameById(tran.getContactsid());
                if (name != null && !"".equals(name)) {
                    tran.setContactsid(tran.getContactsid() + "-" + name);
                } else {
                    tran.setContactsid(null);
                }
            }
        }
        return tran;
    }
}
