package com.flexiride.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;


import com.flexiride.model.User;
import com.flexiride.util.DBConnection;

public class UserService {
	
	//Get All Users
	public List<User> getAllUsers(){
	List<User> users = new ArrayList();
	String query = "SELECT * FROM users";
	try(Connection connection = DBConnection.getConnection();
			Statement stmt = connection.createStatement()){
		ResultSet rs = stmt.executeQuery(query);
		while(rs.next()) {
			User user = new User();
			user.setUser_id(rs.getInt("user_id"));
			user.setFull_name(rs.getString("full_name"));
			user.setEmail(rs.getString("email"));
			user.setPassword(rs.getString("password"));
			user.setPhone(rs.getString("phone"));
			user.setNic_number(rs.getString("nic_number"));
			user.setAddress(rs.getString("address"));
			users.add(user);
		}
	}catch (SQLException e) {
		e.printStackTrace();
	}
	return users;		
	}
	
	
	//Delete users
	public boolean deleteUser(int id) {
		String query = "DELETE FROM users WHERE id = ?";
		try(Connection connection = DBConnection.getConnection();
				PreparedStatement stmt = connection.prepareStatement(query)){
			stmt.setInt(1, id);
			return stmt.executeUpdate()>0;
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return false;
	}
	
	

}







