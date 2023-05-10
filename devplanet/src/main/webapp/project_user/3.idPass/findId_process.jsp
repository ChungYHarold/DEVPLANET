<%@page import="kr.co.sist.util.cipher.DataEncrypt"%>
<%@page import="java.sql.SQLException"%>
<%@page import="kr.co.sist.user.vo.ResultIdVO"%>
<%@page import="kr.co.sist.user.dao.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
    <jsp:useBean id="fiVO" class="kr.co.sist.user.vo.FindIdVO"/>
    <jsp:setProperty property="*" name="fiVO"/>
<%

UserDAO uDAO=new UserDAO();
DataEncrypt de=new DataEncrypt("FsRt4SfY4US0IWtK4JPJsw==");
ResultIdVO rVO=null;

String[] emails=request.getParameterValues("email");
String email="";
for(int i=0; i < emails.length; i++) {
	email+=emails[i];
	if(i < emails.length -1) {
		email+="@";
	}//end if
}//end for
fiVO.setEmail(email);

fiVO.setName(de.encryption(fiVO.getName()));
fiVO.setEmail(de.encryption(fiVO.getEmail()));

try{
	
rVO = uDAO.selectFindId(fiVO);

String id=rVO.getUserId();

if(id.length() >= 3) {
    id = id.substring(0, 2) + "**" + id.substring(4);
}//end if

pageContext.setAttribute("id",id );
pageContext.setAttribute("reg_date", rVO.getRegDate());

}catch(NullPointerException ne) { 
	%>
	<script>
	alert("아이디와 이메일을 다시 확인해 주세요.");
	history.back();
	</script>
	<%
}catch(SQLException se) {
	se.printStackTrace();
}//end catch


%>