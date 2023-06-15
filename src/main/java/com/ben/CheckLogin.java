package com.ben;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.ejb.Stateless;
import javax.servlet.http.HttpSession;

/**
 * Session Bean implementation class CheckLogin
 */
@Stateless
public class CheckLogin {

	String id;
	String password;
	String role;

	/**
	 * Default constructor.
	 */
	public CheckLogin(String id, String password, String role) {
		this.id = id;
		this.password = password;
		this.role = role;
	}

	public int checkLogin(Connection con) throws SQLException {
		int userID = Integer.parseInt(id);
		int num = 0;
		PreparedStatement ps = con.prepareStatement("select count(*) from user where user_id = ? and password = ?");
		ps.setInt(1, userID);
		ps.setString(2, password);
		ResultSet rs = ps.executeQuery();
		while (rs.next()) {
			num = rs.getInt(1);
		}
		if (num == 1)
			return userID;

		else
			return 0;
	}

}
