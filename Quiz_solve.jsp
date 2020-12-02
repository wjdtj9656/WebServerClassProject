<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>

<%

request.setCharacterEncoding("UTF-8");
response.setContentType("text/html; charset=UTF-8");

String DB_URL = "jdbc:mysql://118.67.129.53:3306/quizproject?serverTimezone=UTC";

// DB URL Format = "jdbc:mysql://'DB IP':'Connector Port'/'DB_Name'";
	
 

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
	

	String quiz_Name = request.getParameter("quiz_name");
	String quiz_Code = request.getParameter("quiz_Code");
	String sql = null;

	String tableName_Manager = "quiz_manager";
	String tableName_QuizForm = "quiz_form";
	String tableName_short = "quiz_short";
	String tableName_obj = "quiz_obj";
	String number = null;
	


	int [] randomNumber;

	int count_obj = 0;
	int count_T = 0; //문제의번호

	

	try{
		sql = "SELECT  userId,quiz_name FROM " + tableName_Manager + " WHERE quiz_form_code =" ;
		sql = sql +"'"+quiz_Code + "' and userId ='" + quiz_User+ "';" ;
		result = stmt.executeQuery( sql );
		result.next();
		quiz_Name = result.getString("quiz_name");
		
	}catch(Exception e){
		System.out.println( e.toString() );
	}
%>

<%!
	public static int [] getRandomNumber(){
		boolean trueable = true;
		int [] randomNumber = new int[4];
		
		for(int j = 0; j < randomNumber.length; j++){
			trueable = false;
			while( !trueable ){
				randomNumber[j] = (int)(Math.random() * 4)+1;
				trueable = true;
				if( j > 0 )
					for(int i = 0; i <= j; i++ )
						for( int k = 0; k <= j; k++ )
							if( randomNumber[i] == randomNumber[k] && i != k )
								trueable = false;
			}
		}
		return  randomNumber;
	}
%>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>퀴즈내봐</title>
  <meta content="" name="description">
  <meta content="" name="keywords">

  <!-- Favicons -->
  <link href="assets/img/favicon.png" rel="icon">
  <link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Roboto:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

  <!-- Vendor CSS Files -->
  <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="assets/vendor/icofont/icofont.min.css" rel="stylesheet">
  <link href="assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
  <link href="assets/vendor/owl.carousel/assets/owl.carousel.min.css" rel="stylesheet">
  <link href="assets/vendor/venobox/venobox.css" rel="stylesheet">
  <link href="assets/vendor/aos/aos.css" rel="stylesheet">
  <!-- Template Main CSS File -->
  <link href="assets/css/style.css" rel="stylesheet">
</head>

<body>



  <!-- ======= naviation ======= -->
  <header id="header" class="fixed-top">
    <div class="container d-flex align-items-center">

      <h1 class="logo mr-auto"><a href="index.jsp">퀴즈내봐<span>.</span></a></h1>
 
      <nav class="nav-menu d-none d-lg-block">
        <ul>
          <li class="active"><a href="index.jsp">Home</a></li>
          <li class="drop-down"><a href="">QUIZ</a>
            <ul>
              <li><a href="quizBoard.jsp">QUIZ 내기</a></li>
              <li><a href="Quiz_list.jsp">QUIZ LIST</a></li>
              <li><a href="Quiz_package.jsp">시험 보기</a></li>
            </ul>
          </li>
          <li><a href="normalBoard.jsp">커뮤니티</a></li>
          <li class="drop-down"><a href="">Drop Down</a>
            <ul>
              <li><a href="#">Drop Down 1</a></li>
              <li><a href="#">Drop Down 2</a></li>
              <li><a href="#">Drop Down 3</a></li>
              <li><a href="#">Drop Down 4</a></li>
            </ul>
          </li>
          
          <li><a href="#footer">contact</a></li>          
        </ul>
      </nav>

    </div>
  </header><!-- End Header -->

  <!-- ======= Hero Section ======= -->
  <section id="hero" class="d-flex align-items-center">
    <div class="container" data-aos="zoom-out" data-aos-delay="100">
      <h1>Welcome to <span>Quiz World</spa>
      </h1>
      <h2>퀴즈로 쉽게 공부하세요.</h2>
      <div class="d-flex">
        <a href="#about" class="btn-get-started scrollto">시작하기</a>
        <a href="https://www.youtube.com/watch?v=Q6SkKTf6z20&ab_channel=%5B%ED%96%84%EC%A7%80%5DHamzy" class="venobox btn-watch-video" data-vbtype="video" data-autoplay="true"> 사용방법 <i class="icofont-play-alt-2"></i></a>
      </div>
    </div>
  </section><!-- End Hero -->

  <main id="main">
