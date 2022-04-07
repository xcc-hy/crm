package com.study.workbench.service;

import com.github.pagehelper.PageInfo;
import com.study.workbench.model.Activity;

import java.util.List;

public interface ActivityService {
    Activity queryById(String id);

    PageInfo<Activity> query(Activity activity, Integer pageNum, Integer pageSize);

    boolean create(Activity activity);

    boolean update(Activity activity);

    boolean delete(List<String> vars);

    List<Activity> queryByName(String name);

    List<Activity> queryByIds(String[] ids);
}
