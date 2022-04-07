package com.study.workbench.service;

import com.study.workbench.model.CustomerRemark;

import java.util.List;

public interface CustomerRemarkService {
    List<CustomerRemark> queryByCustomerId(String id);

    boolean update(CustomerRemark customerRemark);

    boolean create(CustomerRemark customerRemark);

    boolean delete(String id);
}
