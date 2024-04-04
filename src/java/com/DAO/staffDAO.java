/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.DAO;

/**
 *
 * @author Lau Yong
 */

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.Model.staff;

public class staffDAO {
    Connection connection = null;
    private String jdbcURL = "jdbc:mysql://localhost/UMTHostelManagementSystem";
    private String jdbcUsername = "root";
    private String jdbcPassword = "admin";
    
    private static final String INSERT_STAFF_SQL = "INSERT INTO staffs (staffID, staffName, IC, email, hpNo, password) VALUES " + " (?, ?, ?, ?, ?, ?);";
    
    private static final String SELECT_STAFF_BY_ID = "select staffID, staffName, IC, email, hpNo, password from staffs where staffID =?";
    private static final String SELECT_ALL_STAFF = "select * from staffs";
    private static final String DELETE_STAFF_SQL = "delete from staffs where staffID = ?;";
    private static final String UPDATE_STAFF_SQL = "update staffs set staffName = ?, IC = ?, email = ?, hpNo = ?, password = ? where staffID = ?;";
    private static final String UPDATE_STAFF_PROFILE_SQL = "update staffs set staffName = ?, IC = ?, email = ?, hpNo = ? where staffID = ?;";
    
    public staffDAO() {}
    
    protected Connection getConnection() {
        Connection connection = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
        } catch (SQLException e) {
            //TODO Auto-generated catch block
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            //TODO Auto-generated catch block
            e.printStackTrace();
        }
        return connection;
    }
    
    public void insertStaff(staff staff) throws SQLException {
        System.out.println(INSERT_STAFF_SQL);
        //try-with-resource statement will auto close the connection
        try (Connection connection = getConnection(); PreparedStatement preparedStatement =
                connection.prepareStatement(INSERT_STAFF_SQL)) {
            preparedStatement.setString(1, staff.getStaffid());
            preparedStatement.setString(2, staff.getName());
            preparedStatement.setString(3, staff.getIcno());
            preparedStatement.setString(4, staff.getEmail());
            preparedStatement.setString(5, staff.getHpNo());
            preparedStatement.setString(6, staff.getPassword());
            System.out.println(preparedStatement);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            printSQLException(e);
        }
    }
    
    public staff selectStaff(String staffID) {
        staff staff = null;
        //Step 1: Establishing a connection
        try (Connection connection = getConnection();
                
            //Step 2: Create a statement using connection object
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_STAFF_BY_ID);) {
            preparedStatement.setString(1, staffID);
            System.out.println(preparedStatement);
            //Step 3: Execute the query or update query
            ResultSet rs = preparedStatement.executeQuery();
            
            //Step 4: Process the ResultSet object.
            while(rs.next()) {
                String staffid = rs.getString("staffID");
                String name = rs.getString("staffName");
                String icno = rs.getString("IC");
                String email = rs.getString("email");
                String hpNo = rs.getString("hpNo");
                String password = rs.getString("password");
                staff = new staff(staffid, name, icno, email, hpNo, password);
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return staff;
    }
    
    public List < staff > selectAllStaff() {
        
        //using try-with-resources to avoid closing resources {boiler plate code}
        List < staff > staffs = new ArrayList < > ();
        //Step 1: Establishing a Connection
        try(Connection connection = getConnection();
                
            //Step 2: Create a statement using connection object
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_STAFF);) {
            System.out.println(preparedStatement);
            //Step 3: Execute the query or update query
            ResultSet rs = preparedStatement.executeQuery();
            
            //Step 4: Process the ResultSet object.
            while(rs.next()) {
                String staffid = rs.getString("staffID");
                String name = rs.getString("staffName");
                String icno = rs.getString("IC");
                String email = rs.getString("email");
                String hpNo = rs.getString("hpNo");
                String password = rs.getString("password");
                staffs.add(new staff(staffid, name, icno, email, hpNo, password));
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return staffs;
    }
    
    public boolean deleteStaff(String staffID) throws SQLException {
        boolean rowDeleted;
        try (Connection connection = getConnection(); PreparedStatement statement =
                connection.prepareStatement(DELETE_STAFF_SQL);) {
            statement.setString(1, staffID);
            rowDeleted = statement.executeUpdate() > 0;
        }
        return rowDeleted;
    }
        
        
    public boolean updateStaff(staff staff) throws SQLException {
        boolean rowUpdated;
        try (Connection connection = getConnection(); PreparedStatement statement =
                connection.prepareStatement(UPDATE_STAFF_SQL);) {
            statement.setString(1, staff.getName());
            statement.setString(2, staff.getIcno());
            statement.setString(3, staff.getEmail());
            statement.setString(4, staff.getHpNo());
            statement.setString(5, staff.getPassword());
            statement.setString(6, staff.getStaffid());
            
            rowUpdated = statement.executeUpdate() > 0;
        }
        return rowUpdated;
    }
    
    public boolean updateStaffProfile(staff staff) throws SQLException {
        boolean rowUpdated;
        try (Connection connection = getConnection(); PreparedStatement statement =
                connection.prepareStatement(UPDATE_STAFF_PROFILE_SQL);) {
            statement.setString(1, staff.getName());
            statement.setString(2, staff.getIcno());
            statement.setString(3, staff.getEmail());
            statement.setString(4, staff.getHpNo());
            statement.setString(5, staff.getStaffid());
            
            rowUpdated = statement.executeUpdate() > 0;
        }
        return rowUpdated;
    }
    
    private void printSQLException(SQLException ex) {
        for (Throwable e: ex) {
            if (e instanceof SQLException) {
                e.printStackTrace(System.err);
                System.err.println("SQLState: " + ((SQLException) e).getSQLState());
                System.err.println("Error Code: " + ((SQLException) e).getErrorCode());
                System.err.println("Message: " + e.getMessage());
                Throwable t = ex.getCause();
                while (t != null) {
                    System.out.println("Cause: " + t);
                    t = t.getCause();
                }
            }
        }
    }
}