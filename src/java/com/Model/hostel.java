/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.Model;

public class hostel {
    private String hostelID;
    private String hostelDesc;
    private int noOfRoom;
    private String staffID;
    
    public hostel(){}
    
    public hostel(String hostelID, String hostelDesc, int noOfRoom, String staffID){
        super();
        this.hostelID = hostelID;
        this.hostelDesc = hostelDesc;
        this.noOfRoom = noOfRoom;
        this.staffID = staffID;
    }

    public String getHostelID() {
        return hostelID;
    }

    public void setHostelID(String hostelID) {
        this.hostelID = hostelID;
    }

    public String getHostelDesc() {
        return hostelDesc;
    }

    public void setHostelDesc(String hostelDesc) {
        this.hostelDesc = hostelDesc;
    }

    public int getNoOfRoom() {
        return noOfRoom;
    }

    public void setNoOfRoom(int noOfRoom) {
        this.noOfRoom = noOfRoom;
    }

    public String getStaffID() {
        return staffID;
    }

    public void setStaffID(String staffID) {
        this.staffID = staffID;
    }
       
}
