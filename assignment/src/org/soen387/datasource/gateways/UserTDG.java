package org.soen387.datasource.gateways;

import java.sql.PreparedStatement;
import java.sql.SQLException;

import org.soen387.beans.UserBean;
import org.soen387.datasource.DatabaseConnection;

public class UserTDG {

	private static UserTDG instance = null;
	
	private UserTDG() {
		super();
	}
	
	public static UserTDG getInstance() {
		if (UserTDG.instance == null) {
			instance = new UserTDG();
		}
		return instance;
	}
	
	public int createUser(UserBean newUser) {
		final String insertUserQuery = "INSERT INTO User " +
				"(password, firstname, lastname, email, address1, address2," +
				"city, postalcode, province, country) " +
				"VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?);";
		int count = -1;
		try {
			PreparedStatement preparedStatement = DatabaseConnection.getInstance().prepareStatement(insertUserQuery);
			preparedStatement.setString(1, newUser.getPassword());
			preparedStatement.setString(2, newUser.getFirstName());
			preparedStatement.setString(3, newUser.getLastName());
			preparedStatement.setString(4, newUser.getEmail());
			preparedStatement.setString(5, newUser.getAddress1());
			preparedStatement.setString(6, newUser.getAddress2());
			preparedStatement.setString(7, newUser.getCity());
			preparedStatement.setString(8, newUser.getPostalCode());
			preparedStatement.setString(9, newUser.getProvince());
			preparedStatement.setString(10, newUser.getCountry());
			count = preparedStatement.executeUpdate();
		} catch (SQLException se) {
			System.out.println("Failed to create user: " + se.getMessage());
		}
		return count;
	}
}
