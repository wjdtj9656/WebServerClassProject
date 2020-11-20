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
	


	String number = request.getParameter("number");
	String quiz_Table = request.getParameter("quiz_Table");

	String table_Form = "quiz_Form";
	String table_Scrap = "quiz_Scrap";

	String sql = null;

	try{
		if( number != null && quiz_Table != null){
			//만약 객곽식 혹은 주관식의 소스 문제라면 연관된 처리를 해준다.
			if( quiz_Table.equals("quiz_obj") || quiz_Table.equals("quiz_short") ){
				// 문제삭제
				sql = "DELETE FROM " + quiz_Table + " WHERE  ";
				sql = sql + "quiz_id = " + number + ";";
				stmt.executeUpdate(sql);

				//패키지의 구성요소에서 해당 문제를 삭제
				sql = "DELETE FROM " + table_Form + " WHERE  ";
				sql = sql + " quiz_id = " + number + " and quiz_Table = '" + quiz_Table + "';";
				stmt.executeUpdate(sql);


			}
		}
	}catch(Exception e){
		System.out.println(e.toString());
	}

	try{
		result.close();
		stmt.close();
	}catch(Exception e){};

	stmt = null;
	response.sendRedirect("Quiz_list.jsp");
%>