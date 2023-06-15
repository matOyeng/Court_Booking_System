package com.ben;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.ejb.Stateless;

/**
 * Session Bean implementation class AddReservation
 */
@Stateless
public class AddReservation {
	String id;
	String number;
	String college;
	String court;
	String period;

    /**
     * Default constructor. 
     */
    public AddReservation(String id, String number, String college, String court, String period) {
    	this.id = id;
        this.number = number;
        this.college = college;
        this.court = court;
        this.period = period;
    }
    
    public void addReservation(Connection con) throws SQLException {
    	int userID = Integer.parseInt(id);
    	int num = Integer.parseInt(number);
		PreparedStatement ps = con.prepareStatement("insert into reservation (college_name, court_name, period, num_of_people, date, fk1_user_id) values (?, ?, ?, ?, current_date, ?);");
		PreparedStatement ps1 = con.prepareStatement("insert into history (college_name, court_name, period, num_of_people, date, fk1_user_id) values (?, ?, ?, ?, current_date, ?);");

		ps.setString(1, college);
		ps.setString(2, court);
		ps.setString(3, period);
		ps.setInt(4, num);
		ps.setInt(5, userID);
		ps1.setString(1, college);
		ps1.setString(2, court);
		ps1.setString(3, period);
		ps1.setInt(4, num);
		ps1.setInt(5, userID);
		ps.execute();
		ps1.execute();
    }

}
