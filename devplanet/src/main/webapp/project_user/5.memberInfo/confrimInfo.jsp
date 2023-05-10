<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

 
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html lang="ko">
<head>


<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>비밀번호 확인</title>


<!--////////////////////////////////css///////////////////////////////////////////////////////////////////////////  -->

		<link rel="stylesheet" type="text/css" href="http://localhost/prj2/css/common.css"/>
		<link rel="stylesheet" type="text/css" href="http://localhost/prj2/css/footer_sub.css"/>
		<link rel="stylesheet" type="text/css" href="http://localhost/prj2/css/gnb_sub.css"/>
		<link rel="stylesheet" type="text/css" href="http://localhost/prj2/css/gnb.css"/>
		<link rel="stylesheet" type="text/css" href="http://localhost/prj2/css/mbr_common.css"/>
		<link rel="stylesheet" type="text/css" href="http://localhost/prj2/css/mbr_style.css"/>
		<link rel="stylesheet" type="text/css" href="http://localhost/prj2/css/mbr_tpl.css"/>


	    
	    <link rel="stylesheet" type="text/css" href="//i.jobkorea.kr/content/css/ver_2/member/mbr_common.css?date=202103121100"/>
	    <link rel="stylesheet" type="text/css" href="//i.jobkorea.kr/content/css/ver_2/member/mbr_tpl.css?date=202103121100">
	    <link rel="stylesheet" type="text/css" href="//i.jobkorea.kr/content/css/ver_2/member/mbr_style.css?date=202103121100">
	 	<link rel="stylesheet" type="text/css" href="//i.jobkorea.kr/deploy/pc/dist/css/personal/layout/footer-sv-202301261521.css"/> 




<!--////////////////////////////////css///////////////////////////////////////////////////////////////////////////  -->


<!-- jQuery CDN -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<!-- jQuery CDN -->
<%@ include file="checkLogin.jsp" %>

<script type="text/javascript">
$(function() {
	
	$("#okBtn").click(function(){
		
		if($("#pass").val()=="") {
			alert("비밀번호를 입력해 주세요");
			return;
		}//end if
	
		$("#con_frm").submit();
		
	});//click
	
});//ready
</script>

</head>

<body id="secMbr" class="mbrSubMng mbrSubMngGG mbrSubMngPwdOk">

<!-- <div id="skipNavigation">
	<p><a href="#container">메뉴 건너뛰기</a></p>
</div>
<hr> -->



<!--/////////////////////////////////////////////////Header///////////////////////////////////////////////////////////// -->

<body id="secMbr" class="mbrSubMng mbrSubMngGG mbrSubMngPwdOk">
<!-- 
<div id="skipNavigation">
	<p><a href="#container">메뉴 건너뛰기</a></p>
</div> 
<hr> -->

<!--// Header Area -->


<!--// Header area(회원정보관리) -->
<div id="header">
	<div class="gnbWrap gnbWrap_mMng">

		<div id="gnb">
			<!--// 개인회원 -->
			<h1><a class="logo"href="http://localhost/prj2/project_user/1.main/main_page_loged.jsp"><img alt="데브플래닛" src="http://localhost/prj2/project_admin/images/devplanet_logo.png"></a>
			<span class="bar"><span class="title"><img src="http://localhost/prj2/project_user/images/h_mng_gg.gif" alt="회원정보 관리"></span></span>
			</h1>
<!--skip은 안보임  -->	<h2 class="skip"><!--주요링크--></h2>
			<!-- <br><br><br> -->
			<div class="secNav">
				<ol>
					<li class="mn1"><a href=""><span class="span"></span>개인정보 수정</a></li>
					<li class="mn2"><a href="http://localhost/prj2/project_user/5.memberInfo/confirmPass.jsp"><span></span>비밀번호변경</a></li>
					<li class="mn3 end"><a href="quit_member.jsp" ><span></span>회원탈퇴</a></li>
					<!-- <li class="mn4"><a href="/Text_User/User_Mailing_Mng.asp?OEM_No=1"><span></span>메일링/문자메시지 설정</a></li>
					<li class="mn3 end"><a href="/Customer_C/ETC/CC_leave.asp?Customer_C_Oem_No=1" target="_blank"><span></span>회원탈퇴</a></li> -->
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
			<form id="con_frm" name="con_frm" method="post" action="http://localhost/prj2/project_user/5.memberInfo/confirmInfo_process.jsp">
<!--skip은 안보임  -->	<h1 class="skip"><!--비밀번호 확인--></h1>
			<fieldset>
				<!-- <legend>비밀번호 확인 정보 입력폼</legend> -->
				<div class="mbrSec mbrMngPWD">
					<h2 class="mbrHeading2"><img src="http://localhost/prj2/project_user/images/mbr_h_mng_pwd.gif" alt="비밀번호 확인"></h2>
					<div class="mbrTplDesc">
						<p>회원님의 정보를 안전하게 보호하기 위해 비밀번호를 다시 한 번 입력해 주세요.</p>
					</div>

					<div class="mbrTplData2">
						<table summary="이 표는 비밀번호 확인 입력폼으로 아이디, 비밀번호를 나타내고 있습니다.">
<!--skip은 안보임  -->		<caption><span class="skip"><!-- 비밀번호 확인 입력폼 --></span></caption>
							<colgroup>
								<col width="18%">
								<col width="*">
							</colgroup>
							<tr>
								<th scope="row">아이디</th>
								<td>
									<strong><%= userId %></strong>
								</td>
							</tr>
							<tr>
								<th scope="row"><label for="lb_pw_1">비밀번호</label></th>
								<td>
									<div class="mbrHelpWrap">		
										<input type="password" id="pass" name="pass" style="width:200px;" class="ipText" maxlength="20" >
										<div style="left:215px;display:none;" class="mbrTplLayer mbrTplLayer_1 mbrLayerHelp" id="CautionResult1" name="CautionResult">
											<span class="arrow"></span>
										</div>
									</div>

								</td>
							</tr>
						</table>
					</div>
				</div>
				<hr>
				<p class="mbrBtnFunc">
					<span class="mbrBtn mbrBtnOk_3"><button type="button" id="okBtn" name="okBtn" ><span>확인</span></button></span>
					<span class="mbrBtn mbrBtnCancel_1"><button type="button" onclick="location.href='http://localhost/prj2/project_user/1.main/main_page_loged.jsp'"><span>취소</span></button></span>
				</p>
			</fieldset>
			</form>
		</div>
		<hr>
	</div>
</div>


<!--// Footer Area ///////////////////////////////////////////////////////////////////////////////////////////////////////////////-->
<!--// Footer Area -->
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

</body>
</html>