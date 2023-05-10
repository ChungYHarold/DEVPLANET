<%@page import="java.sql.SQLException"%>
<%@page import="kr.co.sist.user.dao.ResumeDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="이력서 현황판 삭제버튼"
    %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% 
	request.setCharacterEncoding("utf-8");
	
	ResumeDAO rDAO = new ResumeDAO();
	int rNum= Integer.parseInt(request.getParameter("rNum"));
	
	try{
		rDAO.deleteResume(rNum);
	}catch(SQLException se){
		se.printStackTrace();
	}//end catch
	
%>
<script>
	alert("삭제 되었습니다.")/* window.location.replace('http://localhost/prj2/project_user/4.resume/resume_present.jsp?rNum='); */
	window.location.href = "http://localhost/prj2/project_user/4.resume/resume_present.jsp";
</script>