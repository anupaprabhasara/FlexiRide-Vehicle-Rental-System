package com.flexiride.model;

public class User {
	private int user_id;
	private String full_name;
	private String email;
	private String password;
	private String phone;
	private String nic_number;
	private String address;
	
	public int getUser_id() {
		return user_id;
	}
	public String getFull_name() {
		return full_name;
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
	public String getNic_number() {
		return nic_number;
	}
	public String getAddress() {
		return address;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	public void setFull_name(String full_name) {
		this.full_name = full_name;
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
	public void setNic_number(String nic_number) {
		this.nic_number = nic_number;
	}
	public void setAddress(String address) {
		this.address = address;
	}
}