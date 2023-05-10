<%@page import="java.sql.SQLException"%>
<%@page import="kr.co.sist.user.dao.UserDAO"%>
<%@page import="kr.co.sist.util.cipher.DataEncrypt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <jsp:useBean id="rpVO" class="kr.co.sist.user.vo.ResetPassVO"/>
<%
request.setCharacterEncoding("UTF-8");

rpVO.setNewPass(request.getParameter("newPass"));
rpVO.setUserId(request.getParameter("userId"));

System.out.println(rpVO.getNewPass());

String newPass = DataEncrypt.messageDigest("MD5", rpVO.getNewPass());

rpVO.setNewPass(newPass);

UserDAO uDAO = new UserDAO();

try{
	
int result = uDAO.updatePass(rpVO);

}catch(SQLException se) {
	se.printStackTrace();
}//end catch


%>
<script type="text/javascript">
	alert("비밀번호 수정 완료");
	location.href="http://localhost/prj2/project_user/1.main/main_page.jsp";
</script>