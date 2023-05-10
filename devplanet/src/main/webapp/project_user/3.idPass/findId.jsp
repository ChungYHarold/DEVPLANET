<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html lang="ko">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>아이디 찾기</title>
<link rel="SHORTCUT ICON" href="http://localhost/prj2/project_user/3.idPass/images/favicon.png">

<link rel="stylesheet" type="text/css" href="http://localhost/prj2/project_user/3.idPass/css/common.css"/>
<link rel="stylesheet" type="text/css" href="http://localhost/prj2/project_user/3.idPass/css/footer_sub.css"/>
<link rel="stylesheet" type="text/css" href="http://localhost/prj2/project_user/3.idPass/css/gnb.css"/>
<link rel="stylesheet" type="text/css" href="http://localhost/prj2/project_user/3.idPass/css/gnb_sub.css"/>

<link rel="stylesheet" type="text/css" href="http://localhost/prj2/project_user/3.idPass/css/mbr_common.css"/>
<link rel="stylesheet" type="text/css" href="http://localhost/prj2/project_user/3.idPass/css/mbr_tpl.css">
<link rel="stylesheet" type="text/css" href="http://localhost/prj2/project_user/3.idPass/css/mbr_style.css">
<link rel="stylesheet" type="text/css" href="http://localhost/prj2/project_user/3.idPass/css/footer-sv-202301261521.css"/> <!-- (JK-9495) PC Main Footer 변경 (2021.02.18) -->

<style type="text/css">
	.mbrTplData1 li {clear:both; padding:5px 0 5px 24px; overflow:inherit;}
	.mbrTplData1 li:after { content:''; display:block; clear: both; }
	.mbrTplData1 li .tipHover { display:inline-block; position:relative; margin-left:5px; margin-top:-2px; vertical-align: middle;}
	.mbrTplData1 li .tipHover button {}
	.mbrTplData1 li .tipHover .tip { display:none; position:absolute; top:15px; left:0; width:208px; padding:15px 20px; border:1px solid #565d79; box-sizing:border-box; color:#666; font-weight:normal; line-height:1.5; background:#fff url('/img/member/popLoginClose.gif') no-repeat 190px 8px; }
	.mbrTplData1 li .tipHover .tip .tipClose { overflow:hidden; position:absolute; top:5px; right:5px; width:10px; height:9px; text-indent:-999px; background:url('/img/member/popLoginClose.gif') no-repeat }
</style>

<!-- jQuery CDN 시작 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<!-- jQuery CDN 끝 -->

<script type="text/javascript">
$(function() {	
	$("#findId").click(function() {
		$("#findIdFrm").submit();
	});// click
});// ready

//이메일 선택 이벤트
function selectEmail() {
    var emailInput = document.getElementById("email2");
    var emailSelect = document.getElementById("Email_Addr");
    
	
    emailSelect.addEventListener("change", function() {
    	  emailInput.value = emailSelect.value;
    	  if(emailSelect.selectedIndex == 7) {
    		  $("#email2").focus();
    	  }//end if
    });
}//selectEmail

</script>

</head>

<body id="secMbr" class="mbrSubCC mbrSubSchID">

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
			<h1 class="skip">아이디찾기</h1>
			<div class="mbrSec mbrSch mbrSchID">
				<h2 class="mbrHeading2"><img src="http://localhost/prj2/project_user/3.idPass/images/mbr_h_reg_gg.gif" alt="회원정보 입력"></h2>
				<div class="mbrTplDesc">
					<p>회원구분별로 가입 시 입력한 본인정보를 입력해 주세요.</p>
				</div>
				<form action="completeId.jsp" id="findIdFrm" name="findIdFrm" method="post">
				<input type="hidden" id="foreigner" name="foreigner" value="1">
				<input type="hidden" id="CHK_Name" name="CHK_Name">
				<input type="hidden" id="C_Ident" name="C_Ident">
				<input type="hidden" id="PhoneType" name="PhoneType" value="1">
				<input type="hidden" id="DB_Name" name="DB_Name" value="GG">
				<input type="hidden" id="OEM_No" name="OEM_No" value="1">
				<input type="hidden" id="nSite_Code" name="nSite_Code" value="JK">
				<input type="hidden" id="Certifytype" name="Certifytype" value="1">	
				<input type="hidden" name="CertifytySvc" id="CertifytySvc" value="2">
				<input type="hidden" id="IdentPass_Type" name="IdentPass_Type" value="5">		
				
				<!--// 이메일 인증 -->
				<div class="mbrCertifyData mbrCertifyDataGG">
				<fieldset>
				<legend>개인회원-이메일인증 입력폼</legend>	
					<div class="mbrTplBox">
						<h3><img src="http://localhost/prj2/project_user/3.idPass/images/mbr_h_sub_gg.gif" alt="개인회원"></h3>
						<ul class="mbrTplData1">
							<li>
								<div class="option">
									<input type="radio" id="lb_certifytype_email" name="lb_certifytype" value="1" checked style="display:none"><label for="lb_certifytype_email"  style="display:none">이메일 인증</label>
								</div>
							</li>
							<li id="devName"><label for="lb_name" class="title">이름</label> <input type="text" name="name" id="name"  maxlength="50" style="width:308px; ime-mode:active;" class="ipText"></li>
							<li id="devEmailForm">
								<label for="lb_email_head" class="title">이메일 주소</label>
								<input type="text" name="email" id="email1" maxlength="30" style="width:80px;" class="ipText"> 
								<span class="delimiter">@</span>
								<input type="text" name="email" id="email2" maxlength="20" style="width:80px;" class="ipText" title="e-메일 서비스 입력" > 
								<select title="e-메일 사업자" name="Email_Addr" id="Email_Addr" class="ipSelect ipSelect_1" onclick="selectEmail()">
									<option value="" selected>선택하세요</option>
									<option value="naver.com">naver.com</option>
									<option value="hanmail.net">hanmail.net</option>
									<option value="nate.com">nate.com</option>
									<option value="daum.net">daum.net</option>
									<option value="gmail.com">gmail.com</option>
									<option value="dreamwiz.com">dreamwiz.com</option>
									<option value="">직접입력</option>
								</select>
							</li>
						</ul>
					</div>
					</fieldset>
				</div>
				</form>
			</div>
			<p class="mbrBtnFunc"><span class="mbrBtn mbrBtnSearch_4">
				<button type="button" id="findId"><span>아이디찾기</span></button></span>
			</p>
			<hr>
			<hr>
		</div>
	</div>
	<hr>
</div>

<!-- footer 시작 -->
<div id="footer" class="footer footer--main">
    <div class="footer__wrap">
         <div class="footer__notice">
                <p class="copyright">
            © <strong><a href="http://sist.co.kr/" target="_blank">DEVPLANET</a></strong> LLC. All rights reserved.
        </p>
        </div> 
         <div class="footer__service">
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