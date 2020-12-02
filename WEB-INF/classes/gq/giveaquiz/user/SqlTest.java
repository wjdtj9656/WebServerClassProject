package gq.giveaquiz.user;

import java.sql.*;

public class SqlTest {
	public static void main(String[] args) {
		
        String url = "jdbc:mysql://118.67.129.53:3306/quizproject?serverTimezone=UTC";
        String id = "root";
        String pw = "Wjdtj12!";
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
