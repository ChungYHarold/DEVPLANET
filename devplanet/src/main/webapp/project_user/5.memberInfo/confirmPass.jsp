<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
    <!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<html lang="ko">
<head>


<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>비밀번호 변경</title>

  
  

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


<!-- jQuery CDN -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<!-- jQuery CDN -->

<%@ include file="checkLogin.jsp" %>

<script type="text/javascript">

$(function(){
	
	$("#modifyBtn").click(function(){
		if( $("#newPass").val() != $("#newPass2").val() ) {
			alert("새로운 비밀번호와 비밀번호 확인이 일치하지 않습니다.");
			return;
		}//end if
	
		$("#frm").submit();
	});//click
	
	$("#cancel").click(function() {
		location.href="http://localhost/prj2/project_user/1.main/main_page_loged.jsp";
	});//cancel
	
	
});//ready

</script>
 </head>
 
<body id="secMbr" class="mbrSubMng mbrSubMngGG mbrSubMngInfo">

<!-- <div id="skipNavigation">
	<p><a href="#container">메뉴 건너뛰기</a></p>
</div> 
<hr>  -->

<!--// Header Area -->


<!--// Header area(회원정보관리) -->
<div id="header">
	<div class="gnbWrap gnbWrap_mMng">

		<div id="gnb">
	
			<!--// 개인회원 -->
			<h1><a class="logo"href="http://localhost/prj2/project_user/1.main/main_page_loged.jsp"><img alt="데브플래닛" src="http://localhost/prj2/project_admin/images/devplanet_logo.png"></a>
			<span class="bar"><span class="title"><img src="http://localhost/prj2/project_admin/images/h_mng_gg.gif" width="117" height="23" alt="회원정보 관리"></span></span>
			</h1>
<!--skip은 안보임  -->	<h2 class="skip"><!--주요링크--></h2>
			<ul class="lnb">
				<li><a href="#void">개인회원 홈</a></li>
			</ul>
			<!-- <br><br><br> -->
			<div class="secNav">
				<ol>
					<li class="mn1"><a href="http://localhost/prj2/project_user/5.memberInfo/confrimInfo.jsp"><span></span>개인정보 수정</a></li>
					<li class="mn2"><a href="http://localhost/prj2/project_user/5.memberInfo/confirmPass.jsp"><span class="span"></span>비밀번호변경</a></li>
					<li class="mn3 end"><a href="http://localhost/prj2/project_user/5.memberInfo/quit_member.jsp" target="_blank"><span></span>회원탈퇴</a></li>
					
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
<!--skip은 안보임  -->	<h1 class="skip"><!-- 비밀번호 변경 --></h1>
			<form name="frm" id="frm" method="post" action="confirmPass_process.jsp">
			<input type="hidden" name="MemType" value="M">
			<input type="hidden" name="ChkInfo" value="1">
			<input type="hidden" name="M_ID" id="M_ID" value="kyum526">
			<input type="hidden" id="OEM_No" name="OEM_No" value="">
			<fieldset>
<!--skip은 안보임  -->	<legend><!-- 비밀번호 변경 정보 입력폼 --></legend>
				<div class="mbrSec mbrMngPWD">
					<h2 class="mbrHeading2"><img src="http://localhost/prj2/project_admin/images/mbr_h_mng_pwdchange.gif" alt="비밀번호 변경"></h2>
					<div class="mbrTplDesc">
						<p>비밀번호는 <strong>8~16자 영문, 숫자, 특수문자</strong>를 사용할 수 있습니다. </p>
						<p><em>비밀번호는 주기적(최소 6개월)으로 변경해 주시기 바랍니다.</em></p>
					</div> 

					<div class="mbrTplData2">
						<table summary="이 표는 비밀번호 변경 입력폼으로 현재 비밀번호, 새로운 비밀번호, 새로운 비밀번호 확인을 나타내고 있습니다.">
		<!--skip은 안보임  -->	<caption><span class="skip"><!-- 비밀번호 변경 입력폼 --></span></caption>
							<colgroup>
								<col width="18%">
								<col width="*">
							</colgroup>
							<tr>
								<th scope="row"><label for="M_PWD">현재 비밀번호</label></th>
								<td>
									<div class="mbrHelpWrap">		
										<input type="password" id="passNow" name="passNow" style="width:200px;" class="ipText" maxlength="20" onkeydown="blank_key_check()">
										<div style="left:215px;display:none;" class="mbrTplLayer mbrTplLayer_1 mbrLayerHelp" id="CautionResult1" name="CautionResult">
											<div class="desc">
												<p>현재 사용중인 비밀번호를 입력해 주세요.</p>
											</div>
											<span class="arrow"></span>
										</div>
									</div>
								</td>
							</tr>
							<tr>
								<th scope="row"><label for="M_PWD_New1">새로운 비밀번호</label></th>
								<td>
									<div class="mbrPwdHelpWrap">
									</div>
									<div class="mbrHelpWrap">
										<input type="password" id="newPass" name="newPass" style="width:200px;" class="ipText checkPwd" maxlength="16" onKeyUp="textlen('16','M_PWD_New1','y'); checkPwd('show', 'M_PWD_New1', 'idcheck', null, null, null);" onFocus="checkPwd('show', 'M_PWD_New1', 'idcheck', null, null, null);" onkeydown="blank_key_check()">
										<input type="hidden" name="idcheck" id="idcheck" value="kyum526" />
										<div id="PwdSafeResult"></div>
										<div id="PwdSafeForm4" style="display:none">
										</div>

										<div style="left:330px;display:none;" class="mbrTplLayer mbrTplLayer_1 mbrLayerHelp" id="CautionResult2" name="CautionResult">
											<div class="desc">
												<p>8~16자 영문, 숫자, 특수문자를 사용할 수 있습니다.</p>
											</div>
											<span class="arrow"></span>
										</div>
									</div>
								</td>
							</tr>
							<tr>
								<th scope="row"><label for="M_PWD_New2">새로운 비밀번호 확인</label></th>
								<td>
									<div class="mbrHelpWrap">		
										<input type="password" id="newPass2" name="newPass2" style="width:200px;" class="ipText" onKeyUp="textlen('16','M_PWD_New2','y')" onKeyPress="if(event.keyCode==13) Edit_Pwd();" onkeydown="blank_key_check()">
										<div style="left:215px;display:none;" class="mbrTplLayer mbrTplLayer_1 mbrLayerHelp" id="CautionResult3" name="CautionResult" >
											<div class="desc">
												<p>비밀번호 확인을 입력해 주세요.</p>
											</div>
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
					<span class="mbrBtn mbrBtnModify_1"><button type="button" id="modifyBtn"><span>수정하기</span></button></span>
					<span class="mbrBtn mbrBtnCancel_1"><button type="button" id="cancel"><span>취소</span></button></span>
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

<!-- LogAnalytics Script Install -->

</body>
</html>