<%@page import="kr.co.sist.user.vo.LoginResultVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String userName="";
String userId="";
//System.out.println("1.==sesVO is ==============="+session.getAttribute("sesVO") );
if(session.getAttribute("sesVO")==null) {
	String msg="<script>alert('로그인 후 이용해 주세요');  location.href='http://localhost/prj2/project_user/2.join/login.jsp'</script>";
	out.print(msg);
}else {
	LoginResultVO lrVO=(LoginResultVO)session.getAttribute("sesVO");
	userName=lrVO.getName();
	userId=lrVO.getUserId();
}//end else
%>