package com.study.vo;

public class UserCondition {
    private String name;
    private String deptNo;
    private String lockState;
    private String lExpireTime;
    private String hExpireTime;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDeptNo() {
        return deptNo;
    }

    public void setDeptNo(String deptNo) {
        this.deptNo = deptNo;
    }

    public String getLockState() {
        return lockState;
    }

    public void setLockState(String lockState) {
        this.lockState = lockState;
    }

    public String getlExpireTime() {
        return lExpireTime;
    }

    public void setlExpireTime(String lExpireTime) {
        this.lExpireTime = lExpireTime;
    }

    public String gethExpireTime() {
        return hExpireTime;
    }

    public void sethExpireTime(String hExpireTime) {
        this.hExpireTime = hExpireTime;
    }
}
