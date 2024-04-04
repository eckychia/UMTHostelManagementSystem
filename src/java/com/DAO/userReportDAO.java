/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.DAO;

/**
 *
 * @author admin
 */

import com.Model.hostel;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


public class userReportDAO {
    Connection connection = null;
    private String jdbcURL = "jdbc:mysql://localhost:3306/umthostelmanagementsystem";
    private String jdbcUsername = "root";
    private String jdbcPassword = "admin";
    
    private static final String COUNT_ADMIN = "select count(*) AS totalAdmin from admin;";
    private static final String COUNT_STAFF = "select count(*) AS totalStaff from staffs;";
    private static final String COUNT_STUDENT = "select count(*) AS totalStudent from student;";
    private static final String COUNT_HOSTEL = "select count(*) AS totalHostel from hostel;";
    private static final String HOSTEL_STAFF = "SELECT h.hostelDesc, s.staffID "
            + "FROM hostel h INNER JOIN staffs s ON s.staffID = h.staffID ";
    private static final String HOSTEL_STAFFa = "SELECT * FROM hostel";
    private static final String COUNT_ROOM = "select count(*) AS totalRoom from room;";
    private static final String MAX_MERIT = "SELECT SUM(merit) as summerit from involvement GROUP BY studID order by summerit desc limit 1;";
    private static final String MIN_MERIT = "SELECT SUM(merit) as minsummerit from involvement GROUP BY studID order by minsummerit asc limit 1;";
    private static final String COUNT_HOSTEL_APPLICATION = "select count(*) as totalHostelApplication from hostelapplication";
    private static final String COUNT_ROOM_APPLICATION = "select count(*) AS totalRoomApplication from roomapplication;";
    
    public userReportDAO(){
        
    }
    
    protected Connection getConnection() {
        Connection connection = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return connection;
    }
    
    public int totalAdmin() throws SQLException {
        int totalAdmin = 0;
        try (Connection connection = getConnection();
             PreparedStatement ps = connection.prepareStatement(COUNT_ADMIN)){
            //ps.setString(1, id);
            System.out.println(ps);
            
            ResultSet rs = ps.executeQuery();
            
            while (rs.next()){
                totalAdmin = rs.getInt("totalAdmin");
            }
        } catch (SQLException e){
            e.printStackTrace();
        }
        return totalAdmin;
    } 
    
    public int totalStaff() throws SQLException {
        int totalStaff = 0;
        try (Connection connection = getConnection();
             PreparedStatement ps = connection.prepareStatement(COUNT_STAFF)){
            //ps.setString(1, id);
            System.out.println(ps);
            
            ResultSet rs = ps.executeQuery();
            
            while (rs.next()){
                totalStaff = rs.getInt("totalStaff");
            }
        } catch (SQLException e){
            e.printStackTrace();
        }
        return totalStaff;
    } 
    
    public int totalStudent() throws SQLException {
        int totalStudent = 0;
        try (Connection connection = getConnection();
             PreparedStatement ps = connection.prepareStatement(COUNT_STUDENT)){
            //ps.setString(1, id);
            System.out.println(ps);
            
            ResultSet rs = ps.executeQuery();
            
            while (rs.next()){
                totalStudent = rs.getInt("totalStudent");
            }
        } catch (SQLException e){
            e.printStackTrace();
        }
        return totalStudent;
    } 
    
    public int totalApplication() throws SQLException {
        int totalAdmin = 0;
        try (Connection connection = getConnection();
             PreparedStatement ps = connection.prepareStatement(COUNT_ADMIN)){
            //ps.setString(1, id);
            System.out.println(ps);
            
            ResultSet rs = ps.executeQuery();
            
            while (rs.next()){
                totalAdmin = rs.getInt("totalAdmin");
            }
        } catch (SQLException e){
            e.printStackTrace();
        }
        return totalAdmin;
    } 
    
    public int totalHostel() throws SQLException {
        int totalHostel = 0;
        try (Connection connection = getConnection();
             PreparedStatement ps = connection.prepareStatement(COUNT_HOSTEL)){
            //ps.setString(1, id);
            System.out.println(ps);
            
            ResultSet rs = ps.executeQuery();
            
            while (rs.next()){
                totalHostel = rs.getInt("totalHostel");
            }
        } catch (SQLException e){
            e.printStackTrace();
        }
        return totalHostel;
    }   
    
    public int totalRoom() throws SQLException {
        int totalRoom = 0;
        try (Connection connection = getConnection();
             PreparedStatement ps = connection.prepareStatement(COUNT_ROOM)){
            //ps.setString(1, id);
            System.out.println(ps);
            
            ResultSet rs = ps.executeQuery();
            
            while (rs.next()){
                totalRoom = rs.getInt("totalRoom");
            }
        } catch (SQLException e){
            e.printStackTrace();
        }
        return totalRoom;
    } 
    
    public int maxMerit() throws SQLException {
        int maxMerit = 0;
        try (Connection connection = getConnection();
             PreparedStatement ps = connection.prepareStatement(MAX_MERIT)){
            System.out.println(ps);
            
            ResultSet rs = ps.executeQuery();
            
            while (rs.next()){
                maxMerit = rs.getInt("summerit");
            }
        } catch (SQLException e){
            e.printStackTrace();
        }
        return maxMerit;
    }
    
    
    public int minMerit() throws SQLException {
        int minMerit = 0;
        try (Connection connection = getConnection();
             PreparedStatement ps = connection.prepareStatement(MIN_MERIT)){
            System.out.println(ps);
            
            ResultSet rs = ps.executeQuery();
            
            while (rs.next()){
                minMerit = rs.getInt("minsummerit");
            }
        } catch (SQLException e){
            e.printStackTrace();
        }
        return minMerit;
    }
 
    
    
        public int totalHostelApplication() throws SQLException {
        int totalHostelApplication = 0;
        try (Connection connection = getConnection();
             PreparedStatement ps = connection.prepareStatement(COUNT_HOSTEL_APPLICATION)){
            //ps.setString(1, id);
            System.out.println(ps);
            
            ResultSet rs = ps.executeQuery();
            
            while (rs.next()){
                totalHostelApplication = rs.getInt("totalHostelApplication");
            }
        } catch (SQLException e){
            e.printStackTrace();
        }
        return totalHostelApplication;
    } 
        
        public int totalRoomApplication() throws SQLException {
        int totalRoomApplication = 0;
        try (Connection connection = getConnection();
             PreparedStatement ps = connection.prepareStatement(COUNT_ROOM_APPLICATION)){
            //ps.setString(1, id);
            System.out.println(ps);
            
            ResultSet rs = ps.executeQuery();
            
            while (rs.next()){
                totalRoomApplication = rs.getInt("totalRoomApplication");
            }
        } catch (SQLException e){
            e.printStackTrace();
        }
        return totalRoomApplication;
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
