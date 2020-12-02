<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="gq.giveaquiz.bbs.BbsDAO"%>
<%@ page import="gq.giveaquiz.bbs.Bbs" %>
<%@ page import="java.io.PrintWriter"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@include file="/commons/head.jspf" %>
<%@include file="/commons/useronly.jspf" %>
</head>


<body>

  <!-- ======= naviation ======= -->
  <%@include file="/commons/nav.jspf" %>
  
  
    <section id="hero" class="d-flex align-items-center">  
  </section>
  
 <%@include file="/commons/useronly.jspf" %>
<%
	int bbsID = 0;
	if (request.getParameter("bbsID") != null) {
		bbsID = Integer.parseInt(request.getParameter("bbsID"));
	}
	if (bbsID == 0) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('유효하지 않은 글 입니다.')");
		script.println("location.href = 'bbs.jsp'");
		script.println("</script>");
	}
	Bbs bbs = new BbsDAO().getBbs(bbsID);
	if (!(session.getAttribute("userId").equals(bbs.getUserId()))) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('권한이 없습니다.')");
		script.println("location.href = 'bbs.jsp'");
		script.println("</script>");				
	}
%>

	<div class="container">
		<div class="row">
			<form method="post" action="updateAction.jsp?bbsID=<%=bbsID %>" style="width: 100%">
				<div class="form-group">
		<h1>게시글 수정</h1></div>
				<div class="form-group">
				<input type="text" class="form-control" placeholder="제목" id="bbsTitle" name="bbsTitle" maxlength="50" value="<%=bbs.getBbsTitle() %>" required/>
				</div>
				<div class="form-group">
				<textarea class="form-control" id="bbsContent" name="bbsContent" maxlength="2048" required><%=bbs.getBbsContent() %></textarea>
				</div>
				<button type="submit" class="btn btn-primary pull-right">수정</button>
			</form>
		</div>
	</div>



 
 	<%@include file="/commons/footer.jspf" %>
	<%@include file="/commons/js.jspf" %>
 </body>
 </html>