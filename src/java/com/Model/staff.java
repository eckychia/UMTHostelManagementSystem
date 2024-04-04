/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.Model;

/**
 *
 * @author admin
 */
public class staff {
    protected String staffid;
    protected String name;
    protected String icno;
    protected String email;
    protected String hpNo;
    protected String password;
    
    public staff() {}
    
    public staff(String staffid, String name, String icno, String email, String hpNo) {
        super();
        this.staffid = staffid;
        this.name = name;
        this.icno = icno;
        this.email = email;
        this.hpNo = hpNo;
    }
    
    public staff(String staffid, String name, String icno, String email, String hpNo, String password) {
        super();
        this.staffid = staffid;
        this.name = name;
        this.icno = icno;
        this.email = email;
        this.hpNo = hpNo;
        this.password = password;
    }

    public String getStaffid() {
        return staffid;
    }

    public void setStaffid(String staffid) {
        this.staffid = staffid;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getIcno() {
        return icno;
    }

    public void setIcno(String icno) {
        this.icno = icno;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getHpNo() {
        return hpNo;
    }

    public void setHpNo(String hpNo) {
        this.hpNo = hpNo;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    
    
}
