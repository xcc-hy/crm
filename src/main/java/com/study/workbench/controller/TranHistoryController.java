package com.study.workbench.controller;

import com.study.utils.VisibleUtil;
import com.study.workbench.model.TranHistory;
import com.study.workbench.service.TranHistoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("/workbench/tranHistory")
public class TranHistoryController {
    @Autowired
    private TranHistoryService tranHistoryService;

    @RequestMapping("/queryByTranId")
    @ResponseBody
    public List<TranHistory> queryByTranId(String id) {
        List<TranHistory> tranHistoryList = tranHistoryService.queryByTranId(id);
        tranHistoryList.forEach(VisibleUtil::visible);
        return tranHistoryList;
    }
}
