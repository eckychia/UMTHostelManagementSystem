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
public class merit {
    private String meritID;
    private String meritDesc;
    private String category;
    private String semester;
    private Date date;
    
    public merit(){}
    
    public merit(String meritID, String meritDesc, String category, String semester, Date date){
        super();
        this.meritID = meritID;
        this.meritDesc = meritDesc;
        this.category = category;
        this.semester = semester;
        this.date = date;
    }

    public String getMeritID() {
        return meritID;
    }

    public void setMeritID(String meritID) {
        this.meritID = meritID;
    }

    public String getMeritDesc() {
        return meritDesc;
    }

    public void setMeritDesc(String meritDesc) {
        this.meritDesc = meritDesc;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public String getSemester() {
        return semester;
    }

    public void setSemester(String semester) {
        this.semester = semester;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

}
