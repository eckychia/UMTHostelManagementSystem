/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.Model;

/**
 *
 * @author User
 */
public class hostelApplication extends student{

    protected String studID;
    protected String condition;
    protected int merit;
    protected String status;
    protected String action;

    public hostelApplication() {
    }
    
    public hostelApplication(String studID, String condition, int merit) {
        super();
        this.studID = studID;
        this.condition = condition;
        this.merit = merit;
    }

    public hostelApplication(String studID, String condition, int merit, String status, String action) {
        super();
        this.studID = studID;
        this.condition = condition;
        this.merit = merit;
        this.status = status;
        this.action = action;
    }
    
    public hostelApplication(String studID, String name, String icno, String course, String email, String hpno, String condition, int merit, String status) {
        super(studID, name, icno, course, email, hpno);
        this.condition = condition;
        this.merit = merit;
        this.status = status;
    }

    public String getStudID() {
        return studID;
    }

    public void setStudID(String studID) {
        this.studID = studID;
    }

    public String getCondition() {
        return condition;
    }

    public void setCondition(String condition) {
        this.condition = condition;
    }

    public int getMerit() {
        return merit;
    }

    public void setMerit(int merit) {
        this.merit = merit;
    }
    
    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getAction() {
        return action;
    }

    public void setAction(String action) {
        this.action = action;
    }
    
    
}