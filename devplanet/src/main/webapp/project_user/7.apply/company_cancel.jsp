<%@page import="java.sql.SQLException"%>
<%@page import="kr.co.sist.user.dao.ApplyResumeDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="여러 노드의 파싱"
    %>
<%

String userId=request.getParameter("userId");
int jobNum=Integer.parseInt(request.getParameter("jobNum"));

ApplyResumeDAO arDAO=new ApplyResumeDAO();

int result=0;
String cState="";


try{
	cState=arDAO.selectCancel(userId, jobNum);
	if(cState.equals("NC")) {
	result=arDAO.updateCancel(userId, jobNum);
		if(result > 0) {
		
		String msg="<script>alert('지원이 취소되었습니다.'); history.back();</script>";
		out.print(msg);
		}//end if
	}else {
		String msg="<script>alert('현재 지원상태가 아닙니다.'); history.back();</script>";
		out.print(msg);
	}//end else
		
	
	
}catch(NullPointerException ne){
	String msg="<script>alert('해당 기능은 로그인이 필수입니다.'); history.back();</script>";
	out.print(msg);
}catch(SQLException se) {
	se.printStackTrace();
}//end catch

%>