package com.study.workbench.controller;

import com.github.pagehelper.PageInfo;
import com.study.settings.model.User;
import com.study.utils.VisibleUtil;
import com.study.vo.CallBackVo;
import com.study.workbench.model.Activity;
import com.study.workbench.model.Contacts;
import com.study.workbench.model.ContactsRemark;
import com.study.workbench.model.Tran;
import com.study.workbench.service.ContactsActivityRelationService;
import com.study.workbench.service.ContactsRemarkService;
import com.study.workbench.service.ContactsService;
import com.study.workbench.service.TranService;
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
@RequestMapping("workbench/contacts")
public class ContactsController {
    @Autowired
    private ContactsService contactsService;

    @Autowired
    private ContactsRemarkService contactsRemarkService;

    @Autowired
    private TranService tranService;

    @Autowired
    private ContactsActivityRelationService contactsActivityRelationService;

    private static Integer PAGE_SIZE = 10;

    @RequestMapping("/init")
    public String init(HttpServletRequest request) {
        PageInfo<Contacts> pageInfo = contactsService.query(null, 1, PAGE_SIZE);
        pageInfo.getList().forEach(VisibleUtil::visible);
        request.setAttribute("info", pageInfo);
        return "workbench/contacts/index";
    }

    @RequestMapping("/query")
    @ResponseBody
    public PageInfo<Contacts> table(Integer pageSize, Integer pageNum, Contacts contacts) {
        if (pageNum == null) {
            pageNum = 1;
        }
        if (pageSize == null) {
            pageSize = PAGE_SIZE;
        }
        PageInfo<Contacts> pageInfo = contactsService.query(contacts, pageNum, pageSize);
        pageInfo.getList().forEach(VisibleUtil::visible);
        return pageInfo;
    }

    @RequestMapping(value = "/create")
    @ResponseBody
    public CallBackVo create(Contacts contacts, HttpSession session) {
        contacts.setCreateby(((User)session.getAttribute("user")).getName());
        boolean res = contactsService.create(contacts);
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
    public CallBackVo update(Contacts contacts, HttpSession session) {
        contacts.setEditby(((User)session.getAttribute("user")).getName());
        boolean res = contactsService.update(contacts);
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
        boolean res = contactsService.delete(Arrays.stream(ids).collect(Collectors.toList()));
        CallBackVo vo = new CallBackVo();
        vo.setSuccess(res);
        if (res) {
            vo.setMsg("删除成功！");
        } else {
            vo.setMsg("删除失败！");
        }
        return vo;
    }

    @RequestMapping("/queryById")
    @ResponseBody
    public Contacts queryById(String id) {
        return contactsService.queryById(id);
    }

    @RequestMapping("/queryById/visible")
    @ResponseBody
    public Contacts queryByIdVisible(String id) {
        Contacts contacts = contactsService.queryById(id);
        VisibleUtil.visible(contacts);
        return contacts;
    }

    @RequestMapping("/queryByCustomerId")
    @ResponseBody
    public List<Contacts> queryByCustomerId(String id) {
        List<Contacts> contactsList = contactsService.queryByCustomerId(id);
        contactsList.forEach(VisibleUtil::visible);
        return contactsList;
    }

    @RequestMapping("/detail")
    @ResponseBody
    public Map detail(String id) {
        Map<String, Object> map = new HashMap<>();
        Contacts contacts = contactsService.queryById(id);
        List<ContactsRemark> remarkList = contactsRemarkService.queryByContactsId(id);
        List<Tran> tranList = tranService.queryByContactsId(id);
        List<Activity> activityList = contactsActivityRelationService.queryActivityByContactsId(id);

        VisibleUtil.visible(contacts);
        tranList.forEach(VisibleUtil::visible);
        activityList.forEach(VisibleUtil::visible);

        map.put("contacts", contacts);
        map.put("remarkList", remarkList);
        map.put("tranList", tranList);
        map.put("activityList", activityList);
        return map;
    }

    @RequestMapping("/queryByName")
    @ResponseBody
    public List<Contacts> queryByName(String name) {
        return contactsService.queryByName(name);
    }
}
