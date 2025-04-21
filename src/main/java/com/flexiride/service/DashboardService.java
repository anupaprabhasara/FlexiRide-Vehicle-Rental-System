package com.flexiride.service;

import com.flexiride.model.Booking;
import com.flexiride.util.DBConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class DashboardService {

    public int getTotalVehicles() {
        String query = "SELECT COUNT(*) FROM vehicles";
        return getCount(query);
    }

    public int getTotalUsers() {
        String query = "SELECT COUNT(*) FROM users";
        return getCount(query);
    }

    public int getPendingBookings() {
        String query = "SELECT COUNT(*) FROM bookings WHERE status = 'Pending'";
        return getCount(query);
    }

    public int getFeedbacksReceived() {
        String query = "SELECT COUNT(*) FROM feedbacks";
        return getCount(query);
    }

    private int getCount(String query) {
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement stmt = connection.prepareStatement(query);
             ResultSet rs = stmt.executeQuery()) {
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }

    // Get latest 5 bookings
    public List<Booking> getLatestBookings() {
        List<Booking> bookings = new ArrayList<>();
        String query = "SELECT b.booking_id, u.full_name AS user_name, v.vehicle_name, b.rental_start_date, b.rental_end_date, b.status " +
                       "FROM bookings b " +
                       "JOIN users u ON b.user_id = u.user_id " +
                       "JOIN vehicles v ON b.vehicle_id = v.vehicle_id " +
                       "ORDER BY b.booking_date DESC " +
                       "LIMIT 5";
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement stmt = connection.prepareStatement(query);
             ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                Booking booking = new Booking();
                booking.setBookingId(rs.getInt("booking_id"));
                booking.setUserName(rs.getString("user_name"));
                booking.setVehicleName(rs.getString("vehicle_name"));
                booking.setRentalStartDate(rs.getString("rental_start_date"));
                booking.setRentalEndDate(rs.getString("rental_end_date"));
                booking.setStatus(rs.getString("status"));
                bookings.add(booking);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return bookings;
    }
}