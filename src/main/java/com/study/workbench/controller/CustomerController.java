package com.study.workbench.controller;

import com.github.pagehelper.PageInfo;
import com.study.settings.model.User;
import com.study.utils.VisibleUtil;
import com.study.vo.CallBackVo;
import com.study.workbench.model.Contacts;
import com.study.workbench.model.Customer;
import com.study.workbench.model.CustomerRemark;
import com.study.workbench.model.Tran;
import com.study.workbench.service.ContactsService;
import com.study.workbench.service.CustomerRemarkService;
import com.study.workbench.service.CustomerService;
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
@RequestMapping("/workbench/customer")
public class CustomerController {
    @Autowired
    private CustomerService customerService;

    @Autowired
    private CustomerRemarkService customerRemarkService;

    @Autowired
    private TranService tranService;

    @Autowired
    private ContactsService contactsService;

    private static Integer PAGE_SIZE = 10;

    @RequestMapping("/init")
    public String init(HttpServletRequest request) {
        PageInfo<Customer> pageInfo = customerService.query(null, 1, PAGE_SIZE);
        pageInfo.getList().forEach(VisibleUtil::visible);
        request.setAttribute("info", pageInfo);
        return "workbench/customer/index";
    }

    @RequestMapping("/query")
    @ResponseBody
    public PageInfo<Customer> table(Integer pageSize, Integer pageNum, Customer customer) {
        if (pageNum == null) {
            pageNum = 1;
        }
        if (pageSize == null) {
            pageSize = PAGE_SIZE;
        }
        PageInfo<Customer> pageInfo = customerService.query(customer, pageNum, pageSize);
        pageInfo.getList().forEach(VisibleUtil::visible);
        return pageInfo;
    }

    @RequestMapping(value = "/create")
    @ResponseBody
    public CallBackVo create(Customer customer, HttpSession session) {
        customer.setCreateby(((User)session.getAttribute("user")).getName());
        boolean res = customerService.create(customer);
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
    public CallBackVo update(Customer customer, HttpSession session) {
        customer.setEditby(((User)session.getAttribute("user")).getName());
        boolean res = customerService.update(customer);
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
        boolean res = customerService.delete(Arrays.stream(ids).collect(Collectors.toList()));
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
    public Customer queryById(String id) {
        return customerService.queryById(id);
    }

    @RequestMapping("/queryById/visible")
    @ResponseBody
    public Customer queryByIdWithVisible(String id) {
        Customer customer = customerService.queryById(id);
        VisibleUtil.visible(customer);
        return customer;
    }

    @RequestMapping("/queryNameByName")
    @ResponseBody
    public List<String> queryNameByName(String name) {
        List<String> names = customerService.queryNameByName(name);
        return names;
    }

    @RequestMapping("/detail")
    @ResponseBody
    public Map detail(String id) {
        Map<String, Object> map = new HashMap<>();
        Customer customer = customerService.queryById(id);
        List<CustomerRemark> remarkList = customerRemarkService.queryByCustomerId(id);
        List<Tran> tranList = tranService.queryByCustomerId(id);
        List<Contacts> contactsList = contactsService.queryByCustomerId(id);

        VisibleUtil.visible(customer);
        tranList.forEach(VisibleUtil::visible);
        contactsList.forEach(VisibleUtil::visible);

        map.put("customer", customer);
        map.put("remarkList", remarkList);
        map.put("tranList", tranList);
        map.put("contactsList", contactsList);
        return map;
    }
}
