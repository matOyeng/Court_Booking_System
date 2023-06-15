package com.ben;

import java.sql.*;

public class MySQL {
    private Connection con = null;
    private Statement st = null;
    private static MySQL mysql = null;
    String item[];

    /** Creates a new instance of SQLConnection */
    private MySQL() {

    }

    public Connection getSQLConnection() {
        String driver = "com.mysql.jdbc.Driver";
        String url = "jdbc:mysql://localhost:3306/";
        String dbname = "court";
        String username = "root";
        String pwd = "";

        try {
            Class.forName(driver);

            con = DriverManager.getConnection(url + dbname, username, pwd);

        } // try
        catch (Exception e) {
            System.out.println(e);
        } // catch

        return con;
    }

    public static MySQL getInstance() throws SQLException{
        if(mysql == null){
            mysql = new MySQL();
        }
        

        return mysql;
    }



}
