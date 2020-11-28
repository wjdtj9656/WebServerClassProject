<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%

	//String quiz_User = request.getParameter("quiz_User");

	Object quiz_User = ((String)session.getAttribute("userId")).trim();
	String memId = null;
	try{
		memId = ((String)session.getAttribute("userId")).trim();
	}catch(Exception e){
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
              <li><a href="Quiz_list.jsp?quiz_User=<%=quiz_User%>">QUIZ LIST</a></li>
              <li><a href="Quiz_package.jsp?quiz_User=<%=quiz_User%>">시험 보기</a></li>
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

	<% if ( memId != null && memId.equals(quiz_User) ){ %>
      <FORM METHOD="POST" NAME="Quiz_Create" ACTION="Quiz_Create.jsp" onSubmit="return checkInputForm()">
       <input type="hidden" name="quiz_User" value="<%=quiz_User%>">
        <TABLE WIDTH="60%" ALIGN="CENTER" BORDER="1" cellspacing="0" bordercolordark="white" bordercolorlight="black">
          <TR ALIGN="CENTER">
            <TD COLSPAN="2" bgcolor="#00BFFF" ><font color="black">새로운 문제 만들기</font></TD>
          </TR>
          <TR ALIGN="CENTER">
            <TD COLSPAN="2" bgcolor="#87CEFA"><font color="white">객관식 문제</font></TD>
          </TR>
          <TR ALIGN="CENTER">
            <TD WIDTH="10%" >문제</TD>
            <TD WIDTH="90%" ><INPUT TYPE="TEXT" NAME="new_quiz_obj" SIZE="50" MAXLENGTH="50"></TD>
          </TR>
          <TR ALIGN="CENTER">
            
          </TR>
          <% for( int i = 1; i <= 4; i++){ %>
          <TR ALIGN="CENTER">
            <TD >
              
                <INPUT TYPE="RADIO" NAME="new_quiz_obj_check" VALUE="<%=i%>"
                <%= (i == 1 ? "checked" : "")%>
                <%=i%>
              
            </TD>
              <TD >
                
                  <INPUT TYPE="TEXT" NAME="new_quiz_obj_ans" SIZE="50" MAXLENGTH="50">
                
              </TD>
            </TR>
        <% } %>
          <TR ALIGN="CENTER">
            <TD COLSPAN="2" bgcolor="#87CEFA">
            <font color="white">주관식 문제</font>
            </TD>
          </TR>
          <TR ALIGN="CENTER">
            <TD >
            문제</TD>
            <TD >
              <INPUT TYPE="TEXT" NAME="new_quiz_short" SIZE="50" MAXLENGTH="50">
            </TD>
          </TR>
          <TR ALIGN="CENTER">
            <TD >
              정답</TD>
            <TD COLSPAN="2" >
              
              <INPUT TYPE="TEXT" NAME="new_quiz_short_ans" SIZE="50" MAXLENGTH="50">
            
            </TD>
          </TR>
          <TR ALIGN="CENTER">
            <TD COLSPAN=2 ALIGN="CENTER" >
              
              <input type="submit" value="New Quiz">&nbsp;&nbsp;&nbsp;
              <input type="reset" value="Cancel">&nbsp;&nbsp;&nbsp;
              <input type="button" value="List" onclick="document.location.href='Quiz_list.jsp?quiz_User=<%=quiz_User%>'">
                      
            </TD>
          </TR>
        </TABLE>
      </FORM>
      
	<% } %>

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