<%
	request.setCharacterEncoding("UTF-8");
	response.setContentType("text/html; charset=UTF-8");
%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
      <h1>회원가입</h1>
    </div>
    <form class="form-horizontal" action="/user/signup" method="post">
      <div class="input-group mb-3">
        <input type="email" class="form-control" id="userId" name="userId" placeholder="이메일" required>
      </div>
      <div class="input-group mb-3">
        <input type="password" class="form-control" id="password" name="password" placeholder="비밀번호" required>
      </div>
      <div class="controls">
      <div class="input-group mb-3">
        <input type="text" class="form-control" id="name" name="name" placeholder="닉네임" required>
      </div>
        <button type="submit" class="btn btn-primary">회원가입</button>
      </div>
    </form>
      </div>
  </div>
</div>

  </section>
  </main><!-- End #main -->
  <%@include file="/commons/js.jspf" %>
  
  <%@include file="/commons/footer.jspf" %>
</body>

</html>