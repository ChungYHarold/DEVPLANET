<%@page import="java.sql.SQLException"%>
<%@page import="kr.co.sist.admin.dao.JobAdDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="check_login.jsp" %>



<%

//공고번호 받아서 int로 처리
String jobNumStr = request.getParameter("jobNum");
int jobNum = Integer.parseInt(jobNumStr);

JobAdDAO jDAO = new JobAdDAO();

try{
	
//공고 번호로 특정 공고를 삭제
int result = jDAO.deleteAd(jobNum);

//현재 sql익셉션 처리 안됨 - 테이블 alter 필요함



if(result>=1){ //1행 삭제에 성공한 것
	
%>
	<script>
		alert("삭제에 성공했습니다. 채용공고 현황으로 이동합니다.");
		location.href="http://localhost/prj2/project_admin/3.recruitAdmin/job_posting.jsp";
	</script>
	
<%} else{ %>

	<script>
		alert("삭제에 실패했습니다. 잠시 후 다시 시도해주세요.");
		location.href="http://localhost/prj2/project_admin/3.recruitAdmin/job_posting.jsp";
	</script>

<% 
	
}//end else

%>


<% }catch(SQLException se){
	se.printStackTrace();
	
}//end catch

%>





