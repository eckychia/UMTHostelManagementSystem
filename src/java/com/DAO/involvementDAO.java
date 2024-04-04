/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.DAO;

import com.Model.involvement;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class involvementDAO {
    Connection connection = null;
    private String jdbcURL = "jdbc:mysql://localhost:3306/UMTHostelManagementSystem";
    private String jdbcUsername = "root";
    private String jdbcPassword = "admin";
    
    private static final String INSERT_INVOLVEMENT_SQL = "INSERT INTO involvement (studID, meritID, role, merit) VALUES "
            + "(?, ?, ?, ?);";
    private static final String SELECT_ALL_INVOLVEMENTS = "SELECT * FROM involvement;";
    private static final String SELECT_INVOLVEMENT = "SELECT * FROM involvement WHERE studID = ? AND meritID = ?;";
    private static final String SELECT_INVOLVEMENT_BY_MERIT_ID = "SELECT * FROM involvement WHERE meritID = ?;";
    private static final String SELECT_INVOLVEMENT_BY_STUDENT_ID = "SELECT m.meritID, m.meritDesc, m.category, m.semester, m.date, i.role, i.merit "
            + "FROM merit m INNER JOIN involvement i ON m.meritID = i.meritID "
            + "WHERE studID = ?;";
    private static final String UPDATE_INVOLVEMENT_SQL = "UPDATE involvement SET role = ?, merit = ?"
            + " WHERE studID = ? AND meritID = ?;";
    private static final String DELETE_INVOLVEMENT_SQL = "DELETE FROM involvement WHERE studID = ? AND meritID = ?;";
    private static final String SUM_INVOLVEMENT_BY_STUDENT_ID = "SELECT SUM(merit) AS totalMerit FROM involvement WHERE studID = ?;";
    private static final String SELECT_TARGET_MERIT = "SELECT t.totalMerit AS targetMerit FROM (SELECT SUM(merit) AS totalMerit FROM involvement GROUP BY studID ORDER BY totalMerit DESC LIMIT 2) AS t ORDER BY totalMerit ASC LIMIT 1;";
    
    public involvementDAO(){
        
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
    
    public void insertInvolvement(involvement involvement) throws SQLException {
        System.out.println(INSERT_INVOLVEMENT_SQL);
        try (Connection connection = getConnection();
             PreparedStatement ps = connection.prepareStatement(INSERT_INVOLVEMENT_SQL);){
            ps.setString(1, involvement.getStudID());
            ps.setString(2, involvement.getMeritID());
            ps.setString(3, involvement.getRole());
            ps.setInt(4, involvement.getMerit());
            System.out.println(ps);
            ps.executeUpdate();
        } catch (SQLException e){
            e.printStackTrace();
        } 
    }
    
    public List <involvement> selectAllInvolvements() {
        List <involvement> involvements = new ArrayList<>();
        try (Connection connection = getConnection();
             PreparedStatement ps = connection.prepareStatement(SELECT_ALL_INVOLVEMENTS);){
            ResultSet rs = ps.executeQuery();
            
            while (rs.next()) {
                String studID = rs.getString("studID");
                String meritID = rs.getString("meritID");
                String role = rs.getString("role");
                int merit = rs.getInt("merit");
                involvements.add(new involvement(studID, meritID, role, merit));
            }
        } catch (SQLException e){
            e.printStackTrace();
        }
        return involvements;
    }
    
    public involvement selectInvolvement(String studID, String meritID) {
        involvement involvements = null;
        try (Connection connection = getConnection();
             PreparedStatement ps = connection.prepareStatement(SELECT_INVOLVEMENT);){
            ps.setString(1, studID);
            ps.setString(2, meritID);
            System.out.println(ps);
            
            ResultSet rs = ps.executeQuery();
            
            while (rs.next()){
                
                String role = rs.getString("role");
                int merit = rs.getInt("merit");
                involvements = new involvement(studID, meritID, role, merit);
            }
        } catch (SQLException e){
            e.printStackTrace();
        }
        return involvements;
    }
    
    public List <involvement> selectInvolvementByMeritID(String meritID) {
        List <involvement> involvements = new ArrayList<>();
        try (Connection connection = getConnection();
             PreparedStatement ps = connection.prepareStatement(SELECT_INVOLVEMENT_BY_MERIT_ID);){
            ps.setString(1, meritID);
            System.out.println(ps);
            
            ResultSet rs = ps.executeQuery();
            
            while (rs.next()){
                String studID = rs.getString("studID");
                String role = rs.getString("role");
                int merit = rs.getInt("merit");
                involvements.add(new involvement(studID, meritID, role, merit));
            }
        } catch (SQLException e){
            e.printStackTrace();
        }
        return involvements;
    }
    
    public List <involvement> selectInvolvementByStudID(String studID) {
        List <involvement> involvements = new ArrayList<>();
        try (Connection connection = getConnection();
             PreparedStatement ps = connection.prepareStatement(SELECT_INVOLVEMENT_BY_STUDENT_ID);){
            ps.setString(1, studID);
            System.out.println(ps);
            
            ResultSet rs = ps.executeQuery();
            
            while (rs.next()){
                String meritID = rs.getString("meritID");
                String meritDesc = rs.getString("meritDesc");
                String category = rs.getString("category");
                String semester = rs.getString("semester");
                Date date = rs.getDate("date");
                String role = rs.getString("role");
                int merit = rs.getInt("merit");
                involvements.add (new involvement(meritID, meritDesc, category, semester, date, role, merit, studID));
            }
        } catch (SQLException e){
            e.printStackTrace();
        }
        return involvements;
    }
    
    public boolean updateInvolvement(involvement involvement) throws SQLException {
        boolean rowUpdated;
        try (Connection connection = getConnection();
             PreparedStatement ps = connection.prepareStatement(UPDATE_INVOLVEMENT_SQL);){            
            ps.setString(1, involvement.getRole());
            ps.setInt(2, involvement.getMerit());
            ps.setString(3, involvement.getStudID());
            ps.setString(4, involvement.getMeritID());
            
            rowUpdated = ps.executeUpdate() > 0;
        }
        return rowUpdated;
    }
    
    public boolean deleteInvolvement(String studID, String meritID) throws SQLException {
        boolean rowDeleted;
        try (Connection connection = getConnection();
             PreparedStatement ps = connection.prepareStatement(DELETE_INVOLVEMENT_SQL);){
            ps.setString(1, studID);
            ps.setString(2, meritID);
            rowDeleted = ps.executeUpdate() > 0;
        }
        return rowDeleted;
    }
    
    public int totalMerit(String studID) throws SQLException {
        int totalMerit = 0;
        try (Connection connection = getConnection();
             PreparedStatement ps = connection.prepareStatement(SUM_INVOLVEMENT_BY_STUDENT_ID)){
            ps.setString(1, studID);
            System.out.println(ps);
            
            ResultSet rs = ps.executeQuery();
            
            while (rs.next()){
                totalMerit = rs.getInt("totalMerit");
            }
        } catch (SQLException e){
            e.printStackTrace();
        }
        return totalMerit;
    } 
    
    public int targetMerit() throws SQLException {
        int targetMerit = 0;
        try (Connection connection = getConnection();
             PreparedStatement ps = connection.prepareStatement(SELECT_TARGET_MERIT)){
            System.out.println(ps);
            
            ResultSet rs = ps.executeQuery();
            
            while (rs.next()){
                targetMerit = rs.getInt("targetMerit");
            }
        } catch (SQLException e){
            e.printStackTrace();
        }
        return targetMerit;
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
