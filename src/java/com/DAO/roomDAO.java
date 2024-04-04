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

import com.Model.room;

/**
 * Name: Evan Date: 20/5/2023 Bean: roomDAO.java
 */
public class roomDAO {

    Connection connection = null;
    private String jdbcURL = "jdbc:mysql://localhost:3306/umthostelmanagementsystem";
    private String jdbcUsername = "root";
    private String jdbcPassword = "admin";

    private static final String INSERT_ROOM_SQL = "INSERT INTO room (roomID, capacity, feesPerNight, hostelID) VALUES "
            + " (?, ?, ?, ?);";

    private static final String SELECT_ROOM_BY_NO = "select roomID ,capacity, feesPerNight, hostelID from room where roomID=?";
    private static final String SELECT_ALL_ROOM = "select * from room";
    private static final String DELETE_ROOM_SQL = "delete from room where roomID = ?;";
    private static final String UPDATE_ROOM_SQL = "update room set capacity = ?, feesPerNight = ?, hostelID = ? where roomID = ?;";

    public roomDAO() {
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

    public void insertRoom(room room) throws SQLException {
        System.out.println(INSERT_ROOM_SQL);
        //try-with-resource statement will auto close the connection.
        try (Connection connection = getConnection(); PreparedStatement preparedStatement
                = connection.prepareStatement(INSERT_ROOM_SQL)) {
            preparedStatement.setString(1, room.getRoomID());
            preparedStatement.setInt(2, room.getCapacity());
            preparedStatement.setDouble(3, room.getFeesPerNight());
            preparedStatement.setString(4, room.getHostelID());
            System.out.println(preparedStatement);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            printSQLException(e);
        }
    }

    public room selectRoom(String roomID) {
        room room = null;
        // Step 1: Establishing a Connection
        try (Connection connection = getConnection(); // Step 2:Create a statement using connection object
                PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ROOM_BY_NO);) {
            preparedStatement.setString(1, roomID);
            System.out.println(preparedStatement);
            // Step 3: Execute the query or update query
            ResultSet rs = preparedStatement.executeQuery();

            // Step 4: Process the ResultSet object.
            while (rs.next()) {
                int capacity = rs.getInt("capacity");
                double feesPerNight = rs.getDouble("feesPerNight");
                String hostelID = rs.getString("hostelID");
                room = new room(roomID, capacity, feesPerNight, hostelID);
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return room;
    }

    public List<room> selectAllRoom() {

        // using try-with-resources to avoid closing resources (boiler plate code)
        List<room> rooms = new ArrayList<>();
        // Step 1: Establising a Connection
        try (Connection connection = getConnection(); // Step 2:Create a statement using connection object
                PreparedStatement preparedStatement
                = connection.prepareStatement(SELECT_ALL_ROOM);) {
            System.out.println(preparedStatement);
            // Step 3: Execute the query or update query
            ResultSet rs = preparedStatement.executeQuery();

            // Step 4: Process the ResultSet object.
            while (rs.next()) {

                String roomID = rs.getString("roomID");
                int capacity = rs.getInt("capacity");
                double feesPerNight = rs.getDouble("feesPerNight");
                String hostelID = rs.getString("hostelID");

                rooms.add(new room(roomID, capacity, feesPerNight, hostelID));
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return rooms;
    }

    public boolean deleteRoom(String roomNo) throws SQLException {
        boolean rowDeleted;
        try (Connection connection = getConnection(); PreparedStatement statement
                = connection.prepareStatement(DELETE_ROOM_SQL);) {
            statement.setString(1, roomNo);
            rowDeleted = statement.executeUpdate() > 0;
        }
        return rowDeleted;
    }

    public boolean updateRoom(room room) throws SQLException {
        boolean rowUpdated;
        try (Connection connection = getConnection(); PreparedStatement statement
                = connection.prepareStatement(UPDATE_ROOM_SQL);) {

            statement.setInt(1, room.getCapacity());
            statement.setDouble(2, room.getFeesPerNight());
            statement.setString(3, room.getHostelID());
            statement.setString(4, room.getRoomID());

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
