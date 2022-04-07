package com.study.workbench.controller;

import com.study.settings.model.User;
import com.study.vo.CallBackVo;
import com.study.workbench.model.CustomerRemark;
import com.study.workbench.service.CustomerRemarkService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/workbench/customerRemark")
public class CustomerRemarkController {

    @Autowired
    private CustomerRemarkService customerRemarkService;

    @RequestMapping("/update")
    @ResponseBody
    public CallBackVo update(CustomerRemark customerRemark, HttpSession session) {
        customerRemark.setEditby(((User)session.getAttribute("user")).getName());
        boolean res = customerRemarkService.update(customerRemark);
        CallBackVo vo = new CallBackVo();
        vo.setSuccess(res);
        if (res) {
            vo.setMsg("修改成功！");
        } else {
            vo.setMsg("修改失败！");
        }
        return vo;
    }

    @RequestMapping("/create")
    @ResponseBody
    public CallBackVo create(CustomerRemark customerRemark, HttpSession session) {
        customerRemark.setCreateby(((User)session.getAttribute("user")).getName());
        boolean res = customerRemarkService.create(customerRemark);
        CallBackVo vo = new CallBackVo();
        vo.setSuccess(res);
        if (res) {
            vo.setMsg("修改成功！");
        } else {
            vo.setMsg("修改失败！");
        }
        return vo;
    }

    @RequestMapping("/delete")
    @ResponseBody
    public CallBackVo delete(String id) {
        boolean res = customerRemarkService.delete(id);
        CallBackVo vo = new CallBackVo();
        vo.setSuccess(res);
        if (res) {
            vo.setMsg("修改成功！");
        } else {
            vo.setMsg("修改失败！");
        }
        return vo;
    }

    @RequestMapping("/queryByCustomerId")
    @ResponseBody
    public List<CustomerRemark> queryByCustomerId(String id) {
        return customerRemarkService.queryByCustomerId(id);
    }
}
