package com.study.workbench.service;

import com.study.workbench.model.Activity;

import java.util.List;

public interface ContactsActivityRelationService {
    List<Activity> queryActivityByContactsId(String id);

    boolean delete(String id);

    boolean create(String id, List<String> aIds);

    List<Activity> queryUnRelationActivityByContactsId(String id, String name);
}
