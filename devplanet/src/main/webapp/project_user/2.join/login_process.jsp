<%@page import="java.sql.SQLException"%>
<%@page import="kr.co.sist.user.vo.LoginResultVO"%>
<%@page import="kr.co.sist.user.dao.UserDAO"%>
<%@page import="kr.co.sist.util.cipher.DataDecrypt"%>
<%@page import="kr.co.sist.util.cipher.DataEncrypt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="lVO" class="kr.co.sist.user.vo.LoginVO"/>
<jsp:setProperty property="*" name="lVO"/> <!-- ★여여기서 사용자가 적은 모든 값을 set했기 때문에 -->
<%
//비밀번호 일방향 해시로 암호화
//쌤이 만든 클래스를 이용하여 사용자가 입력한 비밀번호를 일방향 암호화를 한 후 VO에 넣는다.
lVO.setPass(DataEncrypt.messageDigest("MD5", lVO.getPass())); //★여기서 get으로 꺼내온 후 다시 MD5로 암호화 해서 set으로 다시 집어 넣는다.

UserDAO uDAO=new UserDAO(); // 로그인 기능이 있는 메소드를 가진 클래스를 객체화 한다.
LoginResultVO lrVO=null; // 로그인기능을 가진 메소드(selectLogin)의 반환형이 VO이기 때문에 반환값을 담을 VO를 만들어 준다.
try{// 로그인 기능을 가진 메소드(selectLogin)을 실행하면 SQLException이 발생하기 때문에 try-catch로 잡아준다.
	
lrVO=uDAO.selectLogin(lVO); 
}catch(SQLException se) {
	se.printStackTrace();
}//end catch

if(lrVO == null) { // lrVO는 selectLogin의 반환값을 받을 VO인데 null이라면, 아무것도 받지 못했다는 것이고 그렇다면 selectLogin에서 문제가 발생한 것 대표적으로 비번이 틀렸다.
	%>
	<script>
	location.href="http://localhost/prj2/project_user/2.join/login_fail.jsp"; /* 비번이 틀렸으니까 로그인 창으로 다시 보내줘 */
	</script>
	<%
}else { //else면 lrVO가 null이 아니라는 것 => selectLogin메소드를 실행하고 값이 나와서 VO에 저장됐다는 말.
	// 반환된 이름을 복호화 //저장 됐으면 lrVO(LoginResultVO)의 변수중 하나인 이름과, 사용자의 아이디를 세션에 저장한다.
	DataDecrypt dd=new DataDecrypt("FsRt4SfY4US0IWtK4JPJsw=="); //근데 이름은 암호화 되어있는 정보라 복호화가 필수 !
	lrVO.setName(dd.decryption(lrVO.getName())); //복호화의 기능을 가진 DataDecrypt클래스의 decryption메소드를 이용하여 암호화 되어있는 이름을 복호화 하여 lrVO에 다시 set한다.
	
	//아이디와 복호화된 이름을 session에 저장한다.
	session.setAttribute("sesVO", lrVO);         // 얘의 데이터형이 object이야 가장 상위 부모의 데이터형 거의  
	%>
	<script>
	location.href="http://localhost/prj2/project_user/1.main/main_page_loged.jsp";
	</script>
	<%
}//end else
%>