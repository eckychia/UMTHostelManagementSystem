/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.DAO;

import com.Model.merit;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class meritDAO {
    Connection connection = null;
    private String jdbcURL = "jdbc:mysql://localhost:3306/UMTHostelManagementSystem";
    private String jdbcUsername = "root";
    private String jdbcPassword = "admin";
    
    private static final String INSERT_MERIT_SQL = "INSERT INTO merit (meritID, meritDesc, category, semester, date) VALUES "
            + "(?, ?, ?, ?, ?);";
    private static final String SELECT_ALL_MERITS = "SELECT * FROM merit;";
    private static final String SELECT_MERIT_BY_ID = "SELECT * FROM merit WHERE meritID = ?;";
    private static final String UPDATE_MERIT_SQL = "UPDATE merit SET meritDesc = ?, category = ?, semester = ?, date = ?"
            + " WHERE meritID = ?;";
    private static final String DELETE_MERIT_SQL = "DELETE FROM merit WHERE meritID = ?;";
    
    public meritDAO(){
        
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
    
    public void insertMerit(merit merit) throws SQLException {
        System.out.println(INSERT_MERIT_SQL);
        try (Connection connection = getConnection();
             PreparedStatement ps = connection.prepareStatement(INSERT_MERIT_SQL);){
            ps.setString(1, merit.getMeritID());
            ps.setString(2, merit.getMeritDesc());
            ps.setString(3, merit.getCategory());
            ps.setString(4, merit.getSemester());
            ps.setDate(5, merit.getDate());
            System.out.println(ps);
            ps.executeUpdate();
        } catch (SQLException e){
            e.printStackTrace();
        } 
    }
    
    public List <merit> selectAllMerits() {
        List <merit> merits = new ArrayList<>();
        try (Connection connection = getConnection();
             PreparedStatement ps = connection.prepareStatement(SELECT_ALL_MERITS);){
            ResultSet rs = ps.executeQuery();
            
            while (rs.next()) {
                String meritID = rs.getString("meritID");
                String meritDesc = rs.getString("meritDesc");
                String category = rs.getString("category");
                String semester = rs.getString("semester");
                Date date = rs.getDate("date");
                merits.add(new merit(meritID, meritDesc, category, semester, date));
            }
        } catch (SQLException e){
            e.printStackTrace();
        }
        return merits;
    }
    
    public merit selectMerit(String meritID) {
        merit merits = null;
        try (Connection connection = getConnection();
             PreparedStatement ps = connection.prepareStatement(SELECT_MERIT_BY_ID);){
            ps.setString(1, meritID);
            System.out.println(ps);
            
            ResultSet rs = ps.executeQuery();
            
            while (rs.next()){
                String meritDesc = rs.getString("meritDesc");
                String category = rs.getString("category");
                String semester = rs.getString("semester");
                Date date = rs.getDate("date");
                merits = new merit(meritID, meritDesc, category, semester, date);
            }
        } catch (SQLException e){
            e.printStackTrace();
        }
        return merits;
    }
    
    public boolean updateMerit(merit merit) throws SQLException {
        boolean rowUpdated;
        try (Connection connection = getConnection();
             PreparedStatement ps = connection.prepareStatement(UPDATE_MERIT_SQL);){
            ps.setString(1, merit.getMeritDesc());
            ps.setString(2, merit.getCategory());
            ps.setString(3, merit.getSemester());
            ps.setDate(4, merit.getDate());
            ps.setString(5, merit.getMeritID());
            
            rowUpdated = ps.executeUpdate() > 0;
        }
        return rowUpdated;
    }
    
    public boolean deleteMerit(String meritID) throws SQLException {
        boolean rowDeleted;
        try (Connection connection = getConnection();
             PreparedStatement ps = connection.prepareStatement(DELETE_MERIT_SQL);){
            ps.setString(1, meritID);
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
