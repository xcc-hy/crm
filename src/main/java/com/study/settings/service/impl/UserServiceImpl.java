package com.study.settings.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.study.settings.dao.UserMapper;
import com.study.settings.model.User;
import com.study.settings.model.UserExample;
import com.study.settings.service.UserService;
import com.study.utils.DataLoadUtil;
import com.study.utils.DateTimeUtil;
import com.study.utils.MD5Util;
import com.study.utils.UUIDUtil;
import com.study.vo.UserCondition;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserServiceImpl implements UserService {
    @Autowired
    private UserMapper userMapper;

    @Autowired
    private DataLoadUtil dataLoadUtil;

    @Override
    public User login(String loginact, String loginpwd, String ip) {
        User user = findForLogin(loginact,loginpwd);
        if (user != null) {
            // ip检查
            if (user.getAllowips() != null && !"".equals(user.getAllowips())) {
                if (!user.getAllowips().contains(ip)) {
                    return null;
                }
            }
            // 状态检查
            if ("0".equals(user.getLockstate()))
                return null;
            String curTime = DateTimeUtil.getSysTime();
            // 过期时间检查
            if (curTime.compareTo(user.getExpiretime()) > 0)
                return null;
            return user;
        }
        return null;
    }

    @Override
    public User findForLogin(String loginact, String loginpwd) {
        loginpwd = MD5Util.getMD5(loginpwd);
        UserExample userExample = new UserExample();
        UserExample.Criteria criteria = userExample.createCriteria();
        criteria.andLoginactEqualTo(loginact);
        criteria.andLoginpwdEqualTo(loginpwd);
        List<User> users = userMapper.selectByExample(userExample);
        if (users.size() > 0) {
            return users.get(0);
        }
        return null;
    }

    @Override
    public PageInfo<User> query(UserCondition userCondition, Integer pageSize, Integer pageNum) {
        if (pageNum == null || pageNum == 0) {
            pageNum = 1;
        }
        PageHelper.startPage(pageNum, pageSize);
        UserExample infoExample = new UserExample();
        infoExample.setOrderByClause("createTime desc");
        UserExample.Criteria criteria = infoExample.createCriteria();
        if (userCondition != null) {
            if (userCondition.getName() != null && ! "".equals(userCondition.getName())) {
                criteria.andNameLike("%" + userCondition.getName() + "%");
            }
            if (userCondition.getDeptNo() != null && ! "".equals(userCondition.getDeptNo())) {
                criteria.andDeptnoEqualTo(userCondition.getDeptNo());
            }
            if (userCondition.getlExpireTime() != null && ! "".equals(userCondition.getlExpireTime())) {
                criteria.andExpiretimeGreaterThanOrEqualTo(userCondition.getlExpireTime());
            }
            if (userCondition.gethExpireTime() != null && ! "".equals(userCondition.gethExpireTime())) {
                criteria.andExpiretimeLessThanOrEqualTo(userCondition.gethExpireTime());
            }
        }
        List<User> users = userMapper.selectByExample(infoExample);
        return new PageInfo<>(users);
    }

    @Override
    public User queryById(String id) {
        return userMapper.selectByPrimaryKey(id);
    }

    @Override
    public boolean create(User user) {
        user.setId(UUIDUtil.getUUID());
        user.setCreatetime(DateTimeUtil.getSysTime());
        user.setLoginpwd(MD5Util.getMD5(user.getLoginpwd()));
        int res = userMapper.insertSelective(user);
        if (res > 0) {
            dataLoadUtil.insertUserMap();
        }
        return res > 0;
    }

    @Override
    public boolean update(User user) {
        user.setEdittime(DateTimeUtil.getSysTime());
        int res = userMapper.updateByPrimaryKeySelective(user);
        if (res > 0) {
            dataLoadUtil.insertUserMap();
        }
        return res > 0;
    }

    @Override
    public boolean delete(List<String> ids) {
        UserExample example = new UserExample();
        UserExample.Criteria criteria = example.createCriteria();
        criteria.andIdIn(ids);
        int res = userMapper.deleteByExample(example);
        if (res > 0) {
            dataLoadUtil.insertUserMap();
        }
        return res > 0;
    }

    @Override
    public boolean updatePwd(User user) {
        user.setLoginpwd(MD5Util.getMD5(user.getLoginpwd()));
        int res = userMapper.updateByPrimaryKeySelective(user);
        if (res > 0) {
            dataLoadUtil.insertUserMap();
        }
        return res > 0;
    }

    @Override
    public List<User> queryAll() {
        return userMapper.selectByExample(new UserExample());
    }
}
