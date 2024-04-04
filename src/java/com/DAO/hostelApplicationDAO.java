/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.DAO;

/**
 *
 * @author User
 */
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.Model.hostelApplication;

/**
 * Name: Evan Date: 20/5/2023 Bean: roomDAO.java
 */
public class hostelApplicationDAO {

    Connection connection = null;
    private String jdbcURL = "jdbc:mysql://localhost:3306/umthostelmanagementsystem";
    private String jdbcUsername = "root";
    private String jdbcPassword = "admin";

    private static final String INSERT_HOSTELAPPLY_SQL = "INSERT INTO hostelApplication (studID, `condition`, merit) VALUES "
            + " (?, ?, ?);";

    private static final String SELECT_HOSTELAPPLY_BY_NO = "select studID, `condition`, merit, `status`, `action` from hostelApplication where studID=?";
    private static final String SELECT_HOSTEL_STATUS_BY_ID = "SELECT s.studName, s.IC, s.studID, s.course, s.email, s.hpNo, h.merit, h.condition, h.status\n" +
            "FROM student s INNER JOIN hostelapplication h ON s.studID = h.studID where s.studID =?";
    private static final String SELECT_STATUS_BY_ID = "SELECT COUNT(*) FROM hostelApplication WHERE studID = ? ";
    private static final String SELECT_ACTION_BY_ID = "SELECT action FROM hostelApplication WHERE studID = ? ";
    private static final String SELECT_ALL_HOSTELAPPLY = "select * from hostelApplication";
    private static final String DELETE_HOSTELAPPLY_SQL = "delete from hostelApplication where studID = ?;";
    private static final String UPDATE_HOSTELAPPLY_SQL = "update hostelApplication set `condition` = ?, merit = ?, `status` = ?, `action` = ? where studID = ?;";
    private static final String UPDATE_ACTION_SQL = "UPDATE hostelApplication set `action` = ? WHERE studID = ?";
    private static final String UPDATE_STATUS_SQL = "UPDATE hostelApplication AS h\n"
            + "JOIN (\n"
            + "  SELECT studID\n"
            + "  FROM hostelapplication\n"
            + "  ORDER BY `condition` DESC, merit DESC\n"
            + "  LIMIT ?\n"
            + ") AS subquery ON h.studID = subquery.studID\n"
            + "SET h.`status` = 'Successful';";

