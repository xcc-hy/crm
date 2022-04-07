package com.study.utils;

import com.study.settings.model.Dept;
import com.study.settings.model.DicValue;
import com.study.settings.model.User;
import com.study.settings.service.DeptService;
import com.study.settings.service.DicTypeService;
import com.study.settings.service.DicValueService;
import com.study.settings.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import javax.servlet.ServletContext;
import java.util.*;


@Component
public class DataLoadUtil {

    @Autowired
    private DeptService deptService;

    @Autowired
    private DicTypeService dicTypeService;

    @Autowired
    private UserService userService;

    @Autowired
    private DicValueService dicValueService;

    @Autowired
    private ServletContext servletContext;

    public void insertDeptMap() {
        List<Dept> depts = deptService.queryAll();
        Map<String, Dept> deptMap = new HashMap<>();
        for (Dept dept :depts) {
            deptMap.put(dept.getId(), dept);
        }
        servletContext.setAttribute("deptMap", deptMap);
    }

    public void insertDicMap() {
        Map<String, Map<String, DicValue>> dicMap = new HashMap<>();
        List<DicValue> dicValues = dicValueService.queryAll();
        for (DicValue d : dicValues) {
            if (!dicMap.containsKey(d.getTypecode())) {
                dicMap.put(d.getTypecode(), new LinkedHashMap<>());
            }
            dicMap.get(d.getTypecode()).put(d.getId(), d);
        }
        servletContext.setAttribute("dicMap", dicMap);
    }

    public void insertUserMap() {
        Map<String, User> userMap = new HashMap<>();
        List<User> users = userService.queryAll();
        for (User user :users) {
            userMap.put(user.getId(), user);
        }
        servletContext.setAttribute("userMap", userMap);
    }
}