<br>
	<FORM METHOD="POST" NAME="Quiz_Manager" ACTION="Quiz_check.jsp">
		<INPUT TYPE="HIDDEN" NAME="quiz_Code" VALUE="<%=quiz_Code%>">
		<INPUT TYPE="HIDDEN" NAME="quiz_Name" VALUE="<%=quiz_Name%>">
		<INPUT TYPE="HIDDEN" NAME="quiz_User" VALUE="<%=quiz_User%>">	
		<TABLE WIDTH="60%" ALIGN="CENTER" BORDER="1" cellspacing="0" bordercolordark="white" bordercolorlight="black">
			<TR>
				<TD COLSPAN="2" ALIGN="CENTER" bgcolor="#00BFFF" >					
						Test Name: <%=quiz_Name%>					
				</TD>
			</TR>
			<TR>
				<TD COLSPAN="2" ALIGN="CENTER"bgcolor="#87CEFA" >				
						obj quiz				
				</TD>
			</TR>
<%

	try{	
		sql = "SELECT * FROM " + tableName_QuizForm + " INNER JOIN " + tableName_obj ;
		sql = sql + " ON " + tableName_QuizForm + ".quiz_id = " + tableName_obj + ".quiz_id ";
		sql = sql + " WHERE quiz_form_code = '" + quiz_Code + "' AND quiz_table = " ;
		sql = sql + " '" + tableName_obj + "' and " + tableName_QuizForm + ".userId = '" +  quiz_User + "';";
		result = stmt.executeQuery( sql );

	}catch(Exception e){
	}

	try{
		while( result.next() ){
			number = result.getString("quiz_id");
%>
			<TR ALIGN="LEFT">
				<TD WIDTH="10%" ALIGN="CENTER" >					
					&nbsp;<%=++count_T%>					
				</TD>
				<TD WIDTH="90%" >
					<font face="human">
					 &nbsp;<%=result.getString("quiz_obj")%>
					
				</TD>
			</TR>
<%		count_obj++;
			randomNumber = getRandomNumber();
%>
			<INPUT TYPE="HIDDEN" NAME="quiz_objX" VALUE="<%=number%>">
<%		for(int i=0; i < 4; i++){ %>			
			<TR>
				<TD ALIGN="CENTER" >					
					<INPUT TYPE="RADIO" NAME="quiz_obj_<%=count_obj%>" VALUE="
					<%=result.getString("quiz_obj_ans" + randomNumber[i])%>" <%=(i==0?"CHECKED":"")%>					
					
						&nbsp;<%=i+1%>
					
									
				</TD>
				<TD >
				<font face="human">
					<%=result.getString("quiz_obj_ans" + randomNumber[i])%>
				
				</TD>
			</TR>
<%		}

		}
	}catch(Exception e){
		System.out.println( e.toString() );
	}
%>
		<TR>
			<TD COLSPAN="2" ALIGN="CENTER" bgcolor="#87CEFA">
				short quiz
			</TD>
		</TR>
