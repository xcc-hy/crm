package com.study.settings.service;

import com.github.pagehelper.PageInfo;
import com.study.settings.model.User;
import com.study.vo.UserCondition;

import java.util.List;

public interface UserService {
    User login(String loginact, String loginpwd, String ip);
    User findForLogin(String loginact, String loginpwd);
    PageInfo<User> query(UserCondition userCondition, Integer pageSize, Integer pageNum);
    User queryById(String id);
    boolean create(User user);
    boolean update(User user);
    boolean delete(List<String> ids);

    boolean updatePwd(User user);

    List<User> queryAll();
}