    public hostelApplicationDAO() {
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

    public void insertHostelApplication(hostelApplication hostelApplication) throws SQLException {
        System.out.println(INSERT_HOSTELAPPLY_SQL);
        //try-with-resource statement will auto close the connection.
        try (Connection connection = getConnection(); PreparedStatement preparedStatement
                = connection.prepareStatement(INSERT_HOSTELAPPLY_SQL)) {
            preparedStatement.setString(1, hostelApplication.getStudID());
            preparedStatement.setString(2, hostelApplication.getCondition());
            preparedStatement.setInt(3, hostelApplication.getMerit());

            System.out.println(preparedStatement);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            printSQLException(e);
        }
    }

    public hostelApplication selectHostelApplication(String studID) {
        hostelApplication hostelApplication = null;
        // Step 1: Establishing a Connection
        try (Connection connection = getConnection(); // Step 2:Create a statement using connection object
                PreparedStatement preparedStatement = connection.prepareStatement(SELECT_HOSTELAPPLY_BY_NO);) {
            preparedStatement.setString(1, studID);
            System.out.println(preparedStatement);
            // Step 3: Execute the query or update query
            ResultSet rs = preparedStatement.executeQuery();

            // Step 4: Process the ResultSet object.
            while (rs.next()) {

                String condition = rs.getString("condition");
                int merit = rs.getInt("merit");
                String status = rs.getString("status");
                String action = rs.getString("action");

                hostelApplication = new hostelApplication(studID, condition, merit, status, action);
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return hostelApplication;
    }
    
    public int selectOnlyHostelStatusByID(String studID) throws SQLException{
        int count = 0;
        try (Connection connection = getConnection(); // Step 2:Create a statement using connection object
                PreparedStatement preparedStatement = connection.prepareStatement(SELECT_STATUS_BY_ID);) {
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
    
    public String selectOnlyActionByID(String studID) throws SQLException{
        String action = null;
        try (Connection connection = getConnection(); // Step 2:Create a statement using connection object
                PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ACTION_BY_ID);) {
            preparedStatement.setString(1, studID);
            System.out.println(preparedStatement);
            
            ResultSet rs = preparedStatement.executeQuery();
            
            while (rs.next()){
                action = rs.getString("action");
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return action;
    }
    
    public hostelApplication selectHostelStatusByID(String studID) throws SQLException{
        hostelApplication hostelApplication = null;
        try (Connection connection = getConnection(); // Step 2:Create a statement using connection object
                PreparedStatement preparedStatement = connection.prepareStatement(SELECT_HOSTEL_STATUS_BY_ID);) {
            preparedStatement.setString(1, studID);
            System.out.println(preparedStatement);
            
            ResultSet rs = preparedStatement.executeQuery();
            
            while (rs.next()){
                String name = rs.getString("studName");
                String IC = rs.getString("IC");
                String course = rs.getString("course");
                String email = rs.getString("email");
                String hpNo = rs.getString("hpNo");
                String condition = rs.getString("condition");
                int merit = rs.getInt("merit");
                String status = rs.getString("status");
                hostelApplication = new hostelApplication(studID, name, IC, course, email, hpNo, condition, merit, status);
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return hostelApplication;
    }

    public List<hostelApplication> selectAllHostelApplication() {

        // using try-with-resources to avoid closing resources (boiler plate code)
        List<hostelApplication> hostelApplications = new ArrayList<>();
        // Step 1: Establising a Connection
        try (Connection connection = getConnection(); // Step 2:Create a statement using connection object
                PreparedStatement preparedStatement
                = connection.prepareStatement(SELECT_ALL_HOSTELAPPLY);) {
            System.out.println(preparedStatement);
            // Step 3: Execute the query or update query
            ResultSet rs = preparedStatement.executeQuery();

            // Step 4: Process the ResultSet object.
            while (rs.next()) {

                String studID = rs.getString("studID");
                String condition = rs.getString("condition");
                int merit = rs.getInt("merit");
                String status = rs.getString("status");
                String action = rs.getString("action");

                hostelApplications.add(new hostelApplication(studID, condition, merit, status, action));
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return hostelApplications;
    }

    public boolean deleteHostelApplication(String studID) throws SQLException {
        boolean rowDeleted;
        try (Connection connection = getConnection(); PreparedStatement statement
                = connection.prepareStatement(DELETE_HOSTELAPPLY_SQL);) {
            statement.setString(1, studID);
            rowDeleted = statement.executeUpdate() > 0;
        }
        return rowDeleted;
    }

    public boolean updateHostelApplication(hostelApplication hostelApplication) throws SQLException {
        boolean rowUpdated;
        try (Connection connection = getConnection(); PreparedStatement statement
                = connection.prepareStatement(UPDATE_HOSTELAPPLY_SQL);) {

            statement.setString(1, hostelApplication.getCondition());
            statement.setInt(2, hostelApplication.getMerit());
            statement.setString(3, hostelApplication.getStatus());
            statement.setString(4, hostelApplication.getAction());
            statement.setString(5, hostelApplication.getStudID());

            rowUpdated = statement.executeUpdate() > 0;
        }
        return rowUpdated;
    }
    
    public boolean updateStatusHostelApplication(int limit) throws SQLException {
        boolean rowUpdated;
        try (Connection connection = getConnection(); PreparedStatement statement
                = connection.prepareStatement(UPDATE_STATUS_SQL);) {
            statement.setInt(1, limit);
            
            rowUpdated = statement.executeUpdate() > 0;
        }
        return rowUpdated;
    }
    
    public boolean updateHostelApplicationAction(String studID, String act) throws SQLException {
        boolean rowUpdated;
        try (Connection connection = getConnection(); PreparedStatement statement
                = connection.prepareStatement(UPDATE_ACTION_SQL);) {
            statement.setString(1, act);
            statement.setString(2, studID);
            
            rowUpdated = statement.executeUpdate() > 0;
        }
        return rowUpdated;
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
