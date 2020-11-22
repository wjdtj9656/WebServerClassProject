<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

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
      <h1>${user.name}님의 회원정보</h1>
      
    </div>
    <form class="form-horizontal" action="/user/update" method="post">
       <div class="input-group mb-3">
        <input type="email" class="form-control" id="userId" name="userId" value="${user.userId}" readonly>
      </div>
      <div class="input-group mb-3">
        <input type="password" class="form-control" id="password" name="password" value="${user.password}" placeholder="비밀번호">
      </div>
      <div class="input-group mb-3">
        <input type="text" class="form-control" id="name" name="name" value="${user.name}" placeholder="닉네임">
      </div>
      <div class="controls">
        <button type="submit" class="btn btn-primary">수정하기</button>
      </div>
    </form>
      </div>
  </div>
</div>

  </section>
  
  </main><!-- End #main -->
<%@include file="/commons/js.jspf" %>
</body>

</html>