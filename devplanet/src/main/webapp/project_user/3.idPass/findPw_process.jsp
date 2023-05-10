<%@page import="java.sql.SQLException"%>
<%@page import="kr.co.sist.user.dao.UserDAO"%>
<%@page import="kr.co.sist.util.cipher.DataEncrypt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="fpVO" class="kr.co.sist.user.vo.FindPassVO"/>
<%
request.setCharacterEncoding("UTF-8");

if(!request.getMethod().equals("POST")) {
	String msg1 = "<script>alert('정상적인 접근방식이 아닙니다. 메인페이지로 이동합니다.');</script>";
	String msg2 = "<script>location.href='http://localhost/prj2/project_user/1.main/main_page.jsp';</script>";
	out.print(msg1);
	out.print(msg2);
	return;
}//end if

String name=request.getParameter("name");
String email=request.getParameter("email");
email+="@"+request.getParameter("email2");
String userId=request.getParameter("userId");


DataEncrypt de=new DataEncrypt("FsRt4SfY4US0IWtK4JPJsw==");

fpVO.setName(de.encryption(name));
fpVO.setEmail(de.encryption(email));
fpVO.setUserId(userId);

pageContext.setAttribute("userId", userId);


UserDAO uDAO=new UserDAO();
boolean resultFlag=false;
try{
	resultFlag=uDAO.selectFindPass(fpVO);
	
	if(resultFlag==false) {
		%>
		<script>
		alert("입력사항을 다시 확인해 주세요.");
		history.back();
		</script>
		<%
	}//end if
	
}catch(SQLException se) {
	se.printStackTrace();
}//end catch

%>