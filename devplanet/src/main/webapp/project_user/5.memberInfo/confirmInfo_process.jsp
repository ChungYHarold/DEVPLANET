<%@page import="kr.co.sist.util.cipher.DataEncrypt"%>
<%@page import="kr.co.sist.user.vo.LoginVO"%>
<%@page import="kr.co.sist.user.dao.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8"); //post방식으로 넘어오기 때문에 처리

UserDAO uDAO=new UserDAO(); // selectConPass메소드를 사용하기 위한 UserDAO 객체화
LoginVO lVO=new LoginVO(); // selectConPass메소드의 매개변수를 위한 LoginVO객체화

String pass=request.getParameter("pass"); // 사용자가 입력한 원본의 비밀번호를 받아온다.
lVO.setPass(DataEncrypt.messageDigest("MD5", pass)); // DB의 비밀번호는 암호화이기 때문에 암호화 후 IVO에 넣어준다.

//System.out.println(lVO.getPass());

boolean flag=uDAO.selectConPass(lVO); // uDAO의 selectConPass의 반환값이 true면 회원정보 수정페이지로 넘어간다.
if(flag==true) {
	%>
	<script>
	location.href="correctionInfo.jsp";
	</script>
	<%
}else { // 반환된 값이 false면 비밀번호를 잘못 입력했다는 경고창을 띄우고 뒤로 간다.
	%>
	<script>
	alert("비밀번호가 일치하지 않습니다.");
	history.back();
	</script>
	<%
}//end else
%>