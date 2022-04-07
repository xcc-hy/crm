package com.study.settings.controller;

import com.github.pagehelper.PageInfo;
import com.study.settings.model.Dept;
import com.study.settings.service.DeptService;
import com.study.vo.CallBackVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping(value = "/settings/dept")
public class DeptController {
    private final Integer PAGE_SIZE = 10;

    @Autowired
    private DeptService deptService;

    @RequestMapping(value = "/init")
    public String init(HttpServletRequest request) {
        return query(request, PAGE_SIZE, 1);
    }

    @RequestMapping(value = "/query")
    public String query(HttpServletRequest request, Integer pageSize, Integer pageNum) {
        PageInfo<Dept> pageInfo = deptService.query(pageSize, pageNum);
        request.setAttribute("info",pageInfo);
        return "settings/dept/main";
    }

    @RequestMapping(value = "/queryById")
    @ResponseBody
    public Dept queryById(String id) {
        Dept dept = deptService.queryById(id);
        return dept;
    }

    @RequestMapping(value = "/create")
    @ResponseBody
    public CallBackVo create(Dept dept) {
        boolean res = deptService.create(dept);
        CallBackVo vo = new CallBackVo();
        vo.setSuccess(res);
        if (res) {
            vo.setMsg("添加成功！");
        } else {
            vo.setMsg("添加失败，请确认部门编号唯一！");
        }
        return vo;
    }

    @RequestMapping(value = "/update")
    @ResponseBody
    public CallBackVo update(Dept dept) {
        boolean res = deptService.update(dept);
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
    public CallBackVo delete(@RequestParam(value = "ids[]") String[] ids) {
        List<String> vars = new ArrayList<>();
        for (String id :ids) {
            vars.add(id);
        }
        boolean res = deptService.delete(vars);
        CallBackVo vo = new CallBackVo();
        vo.setSuccess(res);
        if (res) {
            vo.setMsg("删除成功！");
        } else {
            vo.setMsg("删除失败！");
        }
        return vo;
    }
}
