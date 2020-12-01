<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="gq.giveaquiz.bbs.BbsDAO"%>
<%@ page import="gq.giveaquiz.bbs.Bbs" %>
<%@ page import="java.io.PrintWriter"%>

<!DOCTYPE html>
<html>
<head>
<%@include file="/commons/head.jspf" %>

<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
</head>
<body>
<!-- ======= naviation ======= -->
<%@include file="/commons/nav.jspf" %>
 <%@include file="/commons/useronly.jspf" %>
 
<section id="hero" class="d-flex align-items-center">  
</section>


<%
	int bbsID = 0;
	if (request.getParameter("bbsID") != null)
		bbsID = Integer.parseInt(request.getParameter("bbsID"));
	if (bbsID == 0) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('유효하지 않은 글 입니다.')");
		script.println("location.href = '/bbs.jsp'");
		script.println("</script>");
	}
	
	Bbs bbs = new BbsDAO().getBbs(bbsID);
%>
<div class="container">
	<div class="card">
		<div class="card-header">
			<h1><%=bbs.getBbsTitle() %></h1>
			<h6><i class='far fa-clock'> </i> <%=bbs.getBbsDate() %></h6>
			<h6><i class='fas fa-portrait'> </i> <%=bbs.getUserId() %></h6>
			<!--  <h6><i class='far fa-eye'></i></h6> -->
		</div>
		<div class="card-body">
			<%=bbs.getBbsContent() %>
		</div>
		<div class="card-footer">
		<a href="/bbs.jsp" class="btn btn-outline-secondary">목록</a>
<% if(session.getAttribute("userId").equals(bbs.getUserId())){ %>
		<a href="update.jsp?bbsID=<%=bbsID%>" class="btn btn-outline-warning">수정</a>
		<a onclick="return confirm('삭제하시겠습니까?')" href="deleteAction.jsp?bbsID=<%=bbsID%>" class="btn btn-outline-danger">삭제</a>
<%} %>
		</div>
	</div>
</div>

	<%@include file="/commons/footer.jspf" %>
	<%@include file="/commons/js.jspf" %>
</body>
</html>