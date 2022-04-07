package com.study;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cache.annotation.EnableCaching;
import org.springframework.session.data.redis.config.annotation.web.http.EnableRedisHttpSession;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.web.context.WebApplicationContext;

@SpringBootApplication
@MapperScan(basePackages = {"com.study.settings.dao","com.study.workbench.dao"})
@EnableTransactionManagement
@EnableCaching //注解驱动的缓存管理功能
@EnableRedisHttpSession
public class CrmApplication {

    public static WebApplicationContext ac;

    public static void main(String[] args) {
        ac = (WebApplicationContext) SpringApplication.run(CrmApplication.class, args);
    }

}
