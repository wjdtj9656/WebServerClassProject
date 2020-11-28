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
	
	String quiz_User = request.getParameter("quiz_User");
	String memId = null;
	try{
		memId = ((String)session.getAttribute("userId")).trim();
	}catch(Exception e){}


	String quiz_name = request.getParameter("quiz_name");
	String quiz_code = request.getParameter("quiz_Code");
	String table_Scrap = "quiz_scrap_test";

	String sql = null;

	try{
		if( quiz_name != null && quiz_code != null && memId != null){
				sql = "INSERT INTO " + table_Scrap + "(userId, quiz_form_code, quiz_name) values('";
				sql = sql + memId + "', ";
				sql = sql + quiz_code + ",'";
				sql = sql + quiz_name + "');";
				if( stmt.executeUpdate(sql) > 0 ){
%>
			  <script language="JavaScript">      
			  <!--      
				alert("scrap success!");
			  -->
			 </script>
<%
				}else{
%>
			  <script language="JavaScript">      
			  <!--      
				alert("Error!");
			  -->
			 </script>
<%		}
			}
		
	}catch(Exception e){
		System.out.println(e.toString());
	}
	table_Scrap = "quiz_scrap_manager";
	try{
		if( quiz_name != null && quiz_code != null && memId != null){
				sql = "INSERT INTO " + table_Scrap + "(userId, quiz_form_code, quiz_name) values('";
				sql = sql + memId + "', ";
				sql = sql + quiz_code + ",'";
				sql = sql + quiz_name + "');";
				if( stmt.executeUpdate(sql) > 0 ){
%>
			  
<%
				}else{
%>
			  <script language="JavaScript">      
			  <!--      
				alert("Error!");
			  -->
			 </script>
<%		}
			}
		
	}catch(Exception e){
		System.out.println(e.toString());
	}
	try{
		result.close();
		stmt.close();
	}catch(Exception e){};

	stmt = null;
%>
<meta http-equiv="Refresh" content="0;url=Quiz_package.jsp?quiz_User=<%=quiz_User%>" >