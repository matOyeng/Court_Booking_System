package com.ben;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.ejb.Stateless;

/**
 * Session Bean implementation class CheckRedundant
 */
@Stateless

public class CheckRedundant {
	private int num = 0;

	String court;
	String college;
	String period;

	public CheckRedundant(String college, String court, String period) {
		this.court = court;
		this.college = college;
		this.period = period;

	}

	public int checkRedundant(Connection con) throws SQLException {
		PreparedStatement ps = con.prepareStatement(
				"select count(*) from reservation where college_name = ? and court_name = ? and period = ? and date = current_date()");
		ps.setString(1, college);
		ps.setString(2, court);
		ps.setString(3, period);
		ResultSet rs = ps.executeQuery();
		System.out.println("ben");
		while (rs.next()) {
			num = rs.getInt(1);
		}
		return num;
	}
}
