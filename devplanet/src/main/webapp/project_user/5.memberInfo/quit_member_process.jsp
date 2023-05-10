<%@page import="kr.co.sist.util.cipher.DataEncrypt"%>
<%@page import="java.security.GeneralSecurityException"%>
<%@page import="java.security.NoSuchAlgorithmException"%>
<%@page import="java.io.UnsupportedEncodingException"%>
<%@page import="java.sql.SQLException"%>
<%@page import="kr.co.sist.user.dao.UserDAO"%>
<%@page import="kr.co.sist.user.vo.LoginResultVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="회원탈퇴"
    %>
<%
request.setCharacterEncoding("UTF-8");
String name=request.getParameter("quit");
LoginResultVO lrVO=null;

lrVO=(LoginResultVO)session.getAttribute("sesVO");

String userId=lrVO.getUserId();
String userName=lrVO.getName();

UserDAO uDAO=new UserDAO();
System.out.println(name);
System.out.println(userName);


int result=0;
try{
if(name.equals(userName)) {
result = uDAO.updateQuit(userId);
uDAO.deleteResume(userId);
}else {
	%>
	<script>
	alert("탈퇴신청자를 다시 확인 해 주세요.");
	history.back();
	</script>
	<%
}//end else
}catch(SQLException se) {
	se.printStackTrace();
}//catch

if(result>0) {
%>
<script>
alert("탈퇴되었습니다. 감사합니다.");
location.href="http://localhost/prj2/project_user/1.main/main_page.jsp";
</script>
<%
}//end if
%>