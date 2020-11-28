<%@ page contentType = "text/html; charset=euc-kr" %>
<%@ page import = "java.sql.*" %>
<%
String DB_URL = "jdbc:mysql://127.0.0.1:3307/quizproject?serverTimezone=UTC";

// DB URL Format = "jdbc:mysql://'DB IP':'Connector Port'/'DB_Name'";

 

String DB_USER = "root";

String DB_PASSWORD= "wjdtj1";

// DB ID/PASSWORD
Connection conn = null;

Statement stmt = null;


try {

    Class.forName("com.mysql.jdbc.Driver");
  
    // Load JDBC Class
  
   
  
    conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
  
    // Make Connection
  
   
  
    stmt = conn.createStatement();
  


   }
  
   catch(Exception e){
  
    out.print("Exception Error...");
  
    out.print(e.toString());
  
   }

	ResultSet result = null;

	request.setCharacterEncoding("euc-kr");
	

	
	
	String quiz_Code = request.getParameter("quiz_Code");
	String quiz_User = request.getParameter("quiz_User");
	String memId = null;
	try{
		memId = ((String)session.getAttribute("userId")).trim();
	}catch(Exception e){}
	String table_Manager = "quiz_scrap_Manager";
	String table_Form = "quiz_scrap_test";
	String sql = null;
	
	
	try{
		if( quiz_Code != null ){
			sql = "DELETE FROM " + table_Manager + " WHERE userId = '" + memId + "'  ";
			sql = sql + " and quiz_form_code = '" + quiz_Code + "';";
			stmt.executeUpdate(sql);

			sql = "DELETE FROM " + table_Form + " WHERE userId = '" + memId + "' ";
			sql = sql + " and quiz_form_code = '" + quiz_Code + "';";
			stmt.executeUpdate(sql);
		}
	}catch(Exception e){
		System.out.println(e.toString());
	}

	try{
		result.close();
		stmt.close();
	}catch(Exception e){};

	stmt = null;
	response.sendRedirect("Quiz_package.jsp?quiz_User=" + quiz_User);
%>