<%@ page language="java" contentType="text/html; charset=UTF-8" 
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>

<!DOCTYPE html>
<html>
<head>
<%@include file="/commons/head.jspf" %>
</head>


<body>
  <%@include file="/commons/useronly.jspf" %>
<!-- ======= naviation ======= -->
<%@include file="/commons/nav.jspf" %>
 
 
<section id="hero" class="d-flex align-items-center">  
</section>

	<div class="container">
		<div class="row">
			<form method="post" action="writeAction.jsp" style="width: 100%">
				<div class="form-group"></div>
				<div class="form-group">
				<input type="text" class="form-control" placeholder="제목" id="bbsTitle" name="bbsTitle" maxlength="50" required/>
				</div>
				<div class="form-group">
				<textarea class="form-control" id="bbsContent" name="bbsContent" maxlength="2048" required></textarea>
				</div>
				<input type="submit" class="btn btn-primary pull-right" value="게시"/>
			</form>
		</div>
	</div>


	
	<%@include file="/commons/js.jspf" %>
	
	<%@include file="/commons/footer.jspf" %>

</body>
</html>