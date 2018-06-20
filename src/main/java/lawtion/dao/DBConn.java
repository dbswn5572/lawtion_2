package lawtion.dao;

import java.util.*;
import java.sql.*;

public class DBConn {
	static String url="jdbc:oracle:thin:@localhost:1521:xe";
	static String user="hr";
	static String pass = "hr";
	static Connection conn;
	
	
	//Constructor
	public DBConn(){}
	
	public static Connection getConnection() throws SQLException{
		Connection conn = null;
		
		try{
			
			Class.forName("oracle.jdbc.OracleDriver");
			conn = DriverManager.getConnection(url, user, pass);
			return conn;
		}catch(Exception e){e.printStackTrace(); return null;}

	}
}

