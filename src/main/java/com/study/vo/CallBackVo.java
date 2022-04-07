package com.study.vo;

public class CallBackVo {
    boolean success;
    String msg;

    public CallBackVo(boolean success, String msg) {
        this.success = success;
        this.msg = msg;
    }

    public CallBackVo() {
    }

    public boolean isSuccess() {
        return success;
    }

    public void setSuccess(boolean success) {
        this.success = success;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }
}
