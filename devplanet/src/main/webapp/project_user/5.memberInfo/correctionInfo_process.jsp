<%@page import="kr.co.sist.util.cipher.DataEncrypt"%>
<%@page import="java.sql.SQLException"%>
<%@page import="kr.co.sist.user.vo.LoginResultVO"%>
<%@page import="kr.co.sist.user.vo.ModifiyInfoVO"%>
<%@page import="java.sql.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="kr.co.sist.user.dao.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true"
    info="회원정보수정 update를 진행하자"
    %>

<%
UserDAO uDAO=new UserDAO();
ModifiyInfoVO miVO=new ModifiyInfoVO();
DataEncrypt de=new DataEncrypt("FsRt4SfY4US0IWtK4JPJsw==");

LoginResultVO lrVO=(LoginResultVO)session.getAttribute("sesVO");
String userId=lrVO.getUserId();

String[] emails=request.getParameterValues("email");
String[] tels=request.getParameterValues("tel");
String name=request.getParameter("name");
String gender=request.getParameter("gender");
int zipcode=Integer.parseInt(request.getParameter("zipcode")); 
String addr=request.getParameter("addr");
String detailAddr=request.getParameter("detailAddr");
String terms=request.getParameter("terms");
System.out.println("---------------------------------------------"+terms);
if(terms==null) {
	terms="N";
}//end if
String email="";
for(int i=0; i<emails.length; i++) {
	email+=emails[i];
	if(i < emails.length -1) {
		email+="@";
	}//end if
}//end for

String tel="";
for(int i=0; i<tels.length; i++) {
	tel+=tels[i];
	if(i < tels.length-1) {
		tel+="-";
	}//end if
}//end for



miVO.setEmail(de.encryption(email));
miVO.setTel(de.encryption(tel));
miVO.setName(de.encryption(name));
miVO.setGender(gender);
miVO.setZipcode(zipcode);
miVO.setAddr(de.encryption(addr));
miVO.setDetailAddr(detailAddr);
miVO.setTerms(terms);
miVO.setUserId(userId);

try{
int result = uDAO.updateUserInfo(miVO);
System.out.print(result);
if(result > 0) {
	%>
	<script>
	alert("회원정보가 수정되었습니다.");
	location.href="http://localhost/prj2/project_user/1.main/main_page_loged.jsp";
	</script>
	<%
}//end if
}catch(SQLException se) {
	se.printStackTrace();
}//end catch

%>
