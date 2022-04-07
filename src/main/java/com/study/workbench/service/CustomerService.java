package com.study.workbench.service;

import com.github.pagehelper.PageInfo;
import com.study.workbench.model.Customer;

import java.util.List;

public interface CustomerService {
    PageInfo<Customer> query(Customer customer, Integer pageNum, Integer pageSize);

    boolean create(Customer customer);

    boolean update(Customer customer);

    boolean delete(List<String> vars);

    Customer queryById(String id);

    List<String> queryCustomerIdByName(String name);

    String queryNameById(String id);

    List<String> queryNameByName(String name);
}
