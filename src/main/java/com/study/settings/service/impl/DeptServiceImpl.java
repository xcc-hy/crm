package com.study.settings.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.study.settings.dao.DeptMapper;
import com.study.settings.model.Dept;
import com.study.settings.model.DeptExample;
import com.study.settings.service.DeptService;
import com.study.utils.DataLoadUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class DeptServiceImpl implements DeptService {
    @Autowired
    private DeptMapper deptMapper;
    @Autowired
    private DataLoadUtil dataLoadUtil;

    @Override
    public PageInfo<Dept> query(Integer pageSize, Integer pageNum) {
        if (pageNum == 0) {
            pageNum = 1;
        }
        PageHelper.startPage(pageNum, pageSize);
        DeptExample infoExample = new DeptExample();
        infoExample.setOrderByClause("id");
        List<Dept> depts = deptMapper.selectByExample(infoExample);
        return new PageInfo<>(depts);
    }

    @Override
    public Dept queryById(String id) {
        return deptMapper.selectByPrimaryKey(id);
    }

    @Override
    public List<Dept> queryAll() {
        return deptMapper.selectByExample(new DeptExample());
    }

    @Override
    public boolean create(Dept dept) {
        Dept var = deptMapper.selectByPrimaryKey(dept.getId());
        if (var == null) {
            int res = deptMapper.insertSelective(dept);
            if (res > 0) {
                dataLoadUtil.insertDeptMap();
            }
            return res > 0;
        }
        return false;
    }

    @Override
    public boolean update(Dept dept) {
        int res = deptMapper.updateByPrimaryKeySelective(dept);
        if (res > 0) {
            dataLoadUtil.insertDeptMap();
        }
        return res > 0;
    }

    @Override
    public boolean delete(List<String> id) {
        DeptExample example = new DeptExample();
        DeptExample.Criteria criteria = example.createCriteria();
        criteria.andIdIn(id);
        int res = deptMapper.deleteByExample(example);
        if (res > 0) {
            dataLoadUtil.insertDeptMap();
        }
        return res > 0;
    }
}
