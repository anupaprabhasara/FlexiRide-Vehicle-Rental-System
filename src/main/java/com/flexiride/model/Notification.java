package com.flexiride.model;

public class Notification {
	private int notificationId;
    private int userId;
    private int bookingId;
    private String message;
    private String createdAt;

    // From notifications_view
    private String userName;   
    private String vehicleName;
    
	public int getNotificationId() {
		return notificationId;
	}
	public int getUserId() {
		return userId;
	}
	public int getBookingId() {
		return bookingId;
	}
	public String getMessage() {
		return message;
	}
	public String getCreatedAt() {
		return createdAt;
	}
	public String getUserName() {
		return userName;
	}
	public String getVehicleName() {
		return vehicleName;
	}
	public void setNotificationId(int notificationId) {
		this.notificationId = notificationId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public void setBookingId(int bookingId) {
		this.bookingId = bookingId;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public void setCreatedAt(String createdAt) {
		this.createdAt = createdAt;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public void setVehicleName(String vehicleName) {
		this.vehicleName = vehicleName;
	}
}