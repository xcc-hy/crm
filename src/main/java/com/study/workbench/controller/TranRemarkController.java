package com.study.workbench.controller;

import com.study.settings.model.User;
import com.study.vo.CallBackVo;
import com.study.workbench.model.TranRemark;
import com.study.workbench.service.TranRemarkService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/workbench/tranRemark")
public class TranRemarkController {
    @Autowired
    private TranRemarkService tranRemarkService;

    @RequestMapping(value = "/create")
    @ResponseBody
    public CallBackVo create(TranRemark tranRemark, HttpSession session) {
        tranRemark.setCreateby(((User)session.getAttribute("user")).getName());
        boolean res = tranRemarkService.create(tranRemark);
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
    public CallBackVo update(TranRemark tranRemark, HttpSession session) {
        tranRemark.setEditby(((User)session.getAttribute("user")).getName());
        boolean res = tranRemarkService.update(tranRemark);
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
        boolean res = tranRemarkService.delete(id);
        CallBackVo vo = new CallBackVo();
        vo.setSuccess(res);
        if (res) {
            vo.setMsg("删除成功！");
        } else {
            vo.setMsg("删除失败！");
        }
        return vo;
    }

    @RequestMapping("/queryByTranId")
    @ResponseBody
    public List<TranRemark> queryByTranId(String id) {
        return tranRemarkService.queryByTranId(id);
    }
}
