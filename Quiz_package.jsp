<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<style type="text/css"> 
<!-- 
A:hover  {color:#9966CC;text-decoration:none; }
--> 
</style> 



<%
	request.setCharacterEncoding("euc-kr");
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
	
	
String quiz_User = request.getParameter("quiz_User");
String memId = null;
try{
	memId = ((String)session.getAttribute("userId")).trim();
}catch(Exception e){}
	ResultSet result = null;

	String sql = null;

	String tableName_Manager = "quiz_Manager";
	//String tableName_scrap = "quiz_manager";
	//String tableScrap = "quiz_Scrap_test";

	String tableName_scrap = "quiz_Scrap_test";
	String tableScrap = "quiz_scrap_manager";
	String url = null;
	
	
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
          <li><a href="#about">About</a></li>
          <li><a href="#team">OUR TEAM</a></li>
          <li class="drop-down"><a href="">QUIZ</a>
            <ul>
              <li><a href="quizBoard.jsp">QUIZ 내기</a></li>
              <li><a href="Quiz_list.jsp?quiz_User=<%=quiz_User%>"">QUIZ LIST</a></li>
              <li><a href="Quiz_package.jsp?quiz_User=<%=quiz_User%>"">시험 보기</a></li>
            </ul>
          </li>
          <li><a href="normalBoard.jsp">커뮤니티</a></li>
          <li><a href="signup.jsp">회원가입</a></li>
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

<TABLE WIDTH="60%" ALIGN="CENTER" BORDER="1" cellspacing="0" bordercolordark="white" bordercolorlight="black">
		<TR>
			<TD COLSPAN="3" ALIGN="CENTER" bgcolor="#87CEFA">
				<font color="white">
					quiz package
				</font>				
			</TD>
		</TR>
<%	
	try{ 
		
		try{
			sql = "SELECT * FROM " + tableName_Manager + " WHERE userId='" + quiz_User ;
			sql = sql +"' ORDER BY quiz_name ASC;";
			result = stmt.executeQuery( sql );
		}catch(Exception e){
			System.out.println( e.toString() );
		}
		
		url = null;
		while( result.next() ){ 

%>
		<TR ALIGN="LEFT">
			<TD WIDTH="75%" >									
						&nbsp;&nbsp;package test&nbsp;&nbsp;:&nbsp;				
		<A HREF="Quiz_solve.jsp?quiz_User=<%=quiz_User%>&quiz_Code=<%=result.getString("quiz_form_code")%>">
					<span style="font-size:9pt;">		
					<%=result.getString("userId")%>			
						 <%=result.getString("quiz_name")%>
					 </span>
				</A>
			</TD>
			<TD WIDTH="10%"  ALIGN="CENTER">
				<% if( result.getString("userId").equals(memId) ){ %>
				<% url="Quiz_package_remove.jsp?quiz_Code=" + result.getString("quiz_form_code"); 
					url=url + "&quiz_User=" + quiz_User; %>
				<input type="button" value="delete" onclick="document.location.href='<%=url%>'">
				<% }else if( memId != null ){ %>
					<% url="Quiz_scrap_test.jsp?quiz_Code=" + result.getString("quiz_form_code");
					url=url + "&quiz_name=" + result.getString("quiz_name") + "&quiz_User=" + quiz_User; %>
					<input type="button" value="scrap!" onclick="document.location.href='<%=url%>'">
				<% }else{ %> &nbsp; <% } %>
			</TD>
		</TR>
<%		}
		
	}catch(Exception e){}
%>
<TR>
			<TD COLSPAN="3" ALIGN="CENTER" bgcolor="#87CEFA">
				<font color="white">
					quiz scrap package
				</font>				
			</TD>
		</TR>
<%	
	try{ 
		sql = "SELECT * FROM " + tableName_scrap + " INNER JOIN " + tableScrap ;
		sql = sql + " ON " + tableName_scrap + ".quiz_name = " + tableScrap + ".quiz_name ";
		sql = sql + " WHERE " + tableScrap + ".userId = '" + quiz_User + "' ";
		sql = sql + " ORDER BY " + tableName_scrap + ".userId ASC;";
		result = stmt.executeQuery( sql );

		url = null;
		while( result.next() ){ 
			 if ( result.getString("quiz_Scrap_test.userId").equals(memId)){
%>
		<TR ALIGN="LEFT">
			<TD WIDTH="75%" >									
						&nbsp;&nbsp;package scrap test&nbsp;&nbsp;:&nbsp;				
		<A HREF="Quiz_solve.jsp?quiz_User=<%=quiz_User%>&quiz_Code=<%=result.getString("quiz_form_code")%>&quiz_name=<%=result.getString("quiz_name")%>">
					<span style="font-size:9pt;">		
					<%=result.getString("userId")%>			
						 <%=result.getString("quiz_name")%>
						 
                       (스크랩됨)
					 </span>
				</A>
			</TD>
			<TD WIDTH="10%"  ALIGN="CENTER">
				<% if( memId!=null ){ %>
				<% url="Quiz_package_scrap_remove.jsp?quiz_Code=" + result.getString("quiz_form_code"); 
					url=url + "&quiz_User=" + quiz_User; %>
				<input type="button" value="delete" onclick="document.location.href='<%=url%>'">
				<%  }else{ %> &nbsp; <% } %>
			</TD>
		</TR>
<%		}
		}
	}catch(Exception e){}
%>
		<TR ALIGN="CENTER">
			<TD COLSPAN="3" ALIGN="CENTER" bgcolor="#87CEFA">		
					<% url = "Quiz_list.jsp?quiz_User=" + quiz_User;  %>
					<input type="button" value="quiz list" onclick="document.location.href='<%=url%>'">				
			</TD>
		</TR>
		
</TABLE>
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
