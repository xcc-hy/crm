package com.study.workbench.controller;

import com.study.settings.model.User;
import com.study.vo.CallBackVo;
import com.study.workbench.model.ContactsRemark;
import com.study.workbench.service.ContactsRemarkService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/workbench/contactsRemark")
public class ContactsRemarkController {
    @Autowired
    private ContactsRemarkService contactsRemarkService;

    @RequestMapping(value = "/create")
    @ResponseBody
    public CallBackVo create(ContactsRemark contactsRemark, HttpSession session) {
        contactsRemark.setCreateby(((User)session.getAttribute("user")).getName());
        boolean res = contactsRemarkService.create(contactsRemark);
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
    public CallBackVo update(ContactsRemark contactsRemark, HttpSession session) {
        contactsRemark.setEditby(((User)session.getAttribute("user")).getName());
        boolean res = contactsRemarkService.update(contactsRemark);
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
        boolean res = contactsRemarkService.delete(id);
        CallBackVo vo = new CallBackVo();
        vo.setSuccess(res);
        if (res) {
            vo.setMsg("删除成功！");
        } else {
            vo.setMsg("删除失败！");
        }
        return vo;
    }

    @RequestMapping("/queryByContactsId")
    @ResponseBody
    public List<ContactsRemark> queryByContactsId(String id) {
        return contactsRemarkService.queryByContactsId(id);
    }
}
