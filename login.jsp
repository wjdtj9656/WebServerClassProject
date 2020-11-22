<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<head>
	<%@include file="/commons/head.jspf" %>
</head>

<body>
  <!-- ======= naviation ======= -->
  <%@include file="/commons/nav.jspf" %>
 
 
     <section id="hero" class="d-flex align-items-center">  
  </section>
 
  
   <main id="main">
     <section>
<div class="container">
  <div >
      <div >
    <div class="page-header">
      <h1>로그인</h1>
    </div>
    <form class="form-horizontal" action="/user/login" method="post">
      <%
      Object errorMessage = request.getAttribute("errorMessage");
      if(errorMessage != null){
      %>
      <div class="alert alert-danger alert-dismissible fade show">
        <button type="button" class="close" data-dismiss="alert">&times;</button>
  		<strong>로그인 실패</strong> <%= errorMessage %>
	  </div>
      <%    
          }
      %>
      <div class="input-group mb-3">
        <input type="email" class="form-control" id="userId" name="userId" placeholder="이메일" required>
      </div>
      <div class="input-group mb-3">
        <input type="password" class="form-control" id="password" name="password" placeholder="비밀번호" required>
      </div>
      <div class="controls">
        <button type="submit" class="btn btn-primary">로그인</button>
      </div>
    </form>
      </div>
  </div>
</div>

  </section>
  </main><!-- End #main -->

</body>

</html>