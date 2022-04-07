package com.study.workbench.service;

import com.study.workbench.model.ContactsRemark;

import java.util.List;

public interface ContactsRemarkService {
    boolean create(ContactsRemark contactsRemark);

    boolean update(ContactsRemark contactsRemark);

    boolean delete(String id);

    List<ContactsRemark> queryByContactsId(String id);

    ContactsRemark queryById(String id);
}
