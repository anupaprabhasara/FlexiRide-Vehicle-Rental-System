package com.flexiride.model;

public class Admin {
    private int id;
    private String full_name;
    private String email;
    private String password;
    private String role;
    
	public int getId() {
		return id;
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
	public String getRole() {
		return role;
	}
	public void setId(int id) {
		this.id = id;
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
	public void setRole(String role) {
		this.role = role;
	}
}