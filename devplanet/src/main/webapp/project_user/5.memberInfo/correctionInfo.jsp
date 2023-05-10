<%@page import="java.text.SimpleDateFormat"%>
<%@page import="kr.co.sist.util.cipher.DataDecrypt"%>
<%@page import="kr.co.sist.user.vo.ModifiyInfoVO"%>
<%@page import="kr.co.sist.user.dao.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

    
  <!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<html lang="ko">
<head>


<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>회원정보 수정</title>


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
    
    <link
	href="//i.jobkorea.kr/content/css/ver_2/mtu/mtu_popup-sv-202212281122.css"
	rel="stylesheet" type="text/css" />
<link
	href="//i.jobkorea.kr/deploy/pc/dist/css/personal/layout/footer-sv-202301261521.css"
	rel="stylesheet" type="text/css" />

<link
	href="//i.jobkorea.kr/content/css/ver_2/text_user/resume/write-sv-202302231308.css"
	rel="stylesheet" type="text/css" />
<link
	href="//i.jobkorea.kr/content/css/ver_2/mtu/mtu_popup-sv-202212281122.css"
	rel="stylesheet" type="text/css" />
	
<style>
.mbrSec .mbrTplData2 table td .birth {
    padding: 7px 0 0 2px;
}
</style>




<!-- jQuery CDN -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<!-- jQuery CDN -->

<!-- 다음 우편번호 API시작 -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function findZip() {
        new daum.Postcode({
            oncomplete: function(data) {
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('zipcode').value = data.zonecode;
                document.getElementById("addr").value = roadAddr;
                document.getElementById("detailAddr").focus(); 
                
                
            }
        }).open();
    }
</script>
<!-- 다음 우편번호 API끝 -->

<%@ include file="checkLogin.jsp" %>

<%
if(session.getAttribute("sesVO") != null){ //세션이 만료된 상태에서 아래의 코드가 진행되면 오류페이지 뜸.... 막자...
	
LoginResultVO lrVO=(LoginResultVO)session.getAttribute("sesVO");
String user_id=lrVO.getUserId();

UserDAO uDAO=new UserDAO();
ModifiyInfoVO miVO=uDAO.selectUserInfo(user_id);

DataDecrypt dd=new DataDecrypt("FsRt4SfY4US0IWtK4JPJsw==");
miVO.setName(dd.decryption(miVO.getName()));
miVO.setEmail(dd.decryption(miVO.getEmail()));
miVO.setTel(dd.decryption(miVO.getTel()));
miVO.setAddr(dd.decryption(miVO.getAddr()));

String[] tel=miVO.getTel().split("-");
String[] email=miVO.getEmail().split("@");
String terms=miVO.getTerms();
String gender=miVO.getGender();

if(gender==null) {
	gender="";
}//end if

//Date형식을 String으로 바꿔서 출력
if(miVO.getBirthYear() != null){
SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
String birthDate=sdf.format(miVO.getBirthYear());
pageContext.setAttribute("birth_date", birthDate);
}//end if


pageContext.setAttribute("name", miVO.getName());
pageContext.setAttribute("email", email);
pageContext.setAttribute("terms", terms);
pageContext.setAttribute("tel", tel);
pageContext.setAttribute("gender", gender);
pageContext.setAttribute("zipcode", miVO.getZipcode());
pageContext.setAttribute("addr", miVO.getAddr());
pageContext.setAttribute("detail_addr", miVO.getDetailAddr());
pageContext.setAttribute("id", user_id);
}//end if
%>

<script type="text/javascript">

$(function(){
	
	
	$("#modifyBtn").click(function(){
		
		
		$("#frm").submit();
		
	});//click
	
	$("#kakao").click(function() {
		findZip();
	})//kakao
	
	$("#cancel").click(function() {
		location.href="http://localhost/prj2/project_user/1.main/main_page_loged.jsp";
	});//cancel
	
	
});//ready

/* input 날짜 형식 유효성 검증 (스킬, 어학, 자격증 2023/05/12)
	2023-04-18 추가 */
function formatDate(input) {
// 입력에서 숫자가 아닌 모든 문자 제거
var sanitized = input.value.replace(/[^0-9]/g, '');

// 입력이 6자보다 더 이상인지 점검하십시오.
if (sanitized.length > 6) {
// 적절한 위치에 대시 삽입
sanitized = sanitized.slice(0, 4) + '/' + sanitized.slice(4, 6) + '/' + sanitized.slice(6);
}

// 형식 지정된 날짜로 입력 값 업데이트
input.value = sanitized;
}// formatDate


// 이메일 선택 이벤트
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
			<span class="bar"><span class="title"><img src="http://localhost/prj2/project_user/images/h_mng_gg.gif" width="117" height="23" alt="회원정보 관리"></span></span>
			</h1>
