/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.DAO;

import com.Model.newPassword;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 *
 * @author wongh
 */
public class newPasswordDAO {
    Connection connection = null;
    private String jdbcURL = "jdbc:mysql://localhost:3306/UMTHostelManagementSystem";
    private String jdbcUsername = "root";
    private String jdbcPassword = "admin";
    
    private static final String UPDATE_ADMIN_PASSWORD_SQL = "UPDATE admin SET password = ? WHERE name = ? AND password = ?";
    private static final String UPDATE_STAFF_PASSWORD_SQL = "UPDATE staffs SET password = ? WHERE staffID = ? AND password = ?";
    private static final String UPDATE_STUDENT_PASSWORD_SQL = "UPDATE student SET password = ? WHERE studID = ? AND password = ?";
    
    public newPasswordDAO(){
        
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
    
    public boolean updateAdminPassword(newPassword newPassword) throws SQLException {
        boolean rowUpdated;
        try (Connection connection = getConnection();
             PreparedStatement ps = connection.prepareStatement(UPDATE_ADMIN_PASSWORD_SQL);){
            ps.setString(1, newPassword.getNewPassword());
            ps.setString(2, newPassword.getName());
            ps.setString(3, newPassword.getOldPassword());
            
            rowUpdated = ps.executeUpdate() > 0;
        }
        return rowUpdated;
    }
    
    public boolean updateStaffPassword(newPassword newPassword) throws SQLException {
        boolean rowUpdated;
        try (Connection connection = getConnection();
             PreparedStatement ps = connection.prepareStatement(UPDATE_STAFF_PASSWORD_SQL);){
            ps.setString(1, newPassword.getNewPassword());
            ps.setString(2, newPassword.getName());
            ps.setString(3, newPassword.getOldPassword());
            
            rowUpdated = ps.executeUpdate() > 0;
        }
        return rowUpdated;
    }
    
    public boolean updateStudentPassword(newPassword newPassword) throws SQLException {
        boolean rowUpdated;
        try (Connection connection = getConnection();
             PreparedStatement ps = connection.prepareStatement(UPDATE_STUDENT_PASSWORD_SQL);){
            ps.setString(1, newPassword.getNewPassword());
            ps.setString(2, newPassword.getName());
            ps.setString(3, newPassword.getOldPassword());
            
            rowUpdated = ps.executeUpdate() > 0;
        }
        return rowUpdated;
    }
}
