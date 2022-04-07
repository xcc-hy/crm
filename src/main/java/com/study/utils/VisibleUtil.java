package com.study.utils;

import com.study.CrmApplication;
import com.study.settings.model.DicValue;
import com.study.settings.model.User;
import com.study.workbench.model.*;

import java.util.Map;

public class VisibleUtil {

    public static void visible(Activity var) {
        Map<String, User> userMap = (Map<String, User>) CrmApplication.ac.getServletContext().getAttribute("userMap");
        User user = userMap.get(var.getOwner());
        if (user != null) {
            var.setOwner(user.getName());
        } else {
            var.setOwner(null);
        }
    }

    public static void visible(Customer var) {
        Map<String, User> userMap = (Map<String, User>) CrmApplication.ac.getServletContext().getAttribute("userMap");
        User user = userMap.get(var.getOwner());
        if (user != null) {
            var.setOwner(user.getName());
        } else {
            var.setOwner(null);
        }
    }

    public static void visible(Clue var) {
        Map<String, User> userMap = (Map<String, User>) CrmApplication.ac.getServletContext().getAttribute("userMap");
        Map<String, Map<String, DicValue>> dicMap = (Map<String, Map<String, DicValue>>) CrmApplication.ac.getServletContext().getAttribute("dicMap");
        User user = userMap.get(var.getOwner());
        if (user != null) {
            var.setOwner(user.getName());
        } else {
            var.setOwner(null);
        }
        DicValue dicValue = dicMap.get("clueState").get(var.getState());
        if (dicValue != null) {
            var.setState(dicValue.getText());
        } else {
            var.setState(null);
        }
        dicValue = dicMap.get("source").get(var.getSource());
        if (dicValue != null) {
            var.setSource(dicValue.getText());
        } else {
            var.setSource(null);
        }
        dicValue = dicMap.get("appellation").get(var.getAppellation());
        if (dicValue != null) {
            var.setAppellation(dicValue.getText());
        } else {
            var.setAppellation(null);
        }
    }

    public static void visible(TranHistory var) {
        Map<String, Map<String, DicValue>> dicMap = (Map<String, Map<String, DicValue>>) CrmApplication.ac.getServletContext().getAttribute("dicMap");
        DicValue dicValue = dicMap.get("stage").get(var.getStage());
        if (dicValue != null) {
            var.setStage(dicValue.getText());
        } else {
            var.setStage(null);
        }
    }

    public static void visible(Tran var) {
        Map<String, User> userMap = (Map<String, User>) CrmApplication.ac.getServletContext().getAttribute("userMap");
        Map<String, Map<String, DicValue>> dicMap = (Map<String, Map<String, DicValue>>) CrmApplication.ac.getServletContext().getAttribute("dicMap");
        User user = userMap.get(var.getOwner());
        if (user != null) {
            var.setOwner(user.getName());
        } else {
            var.setOwner(null);
        }
        DicValue dicValue = dicMap.get("transactionType").get(var.getType());
        if (dicValue != null) {
            var.setType(dicValue.getText());
        } else {
            var.setType(null);
        }
        dicValue = dicMap.get("source").get(var.getSource());
        if (dicValue != null) {
            var.setSource(dicValue.getText());
        } else {
            var.setSource(null);
        }
        dicValue = dicMap.get("stage").get(var.getStage());
        if (dicValue != null) {
            var.setStage(dicValue.getText());
        } else {
            var.setStage(null);
        }
    }

    public static void visible(Contacts var) {
        Map<String, User> userMap = (Map<String, User>) CrmApplication.ac.getServletContext().getAttribute("userMap");
        Map<String, Map<String, DicValue>> dicMap = (Map<String, Map<String, DicValue>>) CrmApplication.ac.getServletContext().getAttribute("dicMap");
        User user = userMap.get(var.getOwner());
        if (user != null) {
            var.setOwner(user.getName());
        } else {
            var.setOwner(null);
        }
        DicValue dicValue;
        dicValue = dicMap.get("source").get(var.getSource());
        if (dicValue != null) {
            var.setSource(dicValue.getText());
        } else {
            var.setSource(null);
        }
        dicValue = dicMap.get("appellation").get(var.getAppellation());
        if (dicValue != null) {
            var.setAppellation(dicValue.getText());
        } else {
            var.setAppellation(null);
        }
    }


}
