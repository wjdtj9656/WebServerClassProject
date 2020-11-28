<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html lang="en">

<head>
<%@include file="/commons/head.jspf" %>
</head>

<body>



  <!-- ======= naviation ======= -->
  <%@include file="/commons/nav.jspf" %>
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

    <!-- ======= Featured Services Section ======= -->
    <section id="featured-services" class="featured-services">
      <div class="container" data-aos="fade-up">

        <div class="row">
          <div class="col-md-6 col-lg-3 d-flex align-items-stretch mb-5 mb-lg-0">
            <div class="icon-box" data-aos="fade-up" data-aos-delay="100">
              <div class="icon"><i class="bx bxl-dribbble"></i></div>
              <h4 class="title"><a href="">회원가입 하기</a></h4>
              <p class="description">처음이라면 회원가입을 해주세요!</p>
            </div>
          </div>

          <div class="col-md-6 col-lg-3 d-flex align-items-stretch mb-5 mb-lg-0">
            <div class="icon-box" data-aos="fade-up" data-aos-delay="200">
              <div class="icon"><i class="bx bx-file"></i></div>
              <h4 class="title"><a href="">문제 공유</a></h4>
              <p class="description">자신이 만든 문제를 공유 해보세요"</p>
            </div>
          </div>

          <div class="col-md-6 col-lg-3 d-flex align-items-stretch mb-5 mb-lg-0">
            <div class="icon-box" data-aos="fade-up" data-aos-delay="300">
              <div class="icon"><i class="bx bx-tachometer"></i></div>
              <h4 class="title"><a href="">문제풀기</a></h4>
              <p class="description">자신이 만든 문제 OR 타인이 만든 퀴즈를 풀어보세요.</p>
            </div>
          </div>

          <div class="col-md-6 col-lg-3 d-flex align-items-stretch mb-5 mb-lg-0">
            <div class="icon-box" data-aos="fade-up" data-aos-delay="400">
              <div class="icon"><i class="bx bx-world"></i></div>
              <h4 class="title"><a href="">모두에게 소개해주세요</a></h4>
              <p class="description">퀴즈가 많아질수록 공부하기가 쉬워집니다.</p>
            </div>
          </div>

        </div>

      </div>
    </section><!-- End Featured Services Section -->

    <!-- ======= About Section ======= -->
    <section id="about" class="about section-bg">
      <div class="container" data-aos="fade-up">

        <div class="section-title">
          <h2>About</h2>
          <h3>공부 할 양이 <span>많으신가요?</span></h3>
          <p>퀴즈로 공부하여 오랫동안 손쉽게 기억 해보세요.</p>
        </div>

        <div class="row">
          <div class="col-lg-6" data-aos="zoom-out" data-aos-delay="100">
            <img src="assets/img/about.jpg" class="img-fluid" alt="">
          </div>
          <div class="col-lg-6 pt-4 pt-lg-0 content d-flex flex-column justify-content-center" data-aos="fade-up" data-aos-delay="100">
            <h3>퀴즈를 만들고 공유하세요.</h3>
            <p class="font-italic">
              퀴즈의 조회수에 따라 포인트 지급을 예정 중 입니다.
            </p>
            <ul>
              <li>
                <i class="bx bx-store-alt"></i>
                <div>
                  <h5>퀴즈를 풀어보세요.</h5>
                  <p>문제를 풀다보면 자동으로 외워집니다.</p>
                </div>
              </li>
              <li>
                <i class="bx bx-images"></i>
                <div>
                  <h5>퀴즈를 내보세요.</h5>
                  <p>퀴즈를 내다보면 학습의 깊이가 달라집니다.</p>
                </div>
              </li>
            </ul>
            <p>
              퀴즈를 통해 나의 지식을 더욱 견고하게 만들 수 있습니다.
            </p>
          </div>
        </div>

      </div>
    </section><!-- End About Section -->
    
    <!-- ======= Team Section ======= -->
    <section id="team" class="team section-bg">
      <div class="container" data-aos="fade-up">

        <div class="section-title">
          <h2>Team</h2>
          <h3>웹서버플밍 <span>7Team</span></h3>
          <p>웹서버프로그래밍 프로젝트를 함께한 7팀의 팀원들.</div>

        <div class="row">

          <div class="col-lg-3 col-md-6 d-flex align-items-stretch" data-aos="fade-up" data-aos-delay="100">
            <div class="member">
              <div class="member-img">
                <img src="assets/img/team/team-1.jpg" class="img-fluid" alt="">
                <div class="social">
                  <a href=""><i class="icofont-twitter"></i></a>
                  <a href=""><i class="icofont-facebook"></i></a>
                  <a href=""><i class="icofont-instagram"></i></a>
                  <a href=""><i class="icofont-linkedin"></i></a>
                </div>
              </div>
              <div class="member-info">
                <h4>김정서</h4>
                <span>CEO</span>
              </div>
            </div>
          </div>


          <div class="col-lg-3 col-md-6 d-flex align-items-stretch" data-aos="fade-up" data-aos-delay="300">
            <div class="member">
              <div class="member-img">
                <img src="assets/img/team/team-3.jpg" class="img-fluid" alt="">
                <div class="social">
                  <a href=""><i class="icofont-twitter"></i></a>
                  <a href=""><i class="icofont-facebook"></i></a>
                  <a href=""><i class="icofont-instagram"></i></a>
                  <a href=""><i class="icofont-linkedin"></i></a>
                </div>
              </div>
              <div class="member-info">
                <h4>안성준</h4>
                <span>CTO</span>
              </div>
            </div>
          </div>

          <div class="col-lg-3 col-md-6 d-flex align-items-stretch" data-aos="fade-up" data-aos-delay="400">
            <div class="member">
              <div class="member-img">
                <img src="assets/img/team/team-4.jpg" class="img-fluid" alt="">
                <div class="social">
                  <a href=""><i class="icofont-twitter"></i></a>
                  <a href=""><i class="icofont-facebook"></i></a>
                  <a href=""><i class="icofont-instagram"></i></a>
                  <a href=""><i class="icofont-linkedin"></i></a>
                </div>
              </div>
              <div class="member-info">
                <h4>황정하</h4>
                <span>Accountant</span>
              </div>
            </div>
          </div>

        </div>

      </div>
    </section><!-- End Team Section -->

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

<%@include file="/commons/js.jspf" %>

</body>

</html>