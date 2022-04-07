package com.study.workbench.service;

import com.study.workbench.model.ActivityRemark;

import java.util.List;

public interface ActivityRemarkService {
    List<ActivityRemark> queryByActivityId(String id);

    boolean create(ActivityRemark activityRemark);

    boolean update(ActivityRemark activityRemark);

    boolean delete(String id);

    ActivityRemark queryById(String id);
}