<!--skip은 안보임  -->	<h2 class="skip"><!--주요링크--></h2>
			<!-- <br><br><br> -->
			<div class="secNav">
				<ol>
					<li class="mn1"><a href=""><span class="span"></span>개인정보 수정</a></li>
					<li class="mn2"><a href="http://localhost/prj2/project_user/5.memberInfo/confirmPass.jsp"><span></span>비밀번호변경</a></li>
					<li class="mn3 end"><a href="quit_member.jsp" ><span></span>회원탈퇴</a></li>
				</ol>
			</div>
	
		</div>
	</div>
</div>
<hr>

<div class="devGuideBox ly_popup_info" style="top: 22px; left: 912px; display: none;"></div>
<div id="wrap">

	<!--// Contents Area -->
	<div id="container">

		<div id="content">
<!--skip은 안보임  -->	<h1 class="skip"><!-- 회원정보 수정 --></h1>
			<form id="frm" name="frm" method="get" action="http://localhost/prj2/project_user/5.memberInfo/correctionInfo_process.jsp">
				<input type="hidden" name="M_Hand_Phone" id="M_Hand_Phone" value="">
				<input type="hidden" name="M_Home_Phone" id="M_Home_Phone" value="">
				<input type="hidden" name="R_No" id="R_No" value="">
				<input type="hidden" name="Alimy_Chk" id="Alimy_Chk" value="0">
				<input type="hidden" name="GoodJob_Mailing_Stat" id="GoodJob_Mailing_Stat" value="">
				<input type="hidden" name="OEM_No" id="OEM_No" value="">
				<input type="hidden" name="re_url" id="re_url" value="">
				<input type="hidden" name="checkDate" id="checkDate" value="201605">
				<fieldset>
				<legend><!-- 회원정보 수정 입력폼 --></legend>
				<div class="mbrSec mbrMngInfo">
					<h2 class="mbrHeading2"><img src="http://localhost/prj2/project_user/images/mbr_h_mng_gg.gif" alt="회원정보 수정"></h2>
					<div class="mbrTplDesc">
						<p>회원님의 정보를 수정·확인하실 수 있습니다.</p>
					</div>

					<div class="mbrTplData2">
						<table summary="이 표는 회원정보 수정 입력폼으로 아이디, 비밀번호, 비밀번호확인, 이름, 생년월일/성별, 연락처, 이메일을 나타내고 있습니다.">
	<!--skip은 안보임  -->	<caption><span class="skip"><!-- 회원정보 수정 입력폼 --></span></caption>
							<colgroup>
								<col width="110px">
								<col width="87px">
								<col width="*">
							</colgroup>
							<tr>
								<th scope="row" colspan="2"><label for="lb_id"><span class="blank"></span> 아이디</label></th>
								<td>
									<div class="social_row"><span id="userId" name="userId"><strong>${ id }</strong></span>
							
									</div>
								</td>
							</tr>

						
							<tr>
								<th scope="row" colspan="2"><span class="blank"></span> 이름 <img alt="필수입력사항" src="http://localhost/prj2/project_user/images/icon_b.gif"></th>
								<td colspan="3"><input type="hidden" class="txtForm" id="M_Name"  name="name" size="12" maxlength="15" value="${ name }"><span>${ name }</span>
								</td>
							</tr>
							<tr>
								<th scope="row" colspan="2"><span class="blank"></span> 생년월일/성별 <img alt="필수입력사항" src="http://localhost/prj2/project_user/images/icon_b.gif"></th>
								<td>
								<!-- <input type="text" name="birthYear" id="birthYear" maxlength="4" title="연" class="ipText ipTel ipNum devNoPh moveNext" onkeydown="handlerNum(this);" value="" style="ime-mode:disabled; float:left;" nextId="">
							 -->	
							 
							 		<%-- <select title="연" name="birth1" id="birth1" style="width:110px; float:left;" class="ipSelect">
												<option value="년도" selected>년도</option>
												<c:forEach var="year" begin="1980" end="2004" step="1">
												<option value="${ year }"><c:out value="${ year }"/></option>
												</c:forEach>
									</select>
											<span class="delimiter" style="padding: 6px 3px; float:left;"> &nbsp;</span>
									<select title="월" name="birth2" id="birth2" style="width:110px; float:left;" class="ipSelect">
												<option value="월" selected>월</option>
												<c:forEach var="month" begin="1" end="12" step="1">
												<option value="${ month }"><c:out value="${ month }"/></option>
												</c:forEach>
									</select>		
							 				<span class="delimiter" style="padding: 6px 3px; float:left;"> &nbsp;</span>
									<select title="일" name="birth3" id="birth3" style="width:110px; float:left;" class="ipSelect">
												<option value="일" selected>일</option>
												<c:forEach var="date" begin="1" end="31" step="1">
												<option value="${ date }"><c:out value="${ date }"/></option>
												</c:forEach>
									</select> --%>
								<div class="input input-certificate-term is-label is-value">
							    <label>생년월일</label> <input type="text" name="getDateL" id="getDate"
								maxlength="10" oninput="formatDate(this)" value="${ birth_date }" readonly="readonly">
						        </div>
						        
						        <div class="birth" id="gen">
											<input type="radio" id="M_Gender0" name="M_Gender" value="m" ${gender eq "m" ?"checked":""} >
											<label for="lb_man">남</label>
											<input type="radio" id="M_Gender1" name="M_Gender" value="f" ${gender eq "f" ?"checked":""} >
											<label for="lb_woman">여</label>
										</div>
							 
											<%-- <span class="delimiter" style="padding: 6px 3px; float:left;"> &nbsp;</span>
									<input type="radio" name="gender" value="m" ${gender eq "m" ?"checked":""} />남 					 	
									<input type="radio" name="gender" value="f" ${gender eq "f" ?"checked":""}/>여 --%>						 	
							 	</td>
							</tr>
						
							<tr>
								<th class="contectInfo" rowspan="2" style="border-right:1px solid #e5e5e5;"><span class="blank"></span> 연락처 <img alt="필수입력사항" src="http://localhost/prj2/project_user/images/icon_b.gif"></th>
								<th scope="row">휴대폰</th>
								<td>
									<div class="mbrHelpWrap">
										<div class="mobile">
											<label for="M_Hand_Phone1" class="blind">휴대폰</label>
											<input type="text" name="tel" id="tel1" maxlength="4" title="휴대폰 앞자리" class="ipText ipTel ipNum devNoPh moveNext" onkeydown="handlerNum(this);" value="${ tel[0] }" style="ime-mode:disabled; float:left;">
											<span class="delimiter" style="padding: 6px 3px; float:left;">-</span>
											<input type="text" name="tel" id="tel2" maxlength="4" title="휴대폰 앞자리" class="ipText ipTel ipNum devNoPh moveNext" onkeydown="handlerNum(this);" value="${ tel[1] }" style="ime-mode:disabled; float:left;"> <span class="delimiter" style="padding: 6px 3px; float:left;">-</span> <input type="text" name="tel" id="tel3" maxlength="4" title="휴대폰 뒷자리" class="ipText ipTel ipNum devNoPh moveNext" onkeydown="handlerNum(this);" value="${ tel[2] }" style="ime-mode:disabled; float:left;" nextId="M_Home_Phone1">
											<div style="left:403px; top:0px;display:none;" class="mbrTplLayer mbrTplLayer_1 mbrLayerHelp" id="CautionResult1" name="CautionResult">
												<div class="desc">
													<p>휴대폰 번호를 입력해 주세요</p>
												</div>
												<span class="arrow"></span>
											</div>
										</div>
									</div>
								</td>
							</tr>
							
							<tr>
								<th scope="row"><label for="Email_ID">이메일</label></th>
								<td>
									<div class="mbrHelpWrap">
										<input type="hidden" name="M_Email" id="M_Email" value="">
										<input type="text" name="email" id="email1" maxlength="30" style="width:150px;" class="ipText" value="${ email[0] }">
										<span class="delimiter">@</span>
										<input type="text" name="email" id="email2" title="이메일 서비스 입력" maxlength="25" class="ipText" style="width:150px" onkeyup="Email_Addr_Text_Move(); Gmail_Check();" value="${ email[1] }">
										<select title="이메일 사업자" name="Email_Addr" id="Email_Addr" onChange="mail_sum(); Gmail_Check();" class="ipSelect" onclick="selectEmail()">
											<option value="" selected>선택하세요</option>
											<option value="naver.com" >naver.com</option>
											<option value="hanmail.net" >hanmail.net</option>
											<option value="nate.com" >nate.com</option>
											<option value="daum.net" >daum.net</option>
											<option value="gmail.com" >gmail.com</option>
											<option value="dreamwiz.com" >dreamwiz.com</option>
											<option value="" >직접입력</option>
										</select>
										<div style="left:455px; display:none;" class="mbrTplLayer mbrTplLayer_1 mbrLayerHelp" id="CautionResult2" name="CautionResult">
											<div class="desc">
												<p>이메일을 입력해 주세요</p>
											</div>
											<span class="arrow"></span>
										</div>
									</div>
								</td>
							</tr>
							<tr>
								<th scope="row" colspan="2"><span class="blank"></span> <label for="postcheck">우편번호</label></th>
								<td colspan="3">
									<div class="mbrHelpWrap" style="z-index:1000;">
										<input type="hidden" id="M_ZipCode" name="M_ZipCode" value="">
										<input type="hidden" id="M_AddAddr" name="M_AddAddr" value="서울 동대문구 회기동">
                                        <input type="hidden" id="M_AddrType" name="M_AddrType" value="R">
                                        <input type="text" id="zipcode" name="zipcode" style="width:300px;" class="ipText" maxlength="8" value="${ zipcode }" readonly="readonly" >
										<span>

											<button id="kakao" type="button" ><img src="http://localhost/prj2/project_admin/images/btn_jk_add_search.gif" alt="주소 검색"/></button>
										</span>
										<div style="left:389px;display:none;" class="mbrTplLayer mbrTplLayer_1 mbrLayerHelp" id="CautionResult4" name="CautionResult">
											<div class="desc">
												<p>주소 검색을 위해 버튼을 클릭해 주세요.</p>
											</div>
											<span class="arrow"></span>
										</div>
										<div id="ZipSearch_Div" style="position:absolute; left:0; top:31px; z-index:99; display:none">
											<iframe id="ZipSearch_Ifrm" name="ZipSearch_Ifrm" width="440" height="182" marginwidth="0" marginheight="0" frameborder="no" scrolling="no" title="우편번호 검색" background="white"></iframe>
										</div>
									</div>
								</td>
							</tr>
							<tr>
								<th scope="row" colspan="2"><span class="blank"></span> <label for="M_Addr_Text">주소</label></th>
								<td colspan="3">
									<div class="mbrHelpWrap">
										<input type="text" id="addr" name="addr" style="width:300px;" class="ipText" maxlength="100" readonly value="${ addr }" onfocus="$(this).unbind('focus');" onclick="$('#btnSearchAddr').click();"> <input type="text" id="detailAddr" name="detailAddr" style="width:300px;" class="ipText" maxlength="35" onFocus="$(this).unbind('focus');if (this.value=='상세주소를 입력해 주세요.') this.value='';" value="${ detail_addr }">
										<div style="left:623px;display:none;" class="mbrTplLayer mbrTplLayer_1 mbrLayerHelp" id="CautionResult5" name="CautionResult">
											<div class="desc">
												<p>주소를 입력해 주세요.</p>
											</div>
											<span class="arrow"></span>
										</div>
									</div>
								</td>
							</tr>
							<tr>
                      <th scope="row" colspan="2">
                        <span class="blank"></span>개인정보 수집 및<br>
                        <span class="blank"></span>이용 동의 [선택]
                      </th>
                      <td>
                        <!-- 약관 Show & Hide -->
                        <div class="privacy-wrap">
                          <div class="privacy-title">
                            <label>
                              <input type="checkbox" id="PrivacyChoice_Agree" name="terms"  value="Y" ${ terms eq "Y"?"checked='checked'":"" }>
                              <span class="label-text">[선택] 개인정보 수집 및 이용 동의</span>
                            </label>
                            <a href="javascript:void(0);" class="policy-more-button">내용보기</a>
                          </div>
                          <div class="policy-box">
                            <div class="policy-box-content">
                              <ol>
                                <li>
                                  1. 수집 이용 목적
                                  <p>상품 &middot; 서비스 영업, 홍보, 마케팅, 쿠폰 발송을 목적으로 활용</p>
                                </li>
                                <li>
                                  2. 수집하는 개인정보 항목
                                  <p>전화번호, 이메일, 회원 가입시 수집한 항목, 서비스 이용 기록 등</p>
                                </li>
                                <li>
                                  3. 개인정보 보유 및 이용기간
                                  <p>회원탈퇴 시 즉시 파기</p>  
                                </li>
                                <li>
                                  4. 수신동의 거부 및 철회방법 안내
                                  <p>
                                    본 동의는 거부하실 수 있습니다. 다만 거부 시 동의를 통해 제공 가능한 각종 혜택, 이벤트 안내를 
                                    받아보실 수 없습니다. 더 이상 상품 &middot; 서비스 영업, 홍보, 마케팅, 쿠폰 발송을 원하시지 않는 경우 
                                    회원정보수정 페이지에서 수신여부를 변경하실 수 있습니다.
                                  </p>
                                </li>
                              </ol>
                            </div>
                          </div>
                        </div>
                        <!-- //약관 Show & Hide -->
                      </td>
                    </tr>
							
						</table>
					</div>
					
				<hr>
				<p class="mbrBtnFunc">
					<span class="mbrBtn mbrBtnModify_1"><a id="modifyBtn" name="modifyBtn" style="cursor:pointer;"><span>수정하기</span></a></span>
					<span class="mbrBtn mbrBtnCancel_1"><button type="button" id="cancel"><span>취소</span></button></span>
				</p>
				</div>
			</fieldset>
		</form>
		</div>
		
	</div>
	
</div>

<hr>

		


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