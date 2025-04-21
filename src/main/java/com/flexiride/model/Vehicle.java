package com.flexiride.model;

public class Vehicle {
	private int vehicleId;
    private String vehicleName;
    private String brand;
    private String model;
    private String vehicleType;
    private double costPerKm;
    private String availabilityStatus;
    private String description;
    
	public int getVehicleId() {
		return vehicleId;
	}
	public String getVehicleName() {
		return vehicleName;
	}
	public String getBrand() {
		return brand;
	}
	public String getModel() {
		return model;
	}
	public String getVehicleType() {
		return vehicleType;
	}
	public double getCostPerKm() {
		return costPerKm;
	}
	public String getAvailabilityStatus() {
		return availabilityStatus;
	}
	public String getDescription() {
		return description;
	}
	public void setVehicleId(int vehicleId) {
		this.vehicleId = vehicleId;
	}
	public void setVehicleName(String vehicleName) {
		this.vehicleName = vehicleName;
	}
	public void setBrand(String brand) {
		this.brand = brand;
	}
	public void setModel(String model) {
		this.model = model;
	}
	public void setVehicleType(String vehicleType) {
		this.vehicleType = vehicleType;
	}
	public void setCostPerKm(double costPerKm) {
		this.costPerKm = costPerKm;
	}
	public void setAvailabilityStatus(String availabilityStatus) {
		this.availabilityStatus = availabilityStatus;
	}
	public void setDescription(String description) {
		this.description = description;
	}
}