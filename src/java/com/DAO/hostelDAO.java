/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.DAO;

import com.Model.hostel;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class hostelDAO {
    Connection connection = null;
    private String jdbcURL = "jdbc:mysql://localhost:3306/UMTHostelManagementSystem";
    private String jdbcUsername = "root";
    private String jdbcPassword = "admin";
    
    private static final String INSERT_HOSTEL_SQL = "INSERT INTO hostel (hostelID, hostelDesc, noOfRoom, staffID) VALUES "
            + "(?, ?, ?, ?);";
    private static final String SELECT_ALL_HOSTELS = "SELECT * FROM hostel;";
    private static final String SELECT_HOSTEL_BY_ID = "SELECT * FROM hostel WHERE hostelID = ?;";
    private static final String UPDATE_HOSTEL_SQL = "UPDATE hostel SET hostelDesc = ?, noOfRoom = ?, staffID = ?"
            + " WHERE hostelID = ?;";
    private static final String DELETE_HOSTEL_SQL = "DELETE FROM hostel WHERE hostelID = ?;";
    
    public hostelDAO(){
        
    }
    
    protected Connection getConnection(){
        Connection connection = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
        } catch (SQLException e){
            e.printStackTrace();
        } catch (ClassNotFoundException e){
            e.printStackTrace();
        }
        return connection;
    }
    
    public void insertHostel(hostel hostel) throws SQLException {
        System.out.println(INSERT_HOSTEL_SQL);
        try (Connection connection = getConnection();
             PreparedStatement ps = connection.prepareStatement(INSERT_HOSTEL_SQL);){
            ps.setString(1, hostel.getHostelID());
            ps.setString(2, hostel.getHostelDesc());
            ps.setInt(3, hostel.getNoOfRoom());
            ps.setString(4, hostel.getStaffID());
            System.out.println(ps);
            ps.executeUpdate();
        } catch (SQLException e){
            e.printStackTrace();
        } 
    }
    
    public List <hostel> selectAllHostels() {
        List <hostel> hostels = new ArrayList<>();
        try (Connection connection = getConnection();
             PreparedStatement ps = connection.prepareStatement(SELECT_ALL_HOSTELS);){
            ResultSet rs = ps.executeQuery();
            
            while (rs.next()) {
                String hostelID = rs.getString("hostelID");
                String hostelDesc = rs.getString("hostelDesc");
                int noOfRoom = rs.getInt("noOfRoom");
                String staffID = rs.getString("staffID");
                hostels.add(new hostel(hostelID, hostelDesc, noOfRoom, staffID));
            }
        } catch (SQLException e){
            e.printStackTrace();
        }
        return hostels;
    }
    
    public hostel selectHostel(String hostelID) {
        hostel hostel = null;
        try (Connection connection = getConnection();
             PreparedStatement ps = connection.prepareStatement(SELECT_HOSTEL_BY_ID);){
            ps.setString(1, hostelID);
            System.out.println(ps);
            
            ResultSet rs = ps.executeQuery();
            
            while (rs.next()){
                String hostelDesc = rs.getString("hostelDesc");
                int noOfRoom = rs.getInt("noOfRoom");
                String staffID = rs.getString("staffID");
                hostel = new hostel(hostelID, hostelDesc, noOfRoom, staffID);
            }
        } catch (SQLException e){
            e.printStackTrace();
        }
        return hostel;
    }
    
    public boolean updateHostel(hostel hostel) throws SQLException {
        boolean rowUpdated;
        try (Connection connection = getConnection();
             PreparedStatement ps = connection.prepareStatement(UPDATE_HOSTEL_SQL);){
            ps.setString(1, hostel.getHostelDesc());
            ps.setInt(2, hostel.getNoOfRoom());
            ps.setString(3, hostel.getStaffID());
            ps.setString(4, hostel.getHostelID());
            
            rowUpdated = ps.executeUpdate() > 0;
        }
        return rowUpdated;
    }
    
    public boolean deleteHostel(String hostelID) throws SQLException {
        boolean rowDeleted;
        try (Connection connection = getConnection();
             PreparedStatement ps = connection.prepareStatement(DELETE_HOSTEL_SQL);){
            ps.setString(1, hostelID);
            rowDeleted = ps.executeUpdate() > 0;
        }
        return rowDeleted;
    }
    
    private void printSQLException(SQLException ex) {
        for (Throwable e:ex) {
            if (e instanceof SQLException) {
                e.printStackTrace(System.err);
                System.err.println("SQLState: " + ((SQLException) e).getSQLState());
                System.err.println("Error Code: " + ((SQLException) e).getErrorCode());
                System.err.println("Message: " + ((SQLException) e).getMessage());
                Throwable t = ex.getCause();
                while (t != null) {
                    System.out.println("Cause: " + t);
                    t = t.getCause();
                }
            }
        }
    }
}
