package com.study;

import com.study.utils.MD5Util;
import com.study.utils.UUIDUtil;
import jdk.nashorn.internal.runtime.URIUtils;
import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;

//@SpringBootTest
class CrmApplicationTests {

    @Test
    void contextLoads() {
        String pwd = "123";
        System.out.println(MD5Util.getMD5(pwd));
        System.out.println("06f5fc056eac41558a964f96daa7f27c".length());
        System.out.println(UUIDUtil.getUUID());
    }

}
