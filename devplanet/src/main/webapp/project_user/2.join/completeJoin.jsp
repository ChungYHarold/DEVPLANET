<%@page import="kr.co.sist.user.dao.UserDAO"%>
<%@page import="kr.co.sist.util.cipher.DataEncrypt"%>
<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
    
<title>회원가입 완료</title>
<link rel="SHORTCUT ICON" href="http://localhost/prj2/project_user/2.join/images/favicon.png">

<link href="./css/css/banner.promotion-sv-202211241151.css" rel="stylesheet" type="text/css">

<link href="./css/common-sv-202302221621.css" rel="stylesheet" type="text/css">
<link href="./css/header-sv-202005061649.css" rel="stylesheet" type="text/css">
<link href="./css/layout-sv-202005061649.css" rel="stylesheet" type="text/css">
<link href="./css/mtu_popup-sv-202212281122.css" rel="stylesheet" type="text/css">
<link href="./css/footer-sv-202301261521.css" rel="stylesheet" type="text/css">
    
<link rel="stylesheet" href="./css/footer_sub.css">
<link href="./css/complete-sv-202301041737.css" rel="stylesheet" type="text/css">
<link href="./css/tvc2022_4-sv-202212141417.css" rel="stylesheet" type="text/css">

<style type="text/css">
#btn:hover {
	cursor: pointer;
}
</style>

<!-- jQuery CDN 시작 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<!-- jQuery CDN 끝 -->

<script type="text/javascript">
$(function() {
	$("#btn").click(function() {
		location.href="login.jsp";
	});// click
});// ready
</script>

</head>

<body class="">

<jsp:useBean id="nVO" class="kr.co.sist.user.vo.NewVO"/>
<jsp:setProperty property="*" name="nVO"/><!-- 사용자가 쓴 정보들을 받아와서 set을 먼저 한다.. -->
<%
// 비밀번호 SHA형식의 단방향 암호화 수행
nVO.setPass(DataEncrypt.messageDigest("MD5", nVO.getPass())); // set을 했으니 get으로 일반 비번을 받고 일방향 암호화를 한 후 다시 set한다.
//그외의 정보 양방향 암호화 수행
//비번을 제외한 정보는 회원정보수정할때 다시 사용자에게 복호화 해서 보여줘야 함으로 양방향 암호화를 진행
//복호화를 해야하는 암호는 키를 이용하여 암호화를 진행한다. 이때 클래스는 DataEncrypt클래스를 이용한다.
DataEncrypt de=new DataEncrypt("FsRt4SfY4US0IWtK4JPJsw==");//내가 사용한 키 나중에 보내줌. 
nVO.setName(de.encryption(nVO.getName()));
nVO.setEmail(de.encryption(nVO.getEmail()));
nVO.setTel(de.encryption(nVO.getTel()));
nVO.setAddr(de.encryption(nVO.getAddr())); //여기까지 쭉 복호화 가능한 양방향 암호화 수행

UserDAO uDAO=new UserDAO();
try{
	
uDAO.insertNew(nVO);
}catch(SQLException se) {
	se.printStackTrace();
%>
<script type="text/javascript">
alert("서비스도중 문제가 발생하였습니다. 다시 시도해 주세요");
history.back();
</script>
<%
}//end catch

%>

<div class="resumePage resumePageComplete">
	<div class="resumeHeader">
		<div class="container">
			<a href="http://localhost/prj2/project_user/1.main/main_page.jsp" class="logo"><img alt="데브플래닛" src="http://localhost/prj2/project_user/2.join/images/devplanet_logo_small.png"></a>
			<div class="links">
				<a href="http://localhost/prj2/project_user/1.main/main_page.jsp" class="link linkHome">데브플래닛 홈</a> 
			</div>
		</div>
	</div>

	<div class="resumeWrapper">
		<div class="resumeContainer resumeContainerComplete">
			<h1 class="header">
				<img src="./images/join.PNG" alt="회원가입 완료">로그인 후 채용 공고 및 이력서 관리 서비스를 이용하실 수 있습니다.
			</h1>
			<input type="button" value="로그인 하기" id="btn" style="width: 200px; height: 50px; background-color: #3498db; color: white; border: none; font-size: 18px; font-weight: bold;" />
		</div>
	</div>
			
	<!-- footer 시작 -->
	<div id="footer" class="footer footer--main">
    	<div class="footer__wrap">
       		<h2 class="skip">잡코리아 기타 정보</h2>

         	<div class="footer__notice">
                <p class="copyright">
            		© <strong><a href="http://sist.co.kr/" target="_blank">DEVPLANET</a></strong> LLC. All rights reserved.
        		</p>
        	</div> 

         	<div class="footer__service">
            	<h3 class="blind">잡코리아 서비스 링크</h3>
            	<ul>
                	<li><a href="http://211.63.89.139/prj3/project_user/1.main/main_page.jsp" target="_blank">회사소개</a></li>
                	<li><a href="https://www.jobkorea.co.kr/service_jk/provision/provision_gg.asp" target="_blank">이용약관</a></li>
                	<li><a href="https://www.jobkorea.co.kr/service/PolicyPrivacy" target="_blank"><strong>개인정보처리방침</strong></a></li>
           		</ul>
       		</div>  
        </div>
    </div>
</div>
<!-- footer 끝 -->
		<div style="position: absolute; left: -5000px; overflow: hidden; display: none;">
		</div>
	</body>
</html>