<%		

	try{

		sql = "SELECT * FROM " + tableName_QuizForm + " INNER JOIN " + tableName_short ;
		sql = sql + " ON " + tableName_QuizForm + ".quiz_id = " + tableName_short + ".quiz_id ";
		sql = sql + " WHERE quiz_form_code = '" + quiz_Code + "' AND quiz_table = " ;
		sql = sql + " '" + tableName_short + "' and " + tableName_QuizForm + ".userId = '" +  quiz_User + "';";
		result = stmt.executeQuery( sql );
		System.out.println(sql);
	}catch(Exception e){
	}

	try{
		while( result.next() ){
			number = result.getString("quiz_id");
%>
			<TR ALIGN="LEFT">
				<TD WIDTH="10%" ALIGN="CENTER" >
					
					
					&nbsp;<%=++count_T%>
					
				</TD>
				<TD WIDTH="90%" >
					
						&nbsp;<%=result.getString("quiz_short")%>
					
				</TD>
			</TR>
			<TR>
				<TD COLSPAN="2" ALIGN="CENTER" >
					<font face="human">
						<INPUT TYPE="TEXT" NAME="quiz_short" SIZE="50">
						<INPUT TYPE="HIDDEN" NAME="quiz_shortX" VALUE="<%=number%>">
									
				</TD>
			</TR>
<%
		}
	}catch(Exception e){
	}
%>
			<TR ALIGN="CENTER">
				<TD COLSPAN=2 ALIGN="CENTER"bgcolor="#87CEFA" >
					<font face="human">
					<input type="submit" value="check">&nbsp;&nbsp;&nbsp;
					<input type="reset" value="reset">
					
				</TD>
			</TR>
			<TR>
				<TD ALIGN="CENTER" COLSPAN="2"bgcolor="#87CEFA" >
					<% String url = "Quiz_list.jsp?quiz_User=" + quiz_User;%>
					<input type="button" value="quiz_list" onclick="document.location.href='<%=url%>'">
					<input type="button" value="test list" onclick="document.location.href='Quiz_package.jsp?quiz_User=<%=quiz_User%>'">
				</TD>
			</TR>
		</TABLE>
		<input type="hidden" name="count_obj" value="<%=count_obj%>">
	</FORM>
</main><!-- End #main -->

<!-- ======= Footer ======= -->
<footer id="footer">

  <div class="footer-top">
	<div class="container">
	  <div class="row">

		<div class="col-lg-3 col-md-6 footer-contact">
		  <h3>퀴즈내봐<span>.</span></h3>
		  <p>
			서울과학기술대학교<br>
			웹서버 프로그래밍<br>
			7팀 프로젝트<br><br>
			<strong>Phone:</strong> 010-3881-9667<br>
			<strong>Email:</strong> wjdtj9656@gmail.com<br>
		  </p>
		</div>

		<div class="col-lg-3 col-md-6 footer-links">
		  <h4>도움되는 링크</h4>
		  <ul>
			<li><i class="bx bx-chevron-right"></i> <a href="main.jsp">Home</a></li>
			<li><i class="bx bx-chevron-right"></i> <a href="#about">About</a></li>
			<li><i class="bx bx-chevron-right"></i> <a href="#">문제 게시판</a></li>
			<li><i class="bx bx-chevron-right"></i> <a href="#">커뮤니티</a></li>
			<li><i class="bx bx-chevron-right"></i> <a href="#">여분</a></li>
		  </ul>
		</div>


	  </div>
	</div>
  </div>

  <div class="container py-4">
	<div class="copyright">
	  &copy; Copyright <strong><span>웹서버플밍 7팀</span></strong>. All Rights Reserved
	</div>
  </div>
</footer><!-- End Footer -->

<div id="preloader"></div>
<a href="#" class="back-to-top"><i class="icofont-simple-up"></i></a>

<!-- Vendor JS Files -->
<script src="assets/vendor/jquery/jquery.min.js"></script>
<script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="assets/vendor/jquery.easing/jquery.easing.min.js"></script>
<script src="assets/vendor/php-email-form/validate.js"></script>
<script src="assets/vendor/waypoints/jquery.waypoints.min.js"></script>
<script src="assets/vendor/counterup/counterup.min.js"></script>
<script src="assets/vendor/owl.carousel/owl.carousel.min.js"></script>
<script src="assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
<script src="assets/vendor/venobox/venobox.min.js"></script>
<script src="assets/vendor/aos/aos.js"></script>

<!-- Template Main JS File -->
<script src="assets/js/main.js"></script>

</body>

</html>

<%

	try{
		result.close();
		stmt.close();
	}catch(Exception e){};

	stmt = null;
%>