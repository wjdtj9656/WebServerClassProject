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


	String number = request.getParameter("number");
	String quiz_Table = request.getParameter("quiz_Table");
	String table_Scrap = "quiz_Scrap";

	String sql = null;

	try{
		if( number != null && quiz_Table != null && memId != null){
			if( quiz_Table.equals("quiz_obj") || quiz_Table.equals("quiz_short") ){
				sql = "INSERT INTO " + table_Scrap + "(userId, quiz_id, quiz_table) values('";
				sql = sql + memId + "', ";
				sql = sql + number + ",'";
				sql = sql + quiz_Table + "');";
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
<meta http-equiv="Refresh" content="0;url=Quiz_list.jsp?quiz_User=<%=quiz_User%>" >