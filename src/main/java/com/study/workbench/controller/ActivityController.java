package com.study.workbench.controller;

import com.github.pagehelper.PageInfo;
import com.study.settings.model.User;
import com.study.utils.VisibleUtil;
import com.study.vo.CallBackVo;
import com.study.workbench.model.Activity;
import com.study.workbench.model.ActivityRemark;
import com.study.workbench.service.ActivityRemarkService;
import com.study.workbench.service.ActivityService;
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
@RequestMapping("/workbench/activity")
public class ActivityController {
    @Autowired
    private ActivityService activityService;

    @Autowired
    private ActivityRemarkService activityRemarkService;
    private final Integer PAGE_SIZE = 10;


    @RequestMapping("init")
    public String init(HttpServletRequest request) {
        PageInfo<Activity> pageInfo = activityService.query(null, 1, PAGE_SIZE);
        request.setAttribute("info",pageInfo);
        pageInfo.getList().forEach(VisibleUtil::visible);
        return "workbench/activity/index";
    }

    @RequestMapping("/query")
    @ResponseBody
    public PageInfo<Activity> table(Integer pageNum, Integer pageSize, Activity activity) {
        if (pageNum == null) {
            pageNum = 1;
        }
        if (pageSize == null) {
            pageSize = PAGE_SIZE;
        }
        PageInfo<Activity> pageInfo = activityService.query(activity, pageNum, pageSize);
        pageInfo.getList().forEach(VisibleUtil::visible);
        return pageInfo;
    }

    @RequestMapping(value = "/create")
    @ResponseBody
    public CallBackVo create(Activity activity, HttpSession session) {
        activity.setCreateby(((User)session.getAttribute("user")).getName());
        boolean res = activityService.create(activity);
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
    public Activity queryById(String id) {
        return activityService.queryById(id);
    }

    @RequestMapping("/queryById/visible")
    @ResponseBody
    public Activity queryByIdVisible(String id) {
        Activity activity = activityService.queryById(id);
        VisibleUtil.visible(activity);
        return activity;
    }

    @RequestMapping(value = "/update")
    @ResponseBody
    public CallBackVo update(Activity activity, HttpSession session) {
        activity.setEditby(((User)session.getAttribute("user")).getName());
        boolean res = activityService.update(activity);
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
        boolean res = activityService.delete(Arrays.stream(ids).collect(Collectors.toList()));
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
        Activity activity = activityService.queryById(id);
        VisibleUtil.visible(activity);
        List<ActivityRemark> activityRemarks = activityRemarkService.queryByActivityId(id);
        Map<String, Object> map = new HashMap<>();
        map.put("activity", activity);
        map.put("remarkList", activityRemarks);
        return map;
    }

    @RequestMapping("/queryByName")
    @ResponseBody
    public List<Activity> queryByName(String name) {
        List<Activity> activityList = activityService.queryByName(name);
        activityList.forEach(VisibleUtil::visible);
        return activityList;
    }

    @RequestMapping("/chart")
    public String chart() {
        return "workbench/chart/activity/index";
    }

}
