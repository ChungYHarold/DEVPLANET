<%@page import="java.sql.SQLIntegrityConstraintViolationException"%>
<%@page import="java.sql.SQLException"%>
<%@page import="kr.co.sist.user.dao.ApplyResumeDAO"%>
<%@page import="kr.co.sist.user.vo.LoginResultVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="aiVO" class="kr.co.sist.user.vo.ApplyInfoVO"/>
<%
LoginResultVO lrVO= (LoginResultVO)session.getAttribute("sesVO");

String userId=lrVO.getUserId();
int rNum=Integer.parseInt(request.getParameter("rNum"));
int jobNum=Integer.parseInt(request.getParameter("jobNum"));

aiVO.setUserId(userId);
aiVO.setrNum(rNum);
aiVO.setJobNum(jobNum);

ApplyResumeDAO arDAO=new ApplyResumeDAO();
String resultFlag="";
try{
	
	resultFlag=arDAO.selectCancel(userId, jobNum);
	if(resultFlag.equals("C")) {
		int r= arDAO.deleteApply(userId, jobNum);
		
	}//end if
			
	
arDAO.insertApply(aiVO);
	
}catch(SQLIntegrityConstraintViolationException scve){
	%>
	<script>
	alert("이미 지원한 공고입니다.");
	self.close();
	</script>
	<%
}catch(SQLException se) {
	se.printStackTrace();
}//end catch

%>
<script>
alert("해당 공고에 지원되었습니다.");
self.close();
</script>