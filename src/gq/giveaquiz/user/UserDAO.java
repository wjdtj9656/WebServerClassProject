package gq.giveaquiz.user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.ResultSet;

public class UserDAO {

	public Connection getConnection() {
        String url = "jdbc:mysql://localhost:3306/giveaquiz?serverTimezone=UTC";
        String id = "root";
        String pw = "1234";
        
        try{
            Class.forName("com.mysql.jdbc.Driver");
            return DriverManager.getConnection(url,id,pw);
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return null;
        }
    }
	
    public void addUser(User user) throws SQLException {
        String sql = "insert into USERS values(?,?,?)";
        Connection conn = null;
        PreparedStatement pstmt = null;
        
        try{
            conn = getConnection();
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, user.getUserId());
            pstmt.setString(2, user.getPassword());
            pstmt.setString(3, user.getName());
            
            pstmt.executeUpdate();
        } finally {
            if (pstmt != null){
                pstmt.close();                
            }
            if (conn != null){
                conn.close();
            }
                
        }
        
    }
    
    public User findByUserId(String userId) throws SQLException {
        String sql = "select * from USERS where userId = ?";
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        
        try{
            conn = getConnection();
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, userId);
            
            rs = pstmt.executeQuery();
            
            if(!rs.next()){
                return null;
            }
            
            return new User(
            		rs.getString("userId"),
                    rs.getString("password"),
                    rs.getString("name"));
        }finally{
            if (rs != null){
                rs.close();                
            }
            if (pstmt != null){
                pstmt.close();                
            }
            if (conn != null){
                conn.close();
            }
        }
    }
    public void removeUser(String userId) throws SQLException {
        String sql = "delete from USERS where userId = ?";
        Connection conn = null;
        PreparedStatement pstmt = null;
        
        try{
            conn = getConnection();
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, userId);
            
            pstmt.executeUpdate();
            
        } finally {
            if (pstmt != null){
                pstmt.close();                
            }
            if (conn != null){
                conn.close();
            }    
        }
    }
 
    public void updateUser(User user) throws SQLException {
        String sql = "update USERS set password = ?, name = ? where userId = ?";
        Connection conn = null;
        PreparedStatement pstmt = null;
        
        try{
            conn = getConnection();
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, user.getPassword());
            pstmt.setString(2, user.getName());
            pstmt.setString(3, user.getUserId());
            
            pstmt.executeUpdate();
            
        } finally {
            if (pstmt != null){
                pstmt.close();                
            }
            if (conn != null){
                conn.close();
            }
        }
    }
 
}

