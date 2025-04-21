package com.flexiride.service;

import com.flexiride.model.Notification;
import com.flexiride.util.DBConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class NotificationService {
	
    // Get All Notifications
    public List<Notification> getAllNotifications() {
        List<Notification> notifications = new ArrayList<>();
        String query = "SELECT * FROM notifications_view ORDER BY notification_id";
        try (Connection connection = DBConnection.getConnection();
             Statement stmt = connection.createStatement()) {
            ResultSet rs = stmt.executeQuery(query);
            while (rs.next()) {
                Notification notification = new Notification();
                notification.setNotificationId(rs.getInt("notification_id"));
                notification.setUserName(rs.getString("user_name"));
                notification.setVehicleName(rs.getString("vehicle_name"));
                notification.setMessage(rs.getString("message"));
                notification.setCreatedAt(rs.getString("created_at"));
                notifications.add(notification);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return notifications;
    }
}