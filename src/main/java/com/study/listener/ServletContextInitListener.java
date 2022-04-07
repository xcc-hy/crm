package com.study.listener;

import com.study.utils.DataLoadUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.context.event.ApplicationReadyEvent;
import org.springframework.context.ApplicationListener;
import org.springframework.stereotype.Component;

@Component
public class ServletContextInitListener implements ApplicationListener<ApplicationReadyEvent> {
    @Autowired
    DataLoadUtil dataLoadUtil;

    @Override
    public void onApplicationEvent(ApplicationReadyEvent event) {
        dataLoadUtil.insertDeptMap();
        dataLoadUtil.insertDicMap();
        dataLoadUtil.insertUserMap();
    }
}
