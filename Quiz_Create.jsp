<%@ page contentType = "text/html; charset=euc-kr" %>
<%@ page import = "java.sql.*" %>
<%
request.setCharacterEncoding("euc-kr");
String DB_URL = "jdbc:mysql://127.0.0.1:3307/quizproject?serverTimezone=UTC";

//DB URL Format = "jdbc:mysql://'DB IP':'Connector Port'/'DB_Name'";



String DB_USER = "root";

String DB_PASSWORD= "wjdtj1";

//DB ID/PASSWORD
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

String quiz_User = request.getParameter("quiz_User");
String memId = null;
try{
	memId = ((String)session.getAttribute("userId")).trim();
}catch(Exception e){}

String new_quiz_obj= request.getParameter("new_quiz_obj");
String [] new_quiz_obj_ans = request.getParameterValues("new_quiz_obj_ans");

String temp = null;
	int new_quiz_obj_check = 0;
	try{
		new_quiz_obj_check = Integer.parseInt( request.getParameter("new_quiz_obj_check") );

		temp = new_quiz_obj_ans[new_quiz_obj_check - 1];	
		new_quiz_obj_ans[new_quiz_obj_check - 1] = new_quiz_obj_ans[0];
		new_quiz_obj_ans[0] = temp;
	}catch(Exception e){
		System.out.println(e.toString());
    }
    

String new_quiz_short = request.getParameter("new_quiz_short");
String new_quiz_short_ans = request.getParameter("new_quiz_short_ans");

    String sql = null;
	String table_obj = "quiz_obj";
    String table_short = "quiz_short";
    
    try{
		if( new_quiz_obj != null && new_quiz_obj_ans.length > 0 && new_quiz_obj_check > 0 
			&& !new_quiz_obj.equals("") ){
			sql = "INSERT INTO " + table_obj + "(userId,quiz_obj, quiz_obj_ans1, quiz_obj_ans2, quiz_obj_ans3, quiz_obj_ans4) VALUES ('";
	
			sql = sql + memId +"','";
			sql = sql + new_quiz_obj + "','";
			sql = sql + new_quiz_obj_ans[0] + "','";
			sql = sql + new_quiz_obj_ans[1] + "','";
			sql = sql + new_quiz_obj_ans[2] + "','";
            sql = sql + new_quiz_obj_ans[3] + "'); ";
            stmt.executeUpdate(sql);
		}
	}catch(Exception e){
		System.out.println(e.toString());
	}

    try{
		if( new_quiz_short != null && new_quiz_short_ans != null && !new_quiz_short.equals("")
			&& !new_quiz_short_ans.equals("") ){
            sql = "INSERT INTO " + table_short + "(userId, quiz_short, quiz_short_ans) VALUES ('";
			
            sql = sql + memId +"','";
			sql = sql + new_quiz_short + "','";
			sql = sql + new_quiz_short_ans + "');";
			stmt.executeUpdate(sql);
		}
			
		
	}catch(Exception e){
		System.out.println(e.toString()+"haz");
    }
    
	response.sendRedirect("quizBoard.jsp?quiz_User=" + quiz_User);
%>