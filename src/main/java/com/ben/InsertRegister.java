package com.ben;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.ejb.Stateful;

/**
 * Session Bean implementation class InsertData
 */
@Stateful
public class InsertRegister {
	String userid;
	String name;
	String position;
	String email;
	String password;
	String confirmPass;

    /**
     * Default constructor. 
     */
    public InsertRegister(String userid, String name, String position, String email, String password, String confirmPass) {
        this.userid = userid;
        this.name = name;
        this.position = position;
        this.email = email;
        this.password = password;
        this.confirmPass = confirmPass;
    }
    
    public boolean insertData(Connection con) throws SQLException {
    	int userID = Integer.parseInt(userid);
    	PreparedStatement ps = con.prepareStatement("insert into user values (?, ?, ?, ?, ?)");
        ps.setInt(1, userID);
        ps.setString(2, name);
        ps.setString(3, position);
        ps.setString(4, email);
        ps.setString(5, password);
        ps.execute();
        int num = 0;
		PreparedStatement ps1 = con.prepareStatement("select count(*) from user where user_id = ? and password = ?");
		ps1.setInt(1, userID);
		ps1.setString(2, password);
		ResultSet rs = ps1.executeQuery();
		while (rs.next()) {
			num = rs.getInt(1);
		}
		if (num == 1)
			return true;

		else
			return false;
    }

}
