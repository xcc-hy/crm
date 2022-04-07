package com.study.settings.controller;

import com.github.pagehelper.PageInfo;
import com.study.settings.model.User;
import com.study.settings.service.UserService;
import com.study.vo.CallBackVo;
import com.study.vo.UserCondition;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping(value = "/settings/user")
public class UserController {
    private final Integer PAGE_SIZE = 10;

    @Autowired
    private UserService userService;

    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public String login(HttpServletRequest request, String loginact, String loginpwd) {
        String ip = request.getRemoteAddr();
        User user = userService.login(loginact, loginpwd, ip);
        if (user != null) {
            request.getSession().setAttribute("user",user);
            return "workbench/index";
        }
        request.setAttribute("errmsg","用户名、密码错误或者该用户、ip等被禁用");
        return "login";
    }

    @RequestMapping(value = "/pwd", method = RequestMethod.POST)
    @ResponseBody
    public CallBackVo updatePwd(String loginact, String oldPwd, String newPwd) {
        CallBackVo vo = new CallBackVo();
        User user = userService.findForLogin(loginact, oldPwd);
        if (user != null) {
            user.setLoginpwd(newPwd);
            boolean res = userService.updatePwd(user);
            if (res) {
                vo.setSuccess(true);
                vo.setMsg("修改成功！");
            } else {
                vo.setSuccess(false);
                vo.setMsg("修改失败！");
            }
        } else {
            vo.setSuccess(false);
            vo.setMsg("密码输入错误！");
        }
        return vo;
    }

    @RequestMapping(value = "/init")
    public String init(HttpServletRequest request) {
        return query(request, null, PAGE_SIZE, 1);
    }

    @RequestMapping(value = "/query")
    public String query(HttpServletRequest request, UserCondition userCondition, Integer pageSize, Integer pageNum) {
        if (pageSize == null) {
            pageSize = PAGE_SIZE;
        }
        PageInfo<User> pageInfo = userService.query(userCondition, pageSize, pageNum);
        request.setAttribute("info",pageInfo);
        return "settings/qx/user/index";
    }

    @RequestMapping(value = "/detail")
    public String detail(HttpServletRequest request, String id) {
        User user = userService.queryById(id);
        request.setAttribute("user",user);
//        request.setAttribute("pageSize", pageSize != null ? pageSize : PAGE_SIZE);
//        request.setAttribute("pageNum", pageNum != null ? pageNum : 1);
        return "settings/qx/user/detail";
    }

    @RequestMapping(value = "/queryById")
    @ResponseBody
    public User queryById(String id) {
        User user = userService.queryById(id);
        return user;
    }

    @RequestMapping(value = "/create")
    @ResponseBody
    public CallBackVo create(User user) {
        boolean res = userService.create(user);
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
    public CallBackVo update(User user) {
        boolean res = userService.update(user);
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
        boolean res = userService.delete(vars);
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
