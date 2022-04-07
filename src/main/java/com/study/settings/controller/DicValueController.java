package com.study.settings.controller;

import com.study.settings.model.DicType;
import com.study.settings.model.DicValue;
import com.study.settings.service.DicTypeService;
import com.study.settings.service.DicValueService;
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
@RequestMapping("/settings/value")
public class DicValueController {

    @Autowired
    private DicValueService dicValueService;
    @Autowired
    private DicTypeService dicTypeService;

    @RequestMapping(value = "/init")
    public String init(HttpServletRequest request) {
        List<DicValue> dicValues = dicValueService.queryAll();
        request.setAttribute("dicValue",dicValues);
        List<DicType> dicTypes = dicTypeService.queryAll();
        request.setAttribute("dicType",dicTypes);
        return "settings/dictionary/value/index";
    }

    @RequestMapping(value = "/queryById")
    @ResponseBody
    public DicValue queryById(String id) {
        DicValue dicValue = dicValueService.queryById(id);
        return dicValue;
    }

    @RequestMapping(value = "/create")
    @ResponseBody
    public CallBackVo create(DicValue dicValue) {
        boolean res = dicValueService.create(dicValue);
        CallBackVo vo = new CallBackVo();
        vo.setSuccess(res);
        if (res) {
            vo.setMsg("添加成功！");
        } else {
            vo.setMsg("添加失败");
        }
        return vo;
    }

    @RequestMapping(value = "/update")
    @ResponseBody
    public CallBackVo update(DicValue dicValue) {
        boolean res = dicValueService.update(dicValue);
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
        boolean res = dicValueService.delete(vars);
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
