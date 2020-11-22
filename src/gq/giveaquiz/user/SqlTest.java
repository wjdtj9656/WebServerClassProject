package gq.giveaquiz.user;

import java.sql.*;

public class SqlTest {
	public static void main(String[] args) {
		
        String url = "jdbc:mysql://localhost:3306/giveaquiz?serverTimezone=UTC";
        String id = "root";
        String pw = "1234";
        Connection conn = null;
        
		try {
			Class.forName("com.mysql.jdbc.Driver");
		}catch(ClassNotFoundException e) {
			e.printStackTrace();
		}
		
		try {
			conn=DriverManager.getConnection(url,id,pw);
			System.out.println("Connected");
		}catch (SQLException se) {
			se.printStackTrace();
		}
		
	}
}
