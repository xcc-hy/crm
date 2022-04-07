package com.study.settings.controller;

import com.study.settings.model.DicType;
import com.study.settings.service.DicTypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@RequestMapping(value = "/settings/type")
public class DicTypeController {
    @Autowired
    private DicTypeService dicTypeService;

    @RequestMapping(value = "init")
    public String init(HttpServletRequest request) {
        List<DicType> dicTypes = dicTypeService.queryAll();
        request.setAttribute("dicType",dicTypes);
        return "settings/dictionary/type/index";
    }
}
