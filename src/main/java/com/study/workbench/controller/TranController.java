package com.study.workbench.controller;

import com.github.pagehelper.PageInfo;
import com.study.CrmApplication;
import com.study.settings.model.DicValue;
import com.study.settings.model.User;
import com.study.utils.VisibleUtil;
import com.study.vo.CallBackVo;
import com.study.vo.ChartVo;
import com.study.workbench.model.Tran;
import com.study.workbench.model.TranHistory;
import com.study.workbench.model.TranRemark;
import com.study.workbench.service.TranHistoryService;
import com.study.workbench.service.TranRemarkService;
import com.study.workbench.service.TranService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.*;
import java.util.stream.Collectors;

@Controller
@RequestMapping("/workbench/tran")
public class TranController {
    private final Integer PAGE_SIZE = 10;

    @Autowired
    private TranService tranService;

    @Autowired
    private TranRemarkService tranRemarkService;

    @Autowired
    private TranHistoryService tranHistoryService;


    @RequestMapping("/init")
    public String init(HttpServletRequest request) {
        PageInfo<Tran> pageInfo = tranService.query(null, 1, PAGE_SIZE);
        pageInfo.getList().forEach(VisibleUtil::visible);
        request.setAttribute("info",pageInfo);
        return "workbench/transaction/index";
    }

    @RequestMapping("/query")
    @ResponseBody
    public PageInfo<Tran> table(Integer pageNum, Integer pageSize, Tran tran) {
        if (pageNum == null) {
            pageNum = 1;
        }
        if (pageSize == null) {
            pageSize = PAGE_SIZE;
        }
        PageInfo<Tran> pageInfo = tranService.query(tran, pageNum, pageSize);
        pageInfo.getList().forEach(VisibleUtil::visible);
        return pageInfo;
    }

    @RequestMapping(value = "/create")
    @ResponseBody
    public CallBackVo create(Tran tran, HttpSession session) {
        tran.setCreateby(((User)session.getAttribute("user")).getName());
        boolean res = tranService.create(tran);
        CallBackVo vo = new CallBackVo();
        vo.setSuccess(res);
        if (res) {
            vo.setMsg("添加成功！");
        } else {
            vo.setMsg("添加失败！");
        }
        return vo;
    }

    @RequestMapping("/queryById/code")
    @ResponseBody
    public Tran queryById(String id) {
        return tranService.queryById(id,false);
    }

    @RequestMapping("/queryById/visible")
    @ResponseBody
    public Tran queryByIdVisible(String id) {
        Tran tran = tranService.queryById(id, true);
        VisibleUtil.visible(tran);
        return tran;
    }

    @RequestMapping(value = "/update")
    @ResponseBody
    public CallBackVo update(Tran tran, HttpSession session) {
        tran.setEditby(((User)session.getAttribute("user")).getName());
        boolean res = tranService.update(tran);
        CallBackVo vo = new CallBackVo();
        vo.setSuccess(res);
        if (res) {
            vo.setMsg("修改成功！");
        } else {
            vo.setMsg("修改失败！");
        }
        return vo;
    }

    @RequestMapping(value = "/delete")
    @ResponseBody
    public CallBackVo delete(@RequestParam("ids[]") String[] ids) {
        boolean res = tranService.delete(Arrays.stream(ids).collect(Collectors.toList()));
        CallBackVo vo = new CallBackVo();
        vo.setSuccess(res);
        if (res) {
            vo.setMsg("删除成功！");
        } else {
            vo.setMsg("删除失败！");
        }
        return vo;
    }

    @RequestMapping("/detail")
    @ResponseBody
    public Map detail(String id) {
        Tran tran = tranService.queryById(id, true);
        VisibleUtil.visible(tran);
        List<TranRemark> tranRemarks = tranRemarkService.queryByTranId(id);
        List<TranHistory> tranHistoryList = tranHistoryService.queryByTranId(id);
        tranHistoryList.forEach(VisibleUtil::visible);
        Map<String, Object> map = new HashMap<>();
        map.put("tran", tran);
        map.put("remarkList", tranRemarks);
        map.put("tranHistoryList", tranHistoryList);
        return map;
    }

    @RequestMapping("/queryByContactsId")
    @ResponseBody
    public List<Tran> queryByContactsId(String id) {
        List<Tran> tranList = tranService.queryByContactsId(id);
        tranList.forEach(VisibleUtil::visible);
        return tranList;
    }

    @RequestMapping("/queryByCustomerId")
    @ResponseBody
    public List<Tran> queryByCustomerId(String id) {
        List<Tran> tranList = tranService.queryByCustomerId(id);
        tranList.forEach(VisibleUtil::visible);
        return tranList;
    }

    @RequestMapping("/chart")
    public String chart(HttpServletRequest request) {
        Map<String, Map<String, DicValue>> dicMap = (Map<String, Map<String, DicValue>>) CrmApplication.ac.getServletContext().getAttribute("dicMap");
        Map<String, DicValue> stages = dicMap.get("stage");
        List<ChartVo> data = tranService.getChartData(stages);
        List<String> legend = stages.values().stream().map(DicValue::getText).collect(Collectors.toList());
        request.setAttribute("legend", legend);
        request.setAttribute("data", data);
        return "workbench/chart/transaction/index";
    }
}
