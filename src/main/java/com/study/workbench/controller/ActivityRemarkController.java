package com.study.workbench.controller;

import com.study.settings.model.User;
import com.study.vo.CallBackVo;
import com.study.workbench.model.ActivityRemark;
import com.study.workbench.service.ActivityRemarkService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/workbench/activityRemark")
public class ActivityRemarkController {
    @Autowired
    private ActivityRemarkService activityRemarkService;


    @RequestMapping(value = "/create")
    @ResponseBody
    public CallBackVo create(ActivityRemark activityRemark, HttpSession session) {
        activityRemark.setCreateby(((User)session.getAttribute("user")).getName());
        boolean res = activityRemarkService.create(activityRemark);
        CallBackVo vo = new CallBackVo();
        vo.setSuccess(res);
        if (res) {
            vo.setMsg("添加成功！");
        } else {
            vo.setMsg("添加失败！");
        }
        return vo;
    }

    @RequestMapping(value = "/update")
    @ResponseBody
    public CallBackVo update(ActivityRemark activityRemark, HttpSession session) {
        activityRemark.setEditby(((User)session.getAttribute("user")).getName());
        boolean res = activityRemarkService.update(activityRemark);
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
    public CallBackVo delete(String id) {
        boolean res = activityRemarkService.delete(id);
        CallBackVo vo = new CallBackVo();
        vo.setSuccess(res);
        if (res) {
            vo.setMsg("删除成功！");
        } else {
            vo.setMsg("删除失败！");
        }
        return vo;
    }

    @RequestMapping("/queryByActivityId")
    @ResponseBody
    public List<ActivityRemark> queryByActivityId(String id) {
        return activityRemarkService.queryByActivityId(id);
    }
}
