package com.flexiride.service;

import com.flexiride.model.Feedback;
import com.flexiride.util.DBConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class FeedbackService {

    // Create Feedback
    public boolean createFeedback(Feedback feedback) {
        String query = "INSERT INTO feedbacks (booking_id, user_id, rating, comments) VALUES (?, ?, ?, ?)";
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setInt(1, feedback.getBookingId());
            stmt.setInt(2, feedback.getUserId());
            stmt.setInt(3, feedback.getRating());
            stmt.setString(4, feedback.getComments());
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // Get Feedback by ID
    public Feedback getFeedback(int id) {
        String query = "SELECT * FROM feedbacks_view WHERE feedback_id = ?";
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                Feedback feedback = new Feedback();
                feedback.setFeedbackId(rs.getInt("feedback_id"));
                feedback.setBookingId(rs.getInt("booking_id"));
                feedback.setUserName(rs.getString("user_name")); // from view
                feedback.setRating(rs.getInt("rating"));
                feedback.setComments(rs.getString("comments"));
                feedback.setFeedbackDate(rs.getString("feedback_date"));
                return feedback;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    // Get All Feedbacks
    public List<Feedback> getAllFeedbacks() {
        List<Feedback> feedbacks = new ArrayList<>();
        String query = "SELECT * FROM feedbacks_view ORDER BY feedback_id";
        try (Connection connection = DBConnection.getConnection();
             Statement stmt = connection.createStatement()) {
            ResultSet rs = stmt.executeQuery(query);
            while (rs.next()) {
                Feedback feedback = new Feedback();
                feedback.setFeedbackId(rs.getInt("feedback_id"));
                feedback.setBookingId(rs.getInt("booking_id"));
                feedback.setUserName(rs.getString("user_name"));
                feedback.setRating(rs.getInt("rating"));
                feedback.setComments(rs.getString("comments"));
                feedback.setFeedbackDate(rs.getString("feedback_date"));
                feedbacks.add(feedback);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return feedbacks;
    }

    // Update Feedback
    public boolean updateFeedback(Feedback feedback) {
        String query = "UPDATE feedbacks SET rating = ?, comments = ? WHERE feedback_id = ?";
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setInt(1, feedback.getRating());
            stmt.setString(2, feedback.getComments());
            stmt.setInt(3, feedback.getFeedbackId());
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // Delete Feedback
    public boolean deleteFeedback(int id) {
        String query = "DELETE FROM feedbacks WHERE feedback_id = ?";
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