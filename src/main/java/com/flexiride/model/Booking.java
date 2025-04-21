package com.flexiride.model;

public class Booking {
	private int bookingId;
    private int userId;
    private int vehicleId;
    private String bookingDate;
    private String rentalStartDate;
    private String rentalEndDate;
    private String status;
    private Integer confirmedBy;

    // Extra fields from view
    private String userName;
    private String vehicleName;
    private String confirmedByName;
    
	public int getBookingId() {
		return bookingId;
	}
	public int getUserId() {
		return userId;
	}
	public int getVehicleId() {
		return vehicleId;
	}
	public String getBookingDate() {
		return bookingDate;
	}
	public String getRentalStartDate() {
		return rentalStartDate;
	}
	public String getRentalEndDate() {
		return rentalEndDate;
	}
	public String getStatus() {
		return status;
	}
	public Integer getConfirmedBy() {
		return confirmedBy;
	}
	public String getUserName() {
		return userName;
	}
	public String getVehicleName() {
		return vehicleName;
	}
	public String getConfirmedByName() {
		return confirmedByName;
	}
	public void setBookingId(int bookingId) {
		this.bookingId = bookingId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public void setVehicleId(int vehicleId) {
		this.vehicleId = vehicleId;
	}
	public void setBookingDate(String bookingDate) {
		this.bookingDate = bookingDate;
	}
	public void setRentalStartDate(String rentalStartDate) {
		this.rentalStartDate = rentalStartDate;
	}
	public void setRentalEndDate(String rentalEndDate) {
		this.rentalEndDate = rentalEndDate;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public void setConfirmedBy(Integer confirmedBy) {
		this.confirmedBy = confirmedBy;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public void setVehicleName(String vehicleName) {
		this.vehicleName = vehicleName;
	}
	public void setConfirmedByName(String confirmedByName) {
		this.confirmedByName = confirmedByName;
	}
}