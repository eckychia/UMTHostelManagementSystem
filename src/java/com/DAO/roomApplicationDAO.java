/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.Model.roomApplication;
import java.sql.Date;

/**
 * Name: Evan Date: 20/5/2023 Bean: roomDAO.java
 */
public class roomApplicationDAO {

    Connection connection = null;
    private String jdbcURL = "jdbc:mysql://localhost:3306/UMTHostelManagementSystem";
    private String jdbcUsername = "root";
    private String jdbcPassword = "admin";

    private static final String INSERT_APPLICATION_SQL = "INSERT INTO roomApplication (studID, startDate, endDate, block, blockLevel, roomType, roomID, stuRequire) VALUES "
            + " (?, ?, ?, ?, ? , ?, ?, ?);";

    private static final String SELECT_APPLICATION_BY_ID = "select * from roomApplication where studID=?";
    private static final String SELECT_ALL_APPLICATION = "select * from roomApplication";
    private static final String SELECT_COUNT_BY_ID = "SELECT COUNT(*) FROM roomApplication WHERE studID = ? ";
    private static final String DELETE_APPLICATION_SQL = "delete from roomApplication where studID = ?;";
    private static final String UPDATE_APPLICATION_SQL = "update roomApplication set startDate = ?, endDate = ?, block = ?, blockLevel = ? , roomType= ?, roomID = ?, stuRequire = ? where studID = ?;";

    public roomApplicationDAO() {
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

    public void insertApplication(roomApplication application) throws SQLException {
        System.out.println(INSERT_APPLICATION_SQL);
        //try-with-resource statement will auto close the connection.
        try ( Connection connection = getConnection();  PreparedStatement preparedStatement
                = connection.prepareStatement(INSERT_APPLICATION_SQL)) {
            preparedStatement.setString(1, application.getStudID());
            preparedStatement.setDate(2, application.getStartDate());
            preparedStatement.setDate(3, application.getEndDate());
            preparedStatement.setString(4, application.getBlock());
            preparedStatement.setInt(5, application.getBlockLevel());
            preparedStatement.setString(6, application.getRoomType());
            preparedStatement.setString(7, application.getRoomNo());
            preparedStatement.setString(8, application.getStuRequire());
            System.out.println(preparedStatement);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            printSQLException(e);
        }
    }

    public roomApplication selectApplication(String studID) {
        roomApplication application = null;
        // Step 1: Establishing a Connection
        try ( Connection connection = getConnection(); // Step 2:Create a statement using connection object
                  PreparedStatement preparedStatement = connection.prepareStatement(SELECT_APPLICATION_BY_ID);) {
            preparedStatement.setString(1, studID);
            System.out.println(preparedStatement);
            // Step 3: Execute the query or update query
            ResultSet rs = preparedStatement.executeQuery();

            // Step 4: Process the ResultSet object.
            while (rs.next()) {
                Date startDate = rs.getDate("startDate");
                Date endDate = rs.getDate("endDate");
                String block = rs.getString("block");
                int blockLevel = rs.getInt("blockLevel");
                String roomType = rs.getString("roomType");
                String roomNo = rs.getString("roomID");
                String stuRequire = rs.getString("stuRequire");
                application = new roomApplication(studID, startDate, endDate, block, blockLevel, roomType, roomNo, stuRequire);
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return application;
    }

    public List< roomApplication> selectAllApplication() {

        // using try-with-resources to avoid closing resources (boiler plate code)
        List<roomApplication> applications = new ArrayList<>();
        // Step 1: Establising a Connection
        try ( Connection connection = getConnection(); // Step 2:Create a statement using connection object
                  PreparedStatement preparedStatement
                = connection.prepareStatement(SELECT_ALL_APPLICATION);) {
            System.out.println(preparedStatement);
            // Step 3: Execute the query or update query
            ResultSet rs = preparedStatement.executeQuery();

            // Step 4: Process the ResultSet object.
            while (rs.next()) {
                String studID = rs.getString("studID");
                String roomNo = rs.getString("roomID");
                Date startDate = rs.getDate("startDate");
                Date endDate = rs.getDate("endDate");
                String block = rs.getString("block");
                int blockLevel = rs.getInt("blockLevel");
                String roomType = rs.getString("roomType");
                String stuRequire = rs.getString("stuRequire");

                applications.add(new roomApplication(studID, startDate, endDate, block, blockLevel, roomType, roomNo, stuRequire));
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return applications;
    }

    public boolean deleteApplication(String studID) throws SQLException {
        boolean rowDeleted;
        try ( Connection connection = getConnection();  PreparedStatement statement
                = connection.prepareStatement(DELETE_APPLICATION_SQL);) {
            statement.setString(1, studID);
            rowDeleted = statement.executeUpdate() > 0;
        }
        return rowDeleted;
    }

    public boolean updateApplication(roomApplication application) throws SQLException {
        boolean rowUpdated;
        try ( Connection connection = getConnection();  PreparedStatement statement
                = connection.prepareStatement(UPDATE_APPLICATION_SQL);) {
            statement.setDate(1, application.getStartDate());
            statement.setDate(2, application.getEndDate());
            statement.setString(3, application.getBlock());
            statement.setInt(4, application.getBlockLevel());
            statement.setString(5, application.getRoomType());
            statement.setString(6, application.getRoomNo());
            statement.setString(7, application.getStuRequire());
            statement.setString(8, application.getStudID());

            rowUpdated = statement.executeUpdate() > 0;
        }
        return rowUpdated;
    }
    
    public int selectRoomApplicationCountByID(String studID) throws SQLException{
        int count = 0;
        try (Connection connection = getConnection(); // Step 2:Create a statement using connection object
                PreparedStatement preparedStatement = connection.prepareStatement(SELECT_COUNT_BY_ID);) {
            preparedStatement.setString(1, studID);
            System.out.println(preparedStatement);
            
            ResultSet rs = preparedStatement.executeQuery();
            
            while (rs.next()){
                count = rs.getInt("COUNT(*)");
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return count;
    }

    private void printSQLException(SQLException ex) {
        for (Throwable e : ex) {
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
