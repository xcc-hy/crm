package com.study.config;

import com.study.handle.LoginInterceptor;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class MvcConfigurer implements WebMvcConfigurer {
    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        HandlerInterceptor loginInterceptor = new LoginInterceptor();
        String path[] = {"/settings/**", "/workbench/**"};
        String excluPath[] = {"/settings/user/login"};
        registry.addInterceptor(loginInterceptor).addPathPatterns(path).excludePathPatterns(excluPath);
    }
}
