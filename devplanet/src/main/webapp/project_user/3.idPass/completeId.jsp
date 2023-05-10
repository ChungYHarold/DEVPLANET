<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html lang="ko">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>아이디 찾기 결과</title>
<link rel="SHORTCUT ICON" href="http://localhost/prj2/project_user/3.idPass/images/favicon.png">
    
<meta name="title" content="채용, 공채, 취업, 공고, 구인, 구직 정보는 잡코리아">
<meta name="description" content="신입공채, 경력채용, 채용정보, 공채정보, 정규직채용, 인턴 등의 구인공고와 채용정보가 제일 먼저 올라오는 곳, 잡코리아에 오세요. 입사 지원은 무료이며 지원팁, 합격자소서, 면접후기 등의 지원자를 위한 지원정보, 합격 꿀팁도 얻을 수 있습니다.">
<meta name="keywords" content="채용정보, 채용, 공채, 신입공채, 경력공채. 취업공고, 구인공고, 기업, 연봉, 보너스, 복지, 복리후생, 기업문화, 자격증, 국가유공자, 우대, 잡코리아">

<meta name="verify-v1" content="wfOOCE9Vtx+Z5etOXJnS9LU03yGpBxkK74T/yU63Xqs=">
<meta name="Robots" content="noindex,nofollow">

<link rel="stylesheet" type="text/css" href="http://localhost/prj2/project_user/3.idPass/css/common.css"/>
<link rel="stylesheet" type="text/css" href="http://localhost/prj2/project_user/3.idPass/css/footer_sub.css"/>
<link rel="stylesheet" type="text/css" href="http://localhost/prj2/project_user/3.idPass/css/gnb.css"/>
<link rel="stylesheet" type="text/css" href="http://localhost/prj2/project_user/3.idPass/css/gnb_sub.css"/>

<link rel="stylesheet" type="text/css" href="http://localhost/prj2/project_user/3.idPass/css/mbr_common.css"/>
<link rel="stylesheet" type="text/css" href="http://localhost/prj2/project_user/3.idPass/css/mbr_tpl.css">
<link rel="stylesheet" type="text/css" href="http://localhost/prj2/project_user/3.idPass/css/mbr_style.css">
<link rel="stylesheet" type="text/css" href="http://localhost/prj2/project_user/3.idPass/css/footer-sv-202301261521.css"/> <!-- (JK-9495) PC Main Footer 변경 (2021.02.18) -->

<%@ include file="findId_process.jsp" %>
</head>

<body id="secMbr" class="mbrSubCC mbrSubSchIDResult">

<div id="skipNavigation">
	<p><a href="#container">메뉴 건너뛰기</a></p>
</div>
<hr>

<!--// Header Area -->
<!--// Header area(아이디찾기, 비밀번호 찾기, 고객상담) -->
<div id="header">
	<div class="gnbWrap gnbWrap_mSearch">
		<div class="globalBar globalBarSub" id="globalBar">
			<div class="innerBar">
				<ul class="lnb">
					<li class="mn highlight"><a href="http://localhost/prj2/project_user/2.join/login.jsp">로그인</a></li>
					<li class="mn"><a href="http://localhost/prj2/project_user/2.join/join.jsp">회원가입</a></li>
				</ul>
			</div>
		</div>
		<div id="gnb">
			<h1><a class="logo" href="http://localhost/prj2/project_user/1.main/main_page.jsp"><img alt="데브플래닛" src="http://localhost/prj2/project_user/3.idPass/images/devplanet_logo_id_white.png"></a>
			<span class="bar">
				<span class="title">
					<img src="http://localhost/prj2/project_user/3.idPass/images/h_cc_schid.gif" alt="아이디 찾기">
				</span>
			</span>
			</h1>
			<div class="secNav">
				<ol>
					<li class="mn1"><a href="http://localhost/prj2/project_user/3.idPass/findId.jsp"><span></span>아이디 찾기</a></li>
					<li class="mn2"><a href="http://localhost/prj2/project_user/3.idPass/findPw.jsp"><span></span>비밀번호 찾기</a></li>
				</ol>
			</div>
		</div>
	</div>
</div>
<hr>
	

<div id="wrap">
	<!--// Contents Area -->
	<div id="container">
		<div id="content">
			<h1 class="skip">아이디 찾기</h1>
			<div class="mbrSec mbrSchIDResult">
				<h2 class="mbrHeading2"><img src="http://localhost/prj2/project_user/3.idPass/images/mbr_h_msch_id_2.gif" alt="아이디조회"></h2>
				<div class="mbrTplDesc">
					<p>개인정보보호를 위해 일부분은 *로 표시됩니다.</p>
					<p>동명이인이 있는 경우, 본인 외의 ID가 노출될 수 있습니다.</p>
				</div>

				<div class="mbrTplBox">
					<h3 class="skip">보유 아이디 목록</h3>
					<p class="info"><strong>입력된 정보로 등록된 아이디는 총<em>1개</em> 있습니다.</strong></p>
					<div class="mbrTplBoxList">
						<ul>
							<li><span id="id">${ id }</span>  (가입일: <span id="reg_date">${ reg_date }</span>)</li> 
						</ul>
					</div>
				</div>
				<p class="mbrBtnFunc"><span class="mbrBtn mbrBtnLogin_1"><a href="http://localhost/prj2/project_user/2.join/login.jsp">로그인</a></span> <span class="mbrBtn mbrBtnSearch_2"><a href="http://localhost/prj2/project_user/3.idPass/findPw.jsp">비밀번호 찾기</a></span></p>
			</div>
			<hr>
		</div>
		<hr>
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
<!-- footer 끝 -->
		
	<div style="position:absolute; left:-5000px; overflow:hidden;">
</div>
</body>
</html>