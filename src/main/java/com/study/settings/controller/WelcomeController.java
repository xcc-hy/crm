package com.study.settings.controller;

import com.study.settings.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class WelcomeController {
    @Autowired
    private UserService userService;

    @RequestMapping(value = "/settings/welcome/say")
    @ResponseBody
    public String welcome(){
        return "welcome to my home?";
    }
}
