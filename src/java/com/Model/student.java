/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.Model;

/**
 *
 * @author admin
 */
public class student {

    protected String studid;
    protected String name;
    protected String icno;
    protected String course;
    protected String email;
    protected String hpno;
    protected String password;
    
    public student() {}
    
    public student(String studid, String name, String icno, String course, String email, String hpno, String password) {
        super();
        this.studid = studid;
        this.name = name;
        this.icno = icno;
        this.course = course;
        this.email = email;
        this.hpno = hpno;
        this.password = password;
    }
    
    public student(String studid, String name, String icno, String course, String email, String hpno) {
        super();
        this.studid = studid;
        this.name = name;
        this.icno = icno;
        this.course = course;
        this.email = email;
        this.hpno = hpno;
    }

    public String getStudid() {
        return studid;
    }

    public void setStudid(String studid) {
        this.studid = studid;
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

    public String getCourse() {
        return course;
    }

    public void setCourse(String course) {
        this.course = course;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getHpno() {
        return hpno;
    }

    public void setHpno(String hpno) {
        this.hpno = hpno;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    
}
