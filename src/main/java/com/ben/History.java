package com.ben;

import java.sql.Connection;
import java.sql.Statement;

import javax.ejb.Stateless;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * Session Bean implementation class History
 */
@Stateless
public class History {
	private Statement st;
	String item[];

    /**
     * Default constructor. 
     */
    public History() {
        
    }
    
    public String[] insertData(Connection con) throws SQLException {
    	st = con.createStatement();
        
        PreparedStatement ps = con.prepareStatement("select * from IncomingTable where invoice_number = ?");
        ps.setInt(1, 10005);
        ResultSet rs = ps.executeQuery();
        item = new String[10];
        int i = 0;
        while (i < item.length && rs.next()) {
            item[i] = rs.getString(2);
            i++;
        }
        return item;
    }

}
