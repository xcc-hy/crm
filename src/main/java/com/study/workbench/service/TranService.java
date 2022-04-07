package com.study.workbench.service;

import com.github.pagehelper.PageInfo;
import com.study.settings.model.DicValue;
import com.study.vo.ChartVo;
import com.study.workbench.model.Tran;

import java.util.List;
import java.util.Map;

public interface TranService {
    List<Tran> queryByCustomerId(String id);

    List<Tran> queryByContactsId(String id);

    PageInfo<Tran> query(Tran tran, Integer pageNum, Integer pageSize);

    boolean create(Tran tran);

    Tran queryById(String id, boolean replaceId);

    boolean update(Tran tran);

    boolean delete(List<String> ids);

    List<ChartVo> getChartData(Map<String, DicValue> stages);
}
