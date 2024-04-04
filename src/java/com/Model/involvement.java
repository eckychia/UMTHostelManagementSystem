/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.Model;

import java.sql.Date;

/**
 *
 * @author wongh
 */
public class involvement extends merit{
    private String studID;
    private String meritID;
    private String role;
    private int merit;
    
    public involvement(){}
    
    public involvement(String studID, String meritID, String role, int merit){
        super();
        this.studID = studID;
        this.meritID = meritID;
        this.role = role;
        this.merit = merit;
    }
    
    public involvement(String meritID, String meritDesc, String category, String semester, Date date, String role, int merit, String studID){
        super(meritID, meritDesc, category, semester, date);
        this.role = role;
        this.merit = merit;
        this.studID = studID;
    }

    public String getStudID() {
        return studID;
    }

    public void setStudID(String studID) {
        this.studID = studID;
    }

    public String getMeritID() {
        return meritID;
    }

    public void setMeritID(String meritID) {
        this.meritID = meritID;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public int getMerit() {
        return merit;
    }

    public void setMerit(int merit) {
        this.merit = merit;
    }
    
}
