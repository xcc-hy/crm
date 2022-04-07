package com.study.workbench.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.study.utils.DateTimeUtil;
import com.study.utils.UUIDUtil;
import com.study.workbench.dao.CustomerMapper;
import com.study.workbench.model.Customer;
import com.study.workbench.model.CustomerExample;
import com.study.workbench.service.CustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
public class CustomerServiceImpl implements CustomerService {
    @Autowired
    private CustomerMapper customerMapper;

    @Override
    public PageInfo<Customer> query(Customer customer, Integer pageNum, Integer pageSize) {
        if (pageNum == 0) {
            pageNum = 1;
        }
        PageHelper.startPage(pageNum, pageSize);
        CustomerExample infoExample = new CustomerExample();
        infoExample.setOrderByClause("createTime desc");
        CustomerExample.Criteria criteria = infoExample.createCriteria();
        if (customer != null) {
            if (customer.getName() != null && ! "".equals(customer.getName())) {
                criteria.andNameLike("%" + customer.getName() + "%");
            }
            if (customer.getWebsite() != null && ! "".equals(customer.getWebsite())) {
                criteria.andWebsiteLike("%" + customer.getWebsite() + "%");
            }
            if (customer.getPhone() != null && ! "".equals(customer.getPhone())) {
                criteria.andPhoneLike("%" + customer.getPhone() + "%");
            }
            if (customer.getOwner() != null && ! "".equals(customer.getOwner())) {
                criteria.andOwnerEqualTo(customer.getOwner());
            }
        }
        List<Customer> customers = customerMapper.selectByExample(infoExample);
        return new PageInfo<>(customers);
    }

    @Override
    public boolean create(Customer customer) {
        customer.setId(UUIDUtil.getUUID());
        customer.setCreatetime(DateTimeUtil.getSysTime());
        return customerMapper.insertSelective(customer) > 0;
    }

    @Override
    public boolean update(Customer customer) {
        customer.setEdittime(DateTimeUtil.getSysTime());
        return customerMapper.updateByPrimaryKeySelective(customer) > 0;
    }

    @Override
    public boolean delete(List<String> vars) {
        CustomerExample example = new CustomerExample();
        CustomerExample.Criteria criteria = example.createCriteria();
        criteria.andIdIn(vars);
        return customerMapper.deleteByExample(example) > 0;
    }

    @Override
    public Customer queryById(String id) {
        return customerMapper.selectByPrimaryKey(id);
    }

    @Override
    public List<String> queryCustomerIdByName(String name) {
        return customerMapper.queryIdsByName(name);
    }

    @Override
    public String queryNameById(String id) {
        return customerMapper.queryNameById(id);
    }

    @Override
    public List<String> queryNameByName(String name) {
        CustomerExample example = new CustomerExample();
        CustomerExample.Criteria criteria = example.createCriteria();
        if (name != null && !"".equals(name)) {
            criteria.andNameLike("%" + name + "%");
        }
        List<Customer> customers = customerMapper.selectByExample(example);
        return customers.stream().map(Customer::getName).collect(Collectors.toList());
    }
}
