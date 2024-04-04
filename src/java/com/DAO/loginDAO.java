/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.DAO;

import com.Model.login;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author wongh
 */
public class loginDAO {
    Connection connection = null;
    private static String jdbcURL = "jdbc:mysql://localhost:3306/UMTHostelManagementSystem";
    private static String jdbcUsername = "root";
    private static String jdbcPassword = "admin";
    
    private static final String VALIDATE_ADMIN = "select * from admin where name=? and password=?";
    private static final String VALIDATE_STAFF = "select staffID, password from staffs where staffID=? and password=?";
    private static final String VALIDATE_STUDENT = "select studID, password from student where studID=? and password=?";
    
    public loginDAO() {
        
    }
    
    protected static Connection getConnection(){
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
    
    public static boolean validateAdmin(login bean) throws SQLException {
        boolean status = false;
        try (Connection connection = getConnection();
             PreparedStatement ps = connection.prepareStatement(VALIDATE_ADMIN);){
            ps.setString(1, bean.getUsername());
            ps.setString(2, bean.getPassword());
            
            ResultSet rs = ps.executeQuery();
            status = rs.next();
        } catch (Exception e) {
        }
        return status;
    }
    
    public static boolean validateStaff(login bean) throws SQLException {
        boolean status = false;
        try (Connection connection = getConnection();
             PreparedStatement ps = connection.prepareStatement(VALIDATE_STAFF);){
            ps.setString(1, bean.getUsername());
            ps.setString(2, bean.getPassword());
            
            ResultSet rs = ps.executeQuery();
            status = rs.next();
        } catch (Exception e) {
        }
        return status;
    }
    
    public static boolean validateStudent(login bean) throws SQLException {
        boolean status = false;
        try (Connection connection = getConnection();
             PreparedStatement ps = connection.prepareStatement(VALIDATE_STUDENT);){
            ps.setString(1, bean.getUsername());
            ps.setString(2, bean.getPassword());
            
            ResultSet rs = ps.executeQuery();
            status = rs.next();
        } catch (Exception e) {
        }
        return status;
    }
}
