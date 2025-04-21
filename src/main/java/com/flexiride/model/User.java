package com.flexiride.model;

public class User {
	private int userId;
    private String fullName;
    private String email;
    private String password;
    private String phone;
    private String nicNumber;
    private String address;
    
	public int getUserId() {
		return userId;
	}
	public String getFullName() {
		return fullName;
	}
	public String getEmail() {
		return email;
	}
	public String getPassword() {
		return password;
	}
	public String getPhone() {
		return phone;
	}
	public String getNicNumber() {
		return nicNumber;
	}
	public String getAddress() {
		return address;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public void setFullName(String fullName) {
		this.fullName = fullName;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public void setNicNumber(String nicNumber) {
		this.nicNumber = nicNumber;
	}
	public void setAddress(String address) {
		this.address = address;
	}
}