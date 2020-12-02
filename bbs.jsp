<%@ page language="java" contentType="text/html; charset=UTF-8" 
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="gq.giveaquiz.bbs.BbsDAO" %>
<%@ page import="gq.giveaquiz.bbs.Bbs" %>
<%@ page import="java.util.ArrayList" %>

<!DOCTYPE html>
<html>
<head>
<%@include file="/commons/head.jspf" %>
<%@include file="/commons/useronly.jspf" %>
</head>


<body>

<%
	String userID = null;
	
	if (session.getAttribute("userID") != null)
		userID = (String) session.getAttribute("userID");

	int pageNumber=1;
	
	if (request.getParameter("pageNumber") != null) 
		pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
%>


<!-- ======= naviation ======= -->
<%@include file="/commons/nav.jspf" %>
 
 
<section id="hero" class="d-flex align-items-center">  
</section>


	<div class="container">
	<div class="row">
	<table class="table table-stripped">
		<thead>
			<tr>
				<th scope="col" class="text-center">번호</th>
				<th scope="col" class="text-center">제목</th>
				<th scope="col" class="text-center">글쓴이</th>
				<th scope="col" class="text-center">작성일</th>
				<!--조회수 <th scope="col" class="text-center">조회수</th> --> 
			</tr>
		</thead>
		<tbody>
			<%
				BbsDAO bbsDAO = new BbsDAO();
				ArrayList<Bbs>list = bbsDAO.getList(pageNumber);
				for(int i=0; i<list.size(); i++){
			%>
			<tr>
				<td><%=list.get(i).getBbsID()%></td>
				<td><a href="view.jsp?bbsID=<%=list.get(i).getBbsID() %>"><%=list.get(i).getBbsTitle()%></a></td>
				<td><%=list.get(i).getUserId() %></td>
				<td><%=list.get(i).getBbsDate().substring(2,16) %></td>
				<!--조회수 <td> </td>  -->
			</tr>
			<%
				} 
			%>
		</tbody>
	</table>
	
	<%
		if (pageNumber != 1) {
	%>
	<a href="bbs.jsp?pageNumber=<%=pageNumber - 1%>"class="btn btn-success btn-arrow-left">이전</a>
	<%
		}
		if (bbsDAO.nextPage(pageNumber+1)) {
	%>
	<a href="bbs.jsp?pageNumber=<%=pageNumber + 1%>"
		class="btn btn-success btn-arrow-left">다음</a>
	<%
		}
	%>

	
	<a href="/write.jsp" class="btn btn-primary pull-right">글작성</a>
	</div>
	</div>
	
	
	
	
	<%@include file="/commons/js.jspf" %>
	
	<%@include file="/commons/footer.jspf" %>

</body>
</html>