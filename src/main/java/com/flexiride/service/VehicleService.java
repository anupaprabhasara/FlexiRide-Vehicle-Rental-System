package com.flexiride.service;

import com.flexiride.model.Vehicle;
import com.flexiride.util.DBConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class VehicleService {

    // Create Vehicle and Return Inserted ID
    public int createVehicleAndGetId(Vehicle vehicle) {
        String query = "INSERT INTO vehicles (vehicle_name, brand, model, vehicle_type, cost_per_km, availability_status, description) VALUES (?, ?, ?, ?, ?, ?, ?)";
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement stmt = connection.prepareStatement(query, Statement.RETURN_GENERATED_KEYS)) {
            stmt.setString(1, vehicle.getVehicleName());
            stmt.setString(2, vehicle.getBrand());
            stmt.setString(3, vehicle.getModel());
            stmt.setString(4, vehicle.getVehicleType());
            stmt.setDouble(5, vehicle.getCostPerKm());
            stmt.setString(6, vehicle.getAvailabilityStatus());
            stmt.setString(7, vehicle.getDescription());

            int affectedRows = stmt.executeUpdate();
            if (affectedRows > 0) {
                ResultSet rs = stmt.getGeneratedKeys();
                if (rs.next()) {
                    return rs.getInt(1); // return new vehicle_id
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return -1; // insertion failed
    }

    // Get Vehicle by ID
    public Vehicle getVehicle(int id) {
        String query = "SELECT * FROM vehicles WHERE vehicle_id = ?";
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                Vehicle vehicle = new Vehicle();
                vehicle.setVehicleId(rs.getInt("vehicle_id"));
                vehicle.setVehicleName(rs.getString("vehicle_name"));
                vehicle.setBrand(rs.getString("brand"));
                vehicle.setModel(rs.getString("model"));
                vehicle.setVehicleType(rs.getString("vehicle_type"));
                vehicle.setCostPerKm(rs.getDouble("cost_per_km"));
                vehicle.setAvailabilityStatus(rs.getString("availability_status"));
                vehicle.setDescription(rs.getString("description"));
                return vehicle;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    // Get All Vehicles
    public List<Vehicle> getAllVehicles() {
        List<Vehicle> vehicles = new ArrayList<>();
        String query = "SELECT * FROM vehicles ORDER BY vehicle_id";
        try (Connection connection = DBConnection.getConnection();
             Statement stmt = connection.createStatement()) {
            ResultSet rs = stmt.executeQuery(query);
            while (rs.next()) {
                Vehicle vehicle = new Vehicle();
                vehicle.setVehicleId(rs.getInt("vehicle_id"));
                vehicle.setVehicleName(rs.getString("vehicle_name"));
                vehicle.setBrand(rs.getString("brand"));
                vehicle.setModel(rs.getString("model"));
                vehicle.setVehicleType(rs.getString("vehicle_type"));
                vehicle.setCostPerKm(rs.getDouble("cost_per_km"));
                vehicle.setAvailabilityStatus(rs.getString("availability_status"));
                vehicle.setDescription(rs.getString("description"));
                vehicles.add(vehicle);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return vehicles;
    }

    // Update Vehicle
    public boolean updateVehicle(Vehicle vehicle) {
        String query = "UPDATE vehicles SET vehicle_name = ?, brand = ?, model = ?, vehicle_type = ?, cost_per_km = ?, availability_status = ?, description = ? WHERE vehicle_id = ?";
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setString(1, vehicle.getVehicleName());
            stmt.setString(2, vehicle.getBrand());
            stmt.setString(3, vehicle.getModel());
            stmt.setString(4, vehicle.getVehicleType());
            stmt.setDouble(5, vehicle.getCostPerKm());
            stmt.setString(6, vehicle.getAvailabilityStatus());
            stmt.setString(7, vehicle.getDescription());
            stmt.setInt(8, vehicle.getVehicleId());
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // Delete Vehicle
    public boolean deleteVehicle(int id) {
        String query = "DELETE FROM vehicles WHERE vehicle_id = ?";
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