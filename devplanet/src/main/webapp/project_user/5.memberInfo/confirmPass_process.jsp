<%@page import="java.sql.SQLException"%>
<%@page import="kr.co.sist.user.dao.UserDAO"%>
<%@page import="kr.co.sist.user.vo.LoginResultVO"%>
<%@page import="kr.co.sist.util.cipher.DataEncrypt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <jsp:useBean id="mpVO" class="kr.co.sist.user.vo.ModifiyPassVO"/>
<%
request.setCharacterEncoding("UTF-8");

UserDAO uDAO = new UserDAO();

String passNow = DataEncrypt.messageDigest("MD5", request.getParameter("passNow"));
String newPass = DataEncrypt.messageDigest("MD5", request.getParameter("newPass"));
LoginResultVO lrVO = (LoginResultVO)session.getAttribute("sesVO");

mpVO.setPass(passNow);
mpVO.setNewPass(newPass);
mpVO.setUserId(lrVO.getUserId());

try{
int result = uDAO.updateUserPass(mpVO);

if(result > 0) {
	%>
	<script>
	alert("비밀번호가 변경되었습니다.");
	location.href="http://localhost/prj2/project_user/1.main/main_page_loged.jsp";
	</script>
	<%
}else {
	%>
	<script>
	alert("현재 비밀번호를 잘못 입력하셨습니다.");
	history.back();
	</script>
	<%
	
}//end else


}catch(SQLException se) {
	se.printStackTrace();
}//end catch


%>