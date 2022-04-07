package com.study.workbench.controller;

import com.github.pagehelper.PageInfo;
import com.study.settings.model.User;
import com.study.utils.VisibleUtil;
import com.study.vo.CallBackVo;
import com.study.workbench.model.Activity;
import com.study.workbench.model.Clue;
import com.study.workbench.model.ClueRemark;
import com.study.workbench.model.Tran;
import com.study.workbench.service.ClueActivityRelationService;
import com.study.workbench.service.ClueRemarkService;
import com.study.workbench.service.ClueService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@Controller
@RequestMapping("/workbench/clue")
public class ClueController {
    private final Integer PAGE_SIZE = 10;

    @Autowired
    private ClueService clueService;

    @Autowired
    private ClueActivityRelationService clueActivityRelationService;

    @Autowired
    private ClueRemarkService clueRemarkService;


    @RequestMapping("init")
    public String init(HttpServletRequest request) {
        PageInfo<Clue> pageInfo = clueService.query(null, 1, PAGE_SIZE);
        pageInfo.getList().forEach(VisibleUtil::visible);
        request.setAttribute("info",pageInfo);
        return "workbench/clue/index";
    }

    @RequestMapping("/query")
    @ResponseBody
    public PageInfo<Clue> table(Integer pageNum, Integer pageSize, Clue clue) {
        if (pageNum == null) {
            pageNum = 1;
        }
        if (pageSize == null) {
            pageSize = PAGE_SIZE;
        }
        PageInfo<Clue> pageInfo = clueService.query(clue, pageNum, pageSize);
        pageInfo.getList().forEach(VisibleUtil::visible);
        return pageInfo;
    }

    @RequestMapping(value = "/create")
    @ResponseBody
    public CallBackVo create(Clue clue, HttpSession session) {
        clue.setCreateby(((User)session.getAttribute("user")).getName());
        boolean res = clueService.create(clue);
        CallBackVo vo = new CallBackVo();
        vo.setSuccess(res);
        if (res) {
            vo.setMsg("添加成功！");
        } else {
            vo.setMsg("添加失败！");
        }
        return vo;
    }

    @RequestMapping("/queryById")
    @ResponseBody
    public Clue queryById(String id) {
        return clueService.queryById(id);
    }

    @RequestMapping("/queryById/visible")
    @ResponseBody
    public Clue queryByIdVisible(String id) {
        Clue clue = clueService.queryById(id);
        VisibleUtil.visible(clue);
        return clue;
    }

    @RequestMapping(value = "/update")
    @ResponseBody
    public CallBackVo update(Clue clue, HttpSession session) {
        clue.setEditby(((User)session.getAttribute("user")).getName());
        boolean res = clueService.update(clue);
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
        boolean res = clueService.delete(Arrays.stream(ids).collect(Collectors.toList()));
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
        Clue clue = clueService.queryById(id);
        VisibleUtil.visible(clue);
        List<ClueRemark> clueRemarks = clueRemarkService.queryByClueId(id);
        List<Activity> activityList = clueActivityRelationService.queryActivityByClueId(id);
        activityList.forEach(VisibleUtil::visible);
        Map<String, Object> map = new HashMap<>();
        map.put("clue", clue);
        map.put("remarkList", clueRemarks);
        map.put("activityList", activityList);
        return map;
    }


    @RequestMapping(value = "/saveConvert")
    @ResponseBody
    public CallBackVo saveConvert(HttpSession session, String clueId, Boolean hasTran, Tran tran) {
        String createBy = ((User)session.getAttribute("user")).getName();
        boolean res = clueService.saveConvert(clueId, createBy, hasTran, tran);
        CallBackVo vo = new CallBackVo();
        vo.setSuccess(res);
        if (res) {
            vo.setMsg("转换成功！");
        } else {
            vo.setMsg("转换失败！");
        }
        return vo;
    }
}
