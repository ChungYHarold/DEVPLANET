<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<html lang="ko">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>비밀번호 재설정</title>
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

<!-- jQuery CDN 시작 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<!-- jQuery CDN 끝 -->

<%@ include file="findPw_process.jsp" %>
<script type="text/javascript">
$(function() {
	$("#btnCheck").click(function() {
		
	if( $("#newPass").val() != $("#pass2").val() ) {
		alert("비밀번호와 비밀번호 확인이 일치하지 않습니다.");
		return;
	}//end if
	
		$("#compPwFrm").submit();
	});//click
	
	
});//ready
</script>

</head>

<body id="secMbr" class="mbrSubCC mbrSubSchPwdChange">

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
					<img src="http://localhost/prj2/project_user/3.idPass/images/h_cc_schpwd.gif" alt="비밀번호 찾기">
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
			<h1 class="skip">비밀번호 재설정</h1>
		<form action="http://localhost/prj2/project_user/3.idPass/compPw_process.jsp" name="compPwFrm" id="compPwFrm" method="post">
		<input type="hidden" name="SearchKey" value="6717511">
		<input type="hidden" name="U_ID" value="4e771ec3bdfa32e0caef1ceecdaf7d2112edc03e77b0f5b5adcede7d7bb70c63ebb892b6f7d47af8843e6d64194f7093">
		<input type="hidden" name="U_Type" value="M">
		<input type="hidden" name="Certifytype" id="Certifytype" value="2">
		<input type="hidden" name="getCertifynum" id="getCertifynum">
		<input type="hidden" name="OEM_No" id="OEM_No" value="1">
		<input type="hidden" name="idcheck" id="idcheck" value="nisismo">		
		<input type="hidden" name="userId" value="${ userId }"/>
		
			<div class="mbrSec mbrCCSch mbrCCSchPwdChange">
				<h2 class="mbrHeading2"><img src="http://localhost/prj2/project_user/3.idPass/images/mbr_h_mng_pwd_change.gif" alt="비밀번호 재설정"></h2>
				<div class="mbrTplDesc">
					<p><em class="emp_1">새로운 비밀번호</em>를 입력해 주세요.</p>
				</div>
				<fieldset>
				<legend>비밀번호 재설정 입력폼</legend>	
					<div class="mbrTplData2">
						<table summary="이 표는 비밀번호 확인 입력폼으로 현재 비밀번호, 새로운 비밀번호, 새로운 비밀번호 확인을 나타내고 있습니다.">
							<caption><span class="skip">비밀번호 재설정 입력폼</span></caption>
							<colgroup>
								<col width="18%">
								<col width="*">
							</colgroup>
							<tr>
								<th scope="row"><label for="U_PWD1">새로운 비밀번호</label></th>
								<td>
									<div class="mbrHelpWrap" style="z-index:1000;">
										<input type="password" id="newPass" name="newPass" style="width:200px;" class="ipText" maxlength="17" >
										<div style="left:324px;display:none;" class="mbrTplLayer mbrTplLayer_1 mbrLayerHelp" id="CautionResult2" >
										</div>

									</div>
								</td>
							</tr>
							<tr>
								<th scope="row"><label for="U_PWD2">새로운 비밀번호 확인</label></th>
								<td>
									<div class="mbrHelpWrap">
										<input type="password" id="pass2" name="pass2" style="width:200px;" class="ipText"  maxlength="17" id="M_PWD2" maxlength="16" >
										<div style="left:215px;display:none;" class="mbrTplLayer mbrTplLayer_1 mbrLayerHelp" id="CautionResult3" name="CautionResult">
										</div>
									</div>
								</td>
							</tr>
						</table>
					</div>
				</fieldset>
			</div>
			<p class="mbrBtnFunc">
				<span class="mbrBtn mbrBtnOk_3">
					<button type="button" id="btnCheck"><span>확인</span></button>
				</span>
			</p>
		</form>	
			<hr>
			
			<hr>
	
		</div>
	</div>
	<hr>
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