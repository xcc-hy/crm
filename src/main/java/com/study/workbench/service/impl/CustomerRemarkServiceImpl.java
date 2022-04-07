package com.study.workbench.service.impl;

import com.study.utils.DateTimeUtil;
import com.study.utils.UUIDUtil;
import com.study.workbench.dao.CustomerRemarkMapper;
import com.study.workbench.model.CustomerRemark;
import com.study.workbench.model.CustomerRemarkExample;
import com.study.workbench.service.CustomerRemarkService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CustomerRemarkServiceImpl implements CustomerRemarkService {
    @Autowired
    private CustomerRemarkMapper customerRemarkMapper;

    @Override
    public List<CustomerRemark> queryByCustomerId(String id) {
        CustomerRemarkExample example = new CustomerRemarkExample();
        CustomerRemarkExample.Criteria criteria = example.createCriteria();
        criteria.andCustomeridEqualTo(id);
        return customerRemarkMapper.selectByExample(example);
    }

    @Override
    public boolean update(CustomerRemark customerRemark) {
        customerRemark.setEditflag("1");
        customerRemark.setEdittime(DateTimeUtil.getSysTime());
        return customerRemarkMapper.updateByPrimaryKeySelective(customerRemark) > 0;
    }

    @Override
    public boolean create(CustomerRemark customerRemark) {
        customerRemark.setId(UUIDUtil.getUUID());
        customerRemark.setEditflag("0");
        customerRemark.setCreatetime(DateTimeUtil.getSysTime());
        return customerRemarkMapper.insertSelective(customerRemark) > 0;
    }

    @Override
    public boolean delete(String id) {
        return customerRemarkMapper.deleteByPrimaryKey(id) > 0;
    }
}
