/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.Model;

import java.sql.Date;

/**
 *
 * @author User
 */
public class roomApplication {

    protected String studID;
    protected Date startDate;
    protected Date endDate;
    protected String block;
    protected int blockLevel;
    protected String roomType;
    protected String roomNo;
    protected String stuRequire;

    public roomApplication() {
    }

    public roomApplication(String studID, Date startDate, Date endDate, String block, int blockLevel, String roomType, String roomNo, String stuRequire) {
        super();
        this.studID = studID;
        this.startDate = startDate;
        this.endDate = endDate;
        this.block = block;
        this.blockLevel = blockLevel;
        this.roomType = roomType;
        this.roomNo = roomNo;
        this.stuRequire = stuRequire;
    }

    public String getStudID() {
        return studID;
    }

    public void setStudID(String studID) {
        this.studID = studID;
    }

    public Date getStartDate() {
        return startDate;
    }

    public void setStartDate(Date startDate) {
        this.startDate = startDate;
    }

    public Date getEndDate() {
        return endDate;
    }

    public void setEndDate(Date endDate) {
        this.endDate = endDate;
    }

    public int getBlockLevel() {
        return blockLevel;
    }

    public void setBlockLevel(int blockLevel) {
        this.blockLevel = blockLevel;
    }

    public String getBlock() {
        return block;
    }

    public void setBlock(String block) {
        this.block = block;
    }

    public String getRoomType() {
        return roomType;
    }

    public void setRoomType(String roomType) {
        this.roomType = roomType;
    }

    public String getRoomNo() {
        return roomNo;
    }

    public void setRoomNo(String roomNo) {
        this.roomNo = roomNo;
    }

    public String getStuRequire() {
        return stuRequire;
    }

    public void setStuRequire(String stuRequire) {
        this.stuRequire = stuRequire;
    }

}
