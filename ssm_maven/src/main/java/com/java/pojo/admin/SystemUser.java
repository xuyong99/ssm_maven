package com.java.pojo.admin;

import lombok.Data;
import org.hibernate.validator.constraints.URL;

import javax.validation.constraints.Pattern;

/**
 * description：
 * author：丁鹏
 * date：13:35
 */
public class SystemUser {
    private Long id1;
    private String headIcon1;
    private String account1;
    private String phone1;
    private String email1;
    private String uName1;
    private String pwd1;
    private String status1;
    private Long roleId1;

    public Long getId1() {
        return id1;
    }

    public void setId1(Long id1) {
        this.id1 = id1;
    }

    public String getHeadIcon1() {
        return headIcon1;
    }

    public void setHeadIcon1(String headIcon1) {
        this.headIcon1 = headIcon1;
    }

    public String getAccount1() {
        return account1;
    }

    public void setAccount1(String account1) {
        this.account1 = account1;
    }

    public String getPhone1() {
        return phone1;
    }

    public void setPhone1(String phone1) {
        this.phone1 = phone1;
    }

    public String getEmail1() {
        return email1;
    }

    public void setEmail1(String email1) {
        this.email1 = email1;
    }

    public String getuName1() {
        return uName1;
    }

    public void setuName1(String uName1) {
        this.uName1 = uName1;
    }

    public String getPwd1() {
        return pwd1;
    }

    public void setPwd1(String pwd1) {
        this.pwd1 = pwd1;
    }

    public String getStatus1() {
        return status1;
    }

    public void setStatus1(String status1) {
        this.status1 = status1;
    }

    public Long getRoleId1() {
        return roleId1;
    }

    public void setRoleId1(Long roleId1) {
        this.roleId1 = roleId1;
    }

    @Override
    public String toString() {
        return "SystemUser{" +
                "id1=" + id1 +
                ", headIcon1='" + headIcon1 + '\'' +
                ", account1='" + account1 + '\'' +
                ", phone1='" + phone1 + '\'' +
                ", email1='" + email1 + '\'' +
                ", uName1='" + uName1 + '\'' +
                ", pwd1='" + pwd1 + '\'' +
                ", status1='" + status1 + '\'' +
                ", roleId1=" + roleId1 +
                '}';
    }
}
