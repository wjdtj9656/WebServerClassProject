<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="gq.giveaquiz.bbs.BbsDAO"%>

<%@ page import="java.io.PrintWriter"%>

<%
	request.setCharacterEncoding("UTF-8");
	response.setContentType("text/html; charset=UTF-8");
%>

<jsp:useBean id="bbs" class="gq.giveaquiz.bbs.Bbs" scope="page" />

<jsp:setProperty name="bbs" property="bbsTitle"/>
<jsp:setProperty name="bbs" property="bbsContent"/>

<%
	System.out.println(bbs);
%>

<!DOCTYPE html>
<html>
<head>
<%@include file="/commons/head.jspf" %>
</head>

<body>
<%
	String userId;
	if(session.getAttribute("userId")!=null){
		userId=(String)session.getAttribute("userId");
		BbsDAO BbsDAO = new BbsDAO();
		int result = BbsDAO.write(bbs.getBbsTitle(), userId, bbs.getBbsContent());
		if(result==-1){
			PrintWriter script = response.getWriter();
			script.println("<script> alert('글 작성 실패')");
			script.println("history.back()</script>");
		}
		else{
			PrintWriter script = response.getWriter();
			script.println("<script> location.href='/bbs.jsp'");
			script.println("</script>");
		}
	}
	else{
		PrintWriter script = response.getWriter();
		script.println("<script> alert('로그인을 해주십시오.')");
		script.println("location.herf='login.jsp'</script>");
	}
	
%>
</body>
</html>
