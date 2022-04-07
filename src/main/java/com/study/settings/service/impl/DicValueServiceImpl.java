package com.study.settings.service.impl;

import com.study.settings.dao.DicValueMapper;
import com.study.settings.model.DicValue;
import com.study.settings.model.DicValueExample;
import com.study.settings.service.DicValueService;
import com.study.utils.DataLoadUtil;
import com.study.utils.UUIDUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class DicValueServiceImpl implements DicValueService {
    @Autowired
    private DicValueMapper dicValueMapper;

    @Autowired
    private DataLoadUtil dataLoadUtil;

    @Override
    public List<DicValue> queryAll() {
        DicValueExample dicValueExample = new DicValueExample();
        dicValueExample.setOrderByClause("typeCode, orderNo");
        return dicValueMapper.selectByExample(dicValueExample);
    }

    @Override
    public DicValue queryById(String id) {
        return dicValueMapper.selectByPrimaryKey(id);
    }

    @Override
    public boolean create(DicValue dicValue) {
        dicValue.setId(UUIDUtil.getUUID());
        int res = dicValueMapper.insertSelective(dicValue);
        if (res > 0) {
            dataLoadUtil.insertDicMap();
        }
        return res > 0;
    }

    @Override
    public boolean update(DicValue dicValue) {
        int res = dicValueMapper.updateByPrimaryKeySelective(dicValue);
        if (res > 0) {
            dataLoadUtil.insertDicMap();
        }
        return res > 0;
    }

    @Override
    public boolean delete(List<String> vars) {
        DicValueExample example = new DicValueExample();
        DicValueExample.Criteria criteria = example.createCriteria();
        criteria.andIdIn(vars);
        int res = dicValueMapper.deleteByExample(example);
        if (res > 0) {
            dataLoadUtil.insertDicMap();
        }
        return res > 0;
    }
}
