package com.study.settings.service.impl;

import com.study.settings.dao.DicTypeMapper;
import com.study.settings.model.DicType;
import com.study.settings.model.DicTypeExample;
import com.study.settings.service.DicTypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class DicTypeServiceImpl implements DicTypeService {
    @Autowired
    private DicTypeMapper dicTypeMapper;

    @Override
    public List<DicType> queryAll() {
        return dicTypeMapper.selectByExample(new DicTypeExample());
    }
}
