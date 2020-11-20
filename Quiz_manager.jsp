<%@ page contentType="text/html;charset=euc-kr"%>
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


	String quiz_Name = request.getParameter("quiz_Name");
	String quiz_Code = request.getParameter("quiz_Code");
	String table_Name = null;
	String quiz_Table_Name = null;
	String sql = null;

	String [] quiz_obj = request.getParameterValues("quiz_obj");
	String [] quiz_short = request.getParameterValues("quiz_short");

	boolean trueable = true; // 이것을 이용한 내용 없음에 대한 방편을 만들어야 한다.


	if( trueable ) {
		//퀴즈 매니저 테이블에 퀴즈의 이름과 코드를 등록 시킨다.
		table_Name = "quiz_Manager";
		sql = "INSERT INTO " + table_Name + "(quiz_name, quiz_form_code) VALUES ('  ";
		sql = sql + quiz_Name +   "','";
		sql = sql + quiz_Code +    " ') ";
		stmt.executeUpdate( sql );		
	}

	// 코드에 맞는 퀴즈를 등록 시킨다. (객관식)
	table_Name = "quiz_Form";
	quiz_Table_Name = "quiz_obj";

	try{
		if( trueable ) {

			if( quiz_obj != null ){
				for( int i = 0; i < quiz_obj.length; i++ ){
					if( quiz_obj[i] != null ){
						sql = "INSERT INTO " + table_Name + "(quiz_form_code, quiz_id, quiz_table) VALUES ('";

						sql = sql + quiz_Code + "',";
						sql = sql + quiz_obj[i] + ",'";
						sql = sql + quiz_Table_Name + "' );";
						stmt.executeUpdate( sql );
					}
				}
			}
		}
	}catch(Exception e){}
	// 코드에 맞는 퀴즈를 등록 시킨다. (주관식)
	table_Name = "quiz_Form";
	quiz_Table_Name = "quiz_short";

	try{
		if( trueable ){

			if( quiz_short != null ){
				for( int i = 0; i < quiz_short.length; i++ ){
					if( quiz_short[i] != null ){
						sql = "INSERT INTO " + table_Name + "(quiz_form_code, quiz_id, quiz_table) VALUES ('";

						sql = sql + quiz_Code + "', ";
						sql = sql + quiz_short[i] + ",'";
						sql = sql + quiz_Table_Name + "' );";
						stmt.executeUpdate( sql );
					}
				}
			}
		}
	}catch(Exception e){}

	try{
		result.close();
		stmt.close();
	}catch(Exception e){};

	stmt = null;
	response.sendRedirect( "Quiz_package.jsp" );
%>