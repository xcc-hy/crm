package com.study.workbench.controller;

import com.study.settings.model.User;
import com.study.vo.CallBackVo;
import com.study.workbench.model.ClueRemark;
import com.study.workbench.service.ClueRemarkService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/workbench/clueRemark")
public class ClueRemarkController {
    @Autowired
    private ClueRemarkService clueRemarkService;

    @RequestMapping(value = "/create")
    @ResponseBody
    public CallBackVo create(ClueRemark clueRemark, HttpSession session) {
        clueRemark.setCreateby(((User)session.getAttribute("user")).getName());
        boolean res = clueRemarkService.create(clueRemark);
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
    public CallBackVo update(ClueRemark clueRemark, HttpSession session) {
        clueRemark.setEditby(((User)session.getAttribute("user")).getName());
        boolean res = clueRemarkService.update(clueRemark);
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
        boolean res = clueRemarkService.delete(id);
        CallBackVo vo = new CallBackVo();
        vo.setSuccess(res);
        if (res) {
            vo.setMsg("删除成功！");
        } else {
            vo.setMsg("删除失败！");
        }
        return vo;
    }

    @RequestMapping("/queryByClueId")
    @ResponseBody
    public List<ClueRemark> queryByClueId(String id) {
        return clueRemarkService.queryByClueId(id);
    }
}
