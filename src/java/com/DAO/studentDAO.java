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

import com.Model.student;

public class studentDAO {
    Connection connection = null;
    private String jdbcURL = "jdbc:mysql://localhost/umthostelmanagementsystem";
    private String jdbcUsername = "root";
    private String jdbcPassword = "admin";
    
    private static final String INSERT_STUDENT_SQL = "INSERT INTO student (studID, studName, IC, course, email, hpNo, password) VALUES " + " (?, ?, ?, ?, ?, ?, ?);";
    
    private static final String SELECT_STUDENT_BY_ID = "select studID, studName, IC, course, email, hpNo, password from student where studID =?";
    private static final String SELECT_ALL_STUDENT = "select * from student";
    private static final String DELETE_STUDENT_SQL = "delete from student where studID = ?;";
    private static final String UPDATE_STUDENT_SQL = "update student set studName = ?, IC = ?, course=?, email = ?, hpNo=?, password = ? where studID = ?;";
    private static final String UPDATE_STUDENT_PROFILE_SQL = "update student set studName = ?, IC = ?, course = ?, email = ?, hpNo = ? where studID = ?;";
    
    public studentDAO() {}
    
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
    
    public void insertStudent(student student) throws SQLException {
        System.out.println(INSERT_STUDENT_SQL);
        //try-with-resource statement will auto close the connection
        try (Connection connection = getConnection(); PreparedStatement preparedStatement =
                connection.prepareStatement(INSERT_STUDENT_SQL)) {
            preparedStatement.setString(1, student.getStudid());
            preparedStatement.setString(2, student.getName());
            preparedStatement.setString(3, student.getIcno());
            preparedStatement.setString(4, student.getCourse());
            preparedStatement.setString(5, student.getEmail());
            preparedStatement.setString(6, student.getHpno());
            preparedStatement.setString(7, student.getPassword());
            System.out.println(preparedStatement);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            printSQLException(e);
        }
    }
    
    public student selectStudent(String studID) {
        student student = null;
        //Step 1: Establishing a connection
        try (Connection connection = getConnection();
                
            //Step 2: Create a statement using connection object
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_STUDENT_BY_ID);) {
            preparedStatement.setString(1, studID);
            System.out.println(preparedStatement);
            //Step 3: Execute the query or update query
            ResultSet rs = preparedStatement.executeQuery();
            
            //Step 4: Process the ResultSet object.
            while(rs.next()) {
                String studid = rs.getString("studID");
                String name = rs.getString("studName");
                String icno = rs.getString("IC");
                String course = rs.getString("course");
                String email = rs.getString("email");
                String hpno = rs.getString("hpNo");
                String password = rs.getString("password");
                student = new student(studid, name, icno, course, email, hpno, password);
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return student;
    }
    
    public List < student > selectAllStudent() {
        
        //using try-with-resources to avoid closing resources {boiler plate code}
        List < student > students = new ArrayList < > ();
        //Step 1: Establishing a Connection
        try(Connection connection = getConnection();
                
            //Step 2: Create a statement using connection object
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_STUDENT);) {
            System.out.println(preparedStatement);
            //Step 3: Execute the query or update query
            ResultSet rs = preparedStatement.executeQuery();
            
            //Step 4: Process the ResultSet object.
            while(rs.next()) {
                String studid = rs.getString("studID");
                String name = rs.getString("studName");
                String icno = rs.getString("IC");
                String course = rs.getString("course");
                String email = rs.getString("email");
                String hpno = rs.getString("hpNo");
                String password = rs.getString("password");
                students.add(new student(studid, name, icno, course, email, hpno, password));
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return students;
    }
    
    public boolean deleteStudent(String studID) throws SQLException {
        boolean rowDeleted;
        try (Connection connection = getConnection(); PreparedStatement statement =
                connection.prepareStatement(DELETE_STUDENT_SQL);) {
            statement.setString(1, studID);
            rowDeleted = statement.executeUpdate() > 0;
        }
        return rowDeleted;
    }
        
        
    public boolean updateStudent(student student) throws SQLException {
        boolean rowUpdated;
        try (Connection connection = getConnection(); PreparedStatement statement =
                connection.prepareStatement(UPDATE_STUDENT_SQL);) {
            statement.setString(1, student.getName());
            statement.setString(2, student.getIcno());
            statement.setString(3, student.getCourse());
            statement.setString(4, student.getEmail());
            statement.setString(5, student.getHpno());
            statement.setString(6, student.getPassword());
            statement.setString(7, student.getStudid());
            
            rowUpdated = statement.executeUpdate() > 0;
        }
        return rowUpdated;
    }
    
    public boolean updateStudentProfile(student student) throws SQLException {
        boolean rowUpdated;
        try (Connection connection = getConnection(); PreparedStatement statement =
                connection.prepareStatement(UPDATE_STUDENT_PROFILE_SQL);) {
            statement.setString(1, student.getName());
            statement.setString(2, student.getIcno());
            statement.setString(3, student.getCourse());
            statement.setString(4, student.getEmail());
            statement.setString(5, student.getHpno());
            statement.setString(6, student.getStudid());
            
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