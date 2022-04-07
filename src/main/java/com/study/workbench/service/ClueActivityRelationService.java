package com.study.workbench.service;

import com.study.workbench.model.Activity;

import java.util.List;

public interface ClueActivityRelationService {
    List<Activity> queryActivityByClueId(String id);

    boolean delete(String id);

    List<Activity> queryUnRelationActivityByClueId(String id, String name);

    boolean create(String id, List<String> aIds);
}
