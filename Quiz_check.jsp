
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<% request.setCharacterEncoding("euc-kr");%>
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

	int point_obj=0, point_short=0, size_short=0, size_obj=0;
	String quiz_User = request.getParameter("quiz_User");

	int count_obj = 0;
	String [] quiz_obj = null;
	try{
		count_obj = Integer.parseInt(request.getParameter("count_obj"));
		quiz_obj = new String[count_obj];
		for(int i=0; i< count_obj;i++){
			quiz_obj[i] = request.getParameter("quiz_obj_" + (i + 1) ).trim();
			System.out.println(quiz_obj[i].trim());
		}
		size_obj = count_obj;
	}catch(Exception e){}

	String [] quiz_short= request.getParameterValues("quiz_short");
	try{
		if( quiz_short.length > 0 )
			size_short = quiz_short.length;
	}catch(Exception e){}

	String [] quiz_objX = request.getParameterValues("quiz_objX");
	String [] quiz_shortX = request.getParameterValues("quiz_shortX");

	String quiz_Name = request.getParameter("quiz_Name");
	String quiz_Code = request.getParameter("quiz_Code")	;
	String tableName = null;
	String sql = null;



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
	
	<TABLE BORDER="1" ALIGN="CENTER" WIDTH="60%" cellspacing="0" bordercolordark="white" bordercolorlight="black">
		<TR>
			<TD COLSPAN="2" ALIGN="CENTER" bgcolor="#00BFFF" >
								
				(<%=quiz_Name%>)'s result
			</TD>
		</TR>
<%	for(int i=0; i< size_obj; i++){
			tableName = "quiz_obj";
			String temp = null;
			try{
				sql = "SELECT quiz_obj_ans1 FROM " + tableName + " WHERE quiz_id = " + quiz_objX[i] + ";";
				result = stmt.executeQuery( sql );
				result.next();	
				temp = result.getString("quiz_obj_ans1");
			}catch(Exception e){}
%>
		<TR ALIGN="CENTER">
			<TD WIDTH="50%" >
				<%=i+1%>
				
			</TD>
			<TD ALIGN="CENTER" WIDTH="50%" >				
				
<%		try{
				if( quiz_obj[i].equals( temp ) ){
						out.print("(O)");
						point_obj = point_obj + 1;
					}else{
						out.print("(X)");
					}
			}catch(Exception e){
				System.out.println( e.toString() );
			}
%>			
				
			</TD>
		</TR>
<%	}
	try{
		for(int i=0; i< size_short; i++){
			tableName = "quiz_short";
			sql = "SELECT COUNT(quiz_short_ans) FROM " + tableName + " WHERE quiz_id = " + quiz_shortX[i];
			sql = sql + " AND quiz_short_ans = '" + quiz_short[i] + "';";
			result = stmt.executeQuery( sql );
			result.next();
%>
		<TR ALIGN="CENTER">
			<TD >
								
					<%=(size_obj + i + 1)%>
							
			</TD>
			<TD ALIGN="CENTER" >				
				
<%				if( Integer.parseInt( result.getString(1) ) > 0 ){
						out.print("(O)");
						point_short = point_short + 1;
					}else{
						out.print("(X)");
					}
%>
				
			</TD>
		</TR>
<%	}	
	}catch(Exception e){
		System.out.println( e.toString() );
	}

%>
		<TR ALIGN="CENTER">
			<TD bgcolor="#87CEFA" >
				
				obj score
				
			</TD>
			<TD >
				
				(<%=point_obj%>/<%=size_obj%>)
				
			</TD>			
		</TR>
		<TR ALIGN="CENTER">
			<TD >
				
				
					obj's percent
				
				
			</TD>
			<TD >
							
			<% if( size_obj > 0 ){
					out.print( (int)( 100.0 * (float)point_obj  / (float)size_obj  ));
				}else{
				    out.print("0"); 
				}
			%>%
				
			</TD>
			<TR ALIGN="CENTER">
				<TD bgcolor="#87CEFA" >
				
					short quiz
				
				</TD>
				<TD >
					
<% try{	%>
						(<%=point_short%>/<%=size_short%>)
<% }catch(Exception e){} %>
					
				</TD>
			</TR>
			<TR ALIGN="CENTER">
				<TD >
					
					short's percent
					
				</TD>			
				<TD >
					
<% try{	%>
					<% if( size_short > 0 ){
							out.print( (int)( 100.0 * (float)point_short  / (float)size_short  ));
						}else{
							out.print("0"); 
						}
					%>%
<% }catch(Exception e){} %>
					
				</TD>
			</TR>
			<TR ALIGN="CENTER">
				<TD bgcolor="#87CEFA">
					
					all score
					
				</TD>
				<TD >
					
					
<% try{	%>
						(<%=(point_short+point_obj)%>/<%=(size_short+size_obj)%>)
<% }catch(Exception e){} %>
					
					
				</TD>
			</TR>
			<TR ALIGN="CENTER">
				<TD >
					all's percent
				</TD>
				<TD >
					
<% try{	%>
						<%=(int)(100 * ( (float)point_short+(float)point_obj )/((float)size_short+(float)size_obj))%>%
<% }catch(Exception e){} %>
					
				</TD>
			</TR>
			<TR>
				<TD ALIGN="CENTER" COLSPAN="2" bgcolor="#87CEFA" >
					<input type="button" value="quiz list" onclick="document.location.href='Quiz_list.jsp'">
					<input type="button" value="test list" onclick="document.location.href='Quiz_package.jsp'">
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

</body>

</html>
<%
	try{
		result.close();
		stmt.close();
	}catch(Exception e){};

	stmt = null;
%>
