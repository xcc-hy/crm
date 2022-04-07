package com.study.workbench.controller;

import com.study.utils.VisibleUtil;
import com.study.vo.CallBackVo;
import com.study.workbench.model.Activity;
import com.study.workbench.service.ClueActivityRelationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

@Controller
@RequestMapping("workbench/clueActivityRelation")
public class ClueActivityRelationController {
    @Autowired
    private ClueActivityRelationService clueActivityRelationService;

    @RequestMapping(value = "/delete")
    @ResponseBody
    public CallBackVo delete(String id) {
        boolean res = clueActivityRelationService.delete(id);
        CallBackVo vo = new CallBackVo();
        vo.setSuccess(res);
        if (res) {
            vo.setMsg("删除成功！");
        } else {
            vo.setMsg("删除失败！");
        }
        return vo;
    }

    @RequestMapping(value = "/create")
    @ResponseBody
    public CallBackVo create(@RequestParam("aIds[]") String[] aIds, String id) {
        boolean res = clueActivityRelationService.create(id, Arrays.stream(aIds).collect(Collectors.toList()));
        CallBackVo vo = new CallBackVo();
        vo.setSuccess(res);
        if (res) {
            vo.setMsg("关联成功！");
        } else {
            vo.setMsg("关联失败！");
        }
        return vo;
    }


    @RequestMapping("/queryUnRelationActivityByClueId")
    @ResponseBody
    public List<Activity> queryUnRelationActivityByClueId(String id, String name) {
        List<Activity> activityList = clueActivityRelationService.queryUnRelationActivityByClueId(id, name);
        activityList.forEach(VisibleUtil::visible);
        return activityList;
    }


    @RequestMapping("/queryActivityByClueId")
    @ResponseBody
    public List<Activity> queryActivityByClueId(String id) {
        List<Activity> activityList = clueActivityRelationService.queryActivityByClueId(id);
        activityList.forEach(VisibleUtil::visible);
        return activityList;
    }

}
