package com.online.attendence.connection.org;
import java.sql.*;
public class MyCon {

	private static Connection con;
	public static Connection getCon() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3308/online_attendence_system","root","");
		}catch(Exception e) {
			System.out.println(e);
		}return con;
	}
}
