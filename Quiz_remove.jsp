<%@ page contentType = "text/html; charset=euc-kr" %>
<%@ page import = "java.sql.*" %>
<%
String DB_URL = "jdbc:mysql://118.67.129.53:3306/quizproject?serverTimezone=UTC";

// DB URL Format = "jdbc:mysql://'DB IP':'Connector Port'/'DB_Name'";

request.setCharacterEncoding("UTF-8");
response.setContentType("text/html; charset=UTF-8");
 

String DB_USER = "root";

String DB_PASSWORD= "Wjdtj12!";

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

	


	String quiz_User = request.getParameter("quiz_User");
	String memId = null;
	try{
		memId = ((String)session.getAttribute("userId")).trim();
	}catch(Exception e){}
	
	String number = request.getParameter("number");
	String quiz_Table = request.getParameter("quiz_Table");

	String table_Form = "quiz_form";
	String table_Scrap = "quiz_scrap";

	String sql = null;

	try{
		if( number != null && quiz_Table != null && memId != null){
			//소스관련 문제 제거
			if( quiz_Table.equals("quiz_obj") || quiz_Table.equals("quiz_short") ){
				// 문제삭제
				sql = "DELETE FROM " + quiz_Table + " WHERE userId = '" + memId + "' ";
				sql = sql + " and quiz_id = " + number + ";";
				stmt.executeUpdate(sql);

				//패키지의 구성요소에서 해당 문제 삭제
				sql = "DELETE FROM " + table_Form + " WHERE userId = '" + memId + "' ";
				sql = sql + " quiz_id = " + number + " and quiz_Table = '" + quiz_Table + "';";
				stmt.executeUpdate(sql);
				
				//스크랩에서 구성요소 문제 삭제
				sql = "DELETE FROM " + table_Scrap + " WHERE userId = '" + memId + "' ";
				sql = sql + " quiz_id = " + number + " and quiz_Table = '" + quiz_Table + "';";
				stmt.executeUpdate(sql);

			}
			else{
				// 스크랩된 문제라면 스크랩만 삭제한다.
				 if( quiz_Table.equals("quiz_Scrap_short") ){
					 quiz_Table = "quiz_short";
				 }else if(quiz_Table.equals("quiz_Scrap_obj")){
 					 quiz_Table = "quiz_obj";
				 } 

				sql = "DELETE FROM " + table_Scrap + " WHERE userId = '" + memId + "' ";
				sql = sql + "and quiz_id = " + number + " and quiz_Table = '" + quiz_Table + "';";
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
	response.sendRedirect("Quiz_list.jsp?quiz_User=" + quiz_User);
%>