package com.flexiride.service;

import com.flexiride.model.Booking;
import com.flexiride.util.DBConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class BookingService {

    // Create Booking
    public boolean createBooking(Booking booking) {
        String query = "INSERT INTO bookings (user_id, vehicle_id, booking_date, rental_start_date, rental_end_date, status, confirmed_by) VALUES (?, ?, ?, ?, ?, ?, ?)";
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setInt(1, booking.getUserId());
            stmt.setInt(2, booking.getVehicleId());
            stmt.setString(3, booking.getBookingDate());
            stmt.setString(4, booking.getRentalStartDate());
            stmt.setString(5, booking.getRentalEndDate());
            stmt.setString(6, booking.getStatus());
            if (booking.getConfirmedBy() != null) {
                stmt.setInt(7, booking.getConfirmedBy());
            } else {
                stmt.setNull(7, Types.INTEGER);
            }
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // Get Booking by ID
    public Booking getBooking(int id) {
        String query = "SELECT * FROM bookings_view WHERE booking_id = ?";
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                Booking booking = new Booking();
                booking.setBookingId(rs.getInt("booking_id"));
                booking.setUserName(rs.getString("user_name"));
                booking.setVehicleName(rs.getString("vehicle_name"));
                booking.setBookingDate(rs.getString("booking_date"));
                booking.setRentalStartDate(rs.getString("rental_start_date"));
                booking.setRentalEndDate(rs.getString("rental_end_date"));
                booking.setStatus(rs.getString("status"));
                booking.setConfirmedByName(rs.getString("confirmed_by"));
                return booking;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    // Get All Bookings
    public List<Booking> getAllBookings() {
        List<Booking> bookings = new ArrayList<>();
        String query = "SELECT * FROM bookings_view ORDER BY booking_id";
        try (Connection connection = DBConnection.getConnection();
             Statement stmt = connection.createStatement()) {
            ResultSet rs = stmt.executeQuery(query);
            while (rs.next()) {
                Booking booking = new Booking();
                booking.setBookingId(rs.getInt("booking_id"));
                booking.setUserName(rs.getString("user_name"));
                booking.setVehicleName(rs.getString("vehicle_name"));
                booking.setBookingDate(rs.getString("booking_date"));
                booking.setRentalStartDate(rs.getString("rental_start_date"));
                booking.setRentalEndDate(rs.getString("rental_end_date"));
                booking.setStatus(rs.getString("status"));
                booking.setConfirmedByName(rs.getString("confirmed_by"));
                bookings.add(booking);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return bookings;
    }

    // Update Booking
    public boolean updateBooking(Booking booking) {
        String query = "UPDATE bookings SET user_id = ?, vehicle_id = ?, booking_date = ?, rental_start_date = ?, rental_end_date = ?, status = ?, confirmed_by = ? WHERE booking_id = ?";
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setInt(1, booking.getUserId());
            stmt.setInt(2, booking.getVehicleId());
            stmt.setString(3, booking.getBookingDate());
            stmt.setString(4, booking.getRentalStartDate());
            stmt.setString(5, booking.getRentalEndDate());
            stmt.setString(6, booking.getStatus());
            if (booking.getConfirmedBy() != null) {
                stmt.setInt(7, booking.getConfirmedBy());
            } else {
                stmt.setNull(7, Types.INTEGER);
            }
            stmt.setInt(8, booking.getBookingId());
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // Delete Booking
    public boolean deleteBooking(int id) {
        String query = "DELETE FROM bookings WHERE booking_id = ?";
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setInt(1, id);
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
}