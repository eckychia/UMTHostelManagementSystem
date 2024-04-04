/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.Model;

/**
 *
 * @author wongh
 */
public class room {
    protected String roomID;
    protected int capacity;
    protected double feesPerNight;
    protected String hostelID;

    public room() {
    }

    public room(String roomID, int capacity, double feesPerNight, String hostelID) {
        super();
        this.roomID = roomID;
        this.capacity = capacity;
        this.feesPerNight = feesPerNight;
        this.hostelID = hostelID;

    }

    public String getRoomID() {
        return roomID;
    }

    public void setRoomID(String roomID) {
        this.roomID = roomID;
    }

    public int getCapacity() {
        return capacity;
    }

    public void setCapacity(int capacity) {
        this.capacity = capacity;
    }

    public double getFeesPerNight() {
        return feesPerNight;
    }

    public void setFeesPerNight(double feesPerNight) {
        this.feesPerNight = feesPerNight;
    }

    public String getHostelID() {
        return hostelID;
    }

    public void setHostelID(String hostelID) {
        this.hostelID = hostelID;
    }
    
}
