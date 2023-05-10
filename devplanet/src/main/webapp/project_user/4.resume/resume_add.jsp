<%@page import="kr.co.sist.user.dao.JobDAO"%>
<%@page import="kr.co.sist.user.vo.LoginResultVO"%>
<%@page import="kr.co.sist.util.cipher.DataEncrypt"%>
<%@page import="kr.co.sist.util.cipher.DataDecrypt"%>
<%@page import="java.sql.SQLException"%>
<%@page import="kr.co.sist.user.vo.UserDataVO"%>
<%@page import="kr.co.sist.user.dao.ResumeDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	


<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">

<title>이력서 작성</title>
<!-- session 시작 -->
<%
JobDAO jDAO=new JobDAO();

String userId="";
// 페이지가 응답되면 가장먼저 세션의 값을 가져온다.
if(session.getAttribute("sesVO")==null) { // 정상적인 접근이라면 세션에 저장된 VO가 있을텐데 만약 세션의 값이 없다면(=null이라면) 로그인 창으로 보낸다.
	%>
	<script type="text/javascript">
	alert("로그인 후 이용해 주세요.");
	location.href="http://localhost/prj2/project_user/2.join/login.jsp";
	</script>  
	<%														
} else { // 세션의 값을 불렀는데 null이 아니다 (= 세션에 값이 있다 ) => 세션에 저장할 때는 로그인 할 때 밖에 없으니까 세션에 값이 있다는 것 자체가 정상적인 접근이다.
	LoginResultVO lrVO=(LoginResultVO)session.getAttribute("sesVO");  //세션의 값을 lrVO에 담아준다.
	userId=lrVO.getUserId(); //lrVO안의 이름을 꺼내서 보여준다. 
}//end else
%>
<!-- session 끝 -->

<!-- jQuery CDN 시작 -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<!-- jQuery CDN 끝 -->


<!-- 다음 우편번호 API시작 -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js">
</script>
<script>
    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
    function findZip() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
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
                document.getElementById("addr").value = roadAddr;

            }
        }).open();
    }
/* 우편번호 */
$(function() {
	document.getElementById("kakao").addEventListener("click",findZip);
});
</script>
<!-- 다음 우편번호 API끝 -->

<script type="text/javascript">

/* 추가 자격증 */
$(function(){ 
	$("#addCertificate").click(function(){
		var newDiv = $('<div name="row" class="row"><div class="input input-certificate-name is-label is-value"><label>자격증명 <span class="star">*</span></label><input type="text" name="nameC" id="nameC" value=""></div> <div class="input input-certificate-agency is-label is-value"><label>발행처/기관 <span class="star">*</span></label> <input id="issuer" name="issuer" placeholder="" type="text" value=""></div> <div class="input input-certificate-term is-label is-value"><label>취득일</label> <input type="text" name="getDateC" id="getDateC" maxlength="10" oninput="formatDate(this)" value=""></div> <button type="button" style="height: 30px; width: 60px; border: 1px solid #999999; margin-top: 20px; margin-bottom: 20px;" class="minusCertificate"> <span style="">삭제</span> </button></div>');
	    
		$('#add').append(newDiv);

			newDiv.find('.minusCertificate').click(function(){
			newDiv.remove();
		});
	});//click
});//ready
	
/* 추가 스킬 */	
$(function(){
	$("#addSkill").click(function(){
		var newDiv = $('<div class="row"><div id="skill"><div class="input input-certificate-name is-label is-value" style="width:300px;"><label>스킬명 <span class="star">*</span></label><input type="text" name="nameS" id="nameS" value=""></div><button type="button" style="height: 30px; width: 60px; border: 1px solid #999999; margin-top: 20px; margin-bottom: 20px;" class="minusSkill"><span style="">삭제</span></button></div></div>');
				    
		$('#skill').append(newDiv);

			newDiv.find('.minusSkill').click(function(){
			newDiv.remove();
			});
	});//click
});//ready

/* 추가 어학 */
$(function(){ 
	$("#addLang").click(function(){
		var newDiv = $('<div class="row"><div class="input input-certificate-name is-label is-value"><label>외국어명 <span class="star">*</span></label><input type="text" name="nameL" id="nameL" value="" ></div><div class="input input-certificate-name is-label is-value"><label>시험명 <span class="star">*</span></label><input type="text" name="testName" id="testName" value="" ></div><div class="input input-certificate-agency is-label is-value"><label>점수 <span class="star">*</span></label><input  id="score" name="score" type="text" value=""></div><div class="input input-certificate-term is-label is-value"><label>취득일</label><input type="text" name="getDateL" id="getDateL" maxlength="10" oninput="formatDate(this)" value=""></div><button type="button"style="height: 30px; width: 60px; border: 1px solid #999999; margin-top: 20px; margin-bottom: 20px;"class="minusLang"><span style="">삭제</span></button></div>');
		$('#lang').append(newDiv);   
		
		newDiv.find('.minusLang').click(function(){
			newDiv.remove();
		});
	});//click
});//ready

/* 추가 학력 */
$(function(){ 
	$("#addEducation").click(function(){
		var newDiv = $('<div id="edu" style="height:160px;"><div class="dropdown dropdown-profile-sex is-label selected"><div class="label " aria-hidden="true">학교구분 <span class="star">*</span></div><div class="lyTplArea"><select title="자격증/어학" name="schoolType" id="schoolType"class="ipSelect ipSelect_1" onchange="chkSch();"style="height: 60px; width: 110px; border-color: #DDDDDD;"><option value=""></option><option value="대학(2,3년)">대학(2,3년)</option><option value="대학교(4년)">대학교(4년)</option><option value="대학원(석사)">대학원(석사)</option><option value="대학원(박사)">대학원(박사)</option></select></div></div><div class="input input-education-name is-label is-ellipsis  is-value" id=""><label for="UnivSchool_Schl_Name_c4">학교명 <span class="star">*</span></label> <input type="text" id="schoolName"name="schoolName" value="" autocomplete="off" maxlength="50"></div><div class="input input-certificate-agency is-label is-value"><label>재학기간 <span class="star">*</span></label> <input type="text" name="period" id="period" value="" maxlength="15" oninput="formatDateEdu(this)"></div><div class="input input-education-enddate is-label is-value" id="gpaDiv"><label>학점 <span class="star">*</span></label> <input type="text" name="gpa" id="gpa" value="" maxlength="4" placeholder=""></div><div class="row" id="majorDiv" style="width:455px;"><div class="input input-education-major-name search is-label is-value"><label>전공명</label> <input type="text" id="major" name="major" value="" autocomplete="off" maxlength="50"></div></div><button type="button"style="height: 30px; width: 60px; border: 1px solid #999999; margin-top: 20px; margin-bottom: 20px;"class="minusEdu"><span style="">삭제</span></button></div>');
		$('#edu').append(newDiv);   
		
		newDiv.find('.minusEdu').click(function(){
			newDiv.remove();
		});
	});//click
});//ready
		
/* 이미지 변경 클릭 버튼 */
 // 2023-04-23 최종 확인
$(function() {
	$("#imageFileInput1").on("click", function() {
	  $("#imageFileInput").click();
	});//click
});//ready


/* 이력서 저장 버튼 유효성검사 */
 // 2023-04-23 최종 확인
 $(function(){
	$("#resumeSave").click(function(){
		
		//제목
		if($("#title").val() == ""){
			alert("제목을 입력해 주세요.");
			$("#title").focus();
			return;
		}else if(($("#title").val().trim()=="")){
			alert("공백만은 불가합니다.");	
			$("#title").val(""); // 요소의 값을 비워줌
			$("#title").focus();
			return;
		}//end if
		
		//생년월일
		if($("#birthDate").val() == ""){
			alert("생일을 입력해 주세요.");
			$("#birthDate").focus();
			return;
		}

		//성별
		if($("select[name=gender]").val() == ""){
			alert("성별을 선택해 주세요.");
			$("#gender").focus();
			return;
		}
		
		//경력
		if($("#career").val() == ""){
			alert("경력을 선택해 주세요.");
			$("#career").focus();
			return;
		}

		//희망직무
		if($("#job").val() == ""){
			alert("희망 직무를 입력해 주세요.");
			$("#job").focus();
			return;
		}
		
		//희망연봉
		if($("#sal").val() == ""){
			alert("희망연봉을 입력해 주세요.");
			$("#sal").focus();
			return;
		}
		
		//고용형태
		if($("#empform").val() == ""){
			alert("고용 형태를 선택해 주세요.");
			$("#career").focus();
			return;
		}
		
		//희망근무지
		if($("#area").val() == ""){
			alert("희망 근무지를 선택해 주세요.");
			$("#career").focus();
			return;
		}
		
		 //학력
		if($("#schoolName").val() == ""){
			alert("학교이름을 입력해주세요.");
			$("#schoolName").focus();
			return;
		}
		
		
		//재학기간
		if($("input[name=period]").val() == ""){
			alert("재학기간을 입력해주세요.");
			$("#period").focus();
			return;
		} 
		
		
		//전공명
		if($("#major").val() == ""){
			alert("전공명을 입력해주세요.");
			$("#major").focus();
			return;
		}
		
		//학점
		if($("#gpa").val() == ""){
			alert("학점을 입력해주세요.");
			$("#gpa").focus();
			return;
		}
		
		
		if(!confirm("이력서를 등록하시겠습니까?")) {
			/* location.href="http://localhost/prj2/project_user/4.resume/2.resume_complete.jsp"  */
			/* $("#title").focus(); */
		} else {
			$(function(){
				$("#userFrm").submit();
			});//ready 
			
		}//end if
	});//click
});//ready


 
 /* text 날짜 형식 유효성 검증 
  // 스킬, 어학, 자격증 ex)2023-05-12 //
 		2023-04-23 최종 확인 */
function formatDate(input) {
		// 입력에서 숫자가 아닌 모든 문자 제거
	  var sanitized = input.value.replace(/[^0-9]/g, '');
	  
	   // 입력이 6자보다 더 이상인지 점검하십시오.
	  if (sanitized.length > 6) {
	    // 적절한 위치에 대시 삽입
	    sanitized = sanitized.slice(0, 4) + '-' + sanitized.slice(4, 6) + '-' + sanitized.slice(6);
	  }
	  
	  // 형식 지정된 날짜로 입력 값 업데이트
	  input.value = sanitized;
}//end formatDate
 
 /* text 날짜 형식 유효성 검증 
   // 학력 재학기간 ex)2023-01~2023-12 // 
		2023-04-23 최종 확인 */
 function formatDateEdu(input) {
	// 입력에서 숫자가 아닌 모든 문자 제거
	  var sanitized = input.value.replace(/[^0-9]/g, '');

		// 입력에서 숫자가 아닌 모든 문자 제거
	  if (sanitized.length == 6) {
		 
	    sanitized = sanitized.slice(0, 4) + '-' + sanitized.slice(4,6) + '~'  
	    
	  } else if (sanitized.length > 6) {
		  sanitized = sanitized.slice(0, 4) + '-' + sanitized.slice(4,6) + '~' + sanitized.slice(6,10) + '-' +sanitized.slice(10,12);
	  } 

		// 형식 지정된 날짜로 입력 값 업데이트
	  input.value = sanitized;
	}//formatDateEdu

	
 /* text 휴대폰번호 형식 유효성 검증 
  	// ex)010-1234-5678
	  2023-04-23 최종 확인 */
function telValidation(input) {
	// 입력에서 숫자가 아닌 모든 문자 제거
	  var sanitized = input.value.replace(/[^0-9]/g, '');
	  
	   // 입력이 6자보다 더 이상인지 점검
	  if (sanitized.length > 6) {
	    // 적절한 위치에 대시 삽입
	    sanitized = sanitized.slice(0, 3) + '-' + sanitized.slice(3, 7) + '-' + sanitized.slice(7,11);
	  }
	  
	  // 형식 지정된 날짜로 입력 값 업데이트
	  input.value = sanitized;
}//end tel

/* input 생년월일 형식 유효성 검증 
   // ex)1995-07-03   
	 2023-04-23 최종 확인 */
function birthValidation(input) {
// 입력에서 숫자가 아닌 모든 문자 제거
  var sanitized = input.value.replace(/[^0-9]/g, '');
  
  
   // 입력이 6자보다 더 이상인지 점검
  if (sanitized.length > 6) {
    // 적절한 위치에 대시 삽입
    sanitized = sanitized.slice(0, 4) + '-' + sanitized.slice(4, 6) + '-' + sanitized.slice(6,8);
  }
  
  // 형식 지정된 날짜로 입력 값 업데이트
  input.value = sanitized;
}//end tel


/*  sal 연봉 숫자만 입력 유효성 검증
	2023-04-25 최종 확인 */
function salValidation(input) {
  // 입력에서 숫자가 아닌 모든 문자 제거
  var sanitized = input.value.replace(/[^0-9]/g, '');
  
  // 형식 지정된 날짜로 입력 값 업데이트
  input.value = sanitized;
}//end sal

 
 /* 체크박스 누르면 text에 면접 후 결정 + readonly*/
  // 2023-04-23 최종 확인
function toggleInput() {
    var input = document.getElementById("sal");
    var checkbox = document.getElementById("decision");
    var flag= false;
    if (checkbox.checked != flag) {
    	var decision = '면접 후 결정';
      $('input[name=decision]').attr('value',decision);
      input.readOnly = true;
      input.value = decision;
    } else {
      input.readOnly = false;
    }//end else
}//toggleInput


/* 이미지 파일(증명사진) 바로 보여주기 */
  // 2023-04-23 최종 확인
$(function() {
	  $('#imageFileInput').on('change', function(event) {
		var file = event.target.files[0];
	    if (file.type.match('image.*')) {
	      var reader = new FileReader();
	      reader.onload = function(event) {
	        var imageSource = event.target.result;
	        $("#preview").empty();
	        $('#preview').html('<img src="' + imageSource + '">');
	      };
	      reader.readAsDataURL(file);
	    }
	  });
	});
 
/*  이미지 파일(증명사진) 삭제하기 버튼 
 // 버튼 요소를 클릭했을 때의 이벤트 처리 
 	// 2023-04-23 최종 확인
 	$(function(){
 		$('#btnDelete').on('click', function(){
	 		if(!confirm("사진을 삭제하면 입사지원한 이력서에서도 삭제됩니다. \n\n등록된 사진을 삭제하시겠습니까?")) {
				
	 		} else {
		        // 이미지 요소의 src 속성 값을 빈 문자열로 설정하여 ${imageFileInput}을 지움.
				alert("삭제 되었습니다.");
		        $('#preview img').attr('src', 'http://localhost/prj2/upload/no.png').on('error', function() {
		            // 이미지 로드 실패 시 onerror 이벤트 핸들러에서 처리할 로직을 작성.
		            $(this).hide();
			    });
	 		}//end if
 		});//click
 	});//ready */
</script>

<link
	href="//i.jobkorea.kr/content/css/ver_2/event/banner.promotion-sv-202211241151.css"
	rel="stylesheet" type="text/css" />

<link
	href="//i.jobkorea.kr/content/css/ver_2/common-sv-202302221621.css"
	rel="stylesheet" type="text/css" />
<link
	href="//i.jobkorea.kr/content/css/ver_2/text_user/resume/header-sv-202005061649.css"
	rel="stylesheet" type="text/css" />
<link
	href="//i.jobkorea.kr/content/css/ver_2/text_user/resume/layout-sv-202005061649.css"
	rel="stylesheet" type="text/css" />
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
.autocomplete .list .hover {
	background-color: #f5f5f5;
}

.popupSearchDuty .list .hover {
	background-color: #f5f5f5;
}

.minusSkill, .minusCertificate, .minusLang {
	position: relative;
	left: 70px;
}

.minusEdu{
	position: relative;
	left: 500px;
	bottom: 75px;
}

[name=btnChange1]{
	position: relative;
	left : 835px;
}

#btnDelete{
	position: relative;
	left : 840px;
}


</style>

<link rel="stylesheet"
	href="https://i.jobkorea.kr/content/css/join/flow/flow.css">


<script type='text/javascript'
	src='/resources/lib/datastory/dslog.js?ver=1.1' id='dslog_tag'>
	
</script>

<style>
.async-hide {
	opacity: 0 !important
}

</style>
</head>



<body class="resume resume-write">
<% request.setCharacterEncoding("UTF-8");  %>
<%
ResumeDAO rDAO=new ResumeDAO();
// 지금은 session에서 가져온 값을 사용하고 있으므로 나중에 값을 넣고 테스트 해보려면 맨 위에 session 스크립틀릿 주석처리하고 
// String userId = "test777"; 
// 여기 바로 위에 ↑↑↑↑ 풀어서 값 넣기
UserDataVO udVO= null;
try{
	udVO = rDAO.selectUserData(userId);
	if(udVO != null){ // 객체 생성 / 성공
		System.out.println("회원 객체 성공");
	}else{
		System.out.println("회원 객체 없어요");
		%>
		불편을 끼쳐드려 죄송합니다.
		<%
	}
}catch(SQLException se){
	se.printStackTrace();
}//end catch


//복호화한 값들 VO에 저장 (이름, 이메일, 휴대폰번호, 주소)
DataDecrypt dd=new DataDecrypt("FsRt4SfY4US0IWtK4JPJsw==");
udVO.setName(dd.decryption(udVO.getName()));
udVO.setEmail(dd.decryption(udVO.getEmail()));
udVO.setTel(dd.decryption(udVO.getTel()));
udVO.setAddr(dd.decryption(udVO.getAddr()));

/* //암호화
DataEncrypt de = new DataEncrypt("FsRt4SfY4US0IWtK4JPJsw==");  */

//VO값들 불러서 scope객체에 저장
pageContext.setAttribute("name", udVO.getName());
pageContext.setAttribute("email", udVO.getEmail());
pageContext.setAttribute("tel", udVO.getTel());
pageContext.setAttribute("addr", udVO.getAddr());

pageContext.setAttribute("birthDate", udVO.getBirthDate());
pageContext.setAttribute("gender", udVO.getGender());
pageContext.setAttribute("imageFileInput", udVO.getImg()); 

%>
	<div class="resumePage">

		<div class="resumeHeader">
			<div class="container">
				<a href="http://localhost/prj2/project_user/1.main/main_page_loged.jsp" class="logo linkLogo"><img
					src="http://localhost/prj2/images/devplanet_logo.png"
					style="width: 100px; height: auto;" alt="JOBKOREA"></a>
				<div class="links">
					<a href="http://localhost/prj2/project_user/1.main/main_page_loged.jsp" class="link linkHome">개인회원 홈</a> <a
						href="http://localhost/prj2/project_user/4.resume/resume_present.jsp"
						class="link linkManage">이력서 관리</a>
				</div>
			</div>
		</div>
					
		<!-- multipart/form-data 폼태그 -->
		<form method="post" name="postFrm" enctype="multipart/form-data" id="userFrm"
				action="resume_add_process.jsp">
			<div class="resumeWrapper">
			
				<div class="resumeContainer">
					<div class="formWrap formWrapProfile">
						<h2 style="font-size: 50px; font-style: bold; text-align: center;
									margin-bottom: 30px; color: #144280">
							이력서 등록
						</h2>
					</div>
					<!-- 제목 -->
					<div class="resumeTitle">
						<input type="text" maxlength="100"
							placeholder="HTML로 프로그래밍 하는거 좋아합니다." value="" id="title"
							name="title" />
					</div>

					<!-- 인적사항 -->
					<div class="formWrap formWrapProfile">
						<h2 class="header">
							인적사항
							<div class="description">
								<span class="star">*</span> 필수 입력 정보입니다.
							</div>
						</h2>
						<div class="form formProfile">
							<div class="row">
								<!-- 인적사항(이름) -->
								<div class="input is-label input-profile-name is-value">
									<label>이름 <span class="star">*</span></label> <input
										type="text" name="name" id="name" readonly="readonly" value="${ name }">
								</div>
								<!-- 인적사항(생년월일) -->
								<div class="input is-label input-profile-birth is-value">
									<label>생년월일 <span class="star">*</span></label> <input
										oninput="birthValidation(this)" id="birthDate" name="birthDate" type="text" maxlength="10" value="${birthDate }">
								</div>
								<!-- 인적사항(성별) -->
								<div class="dropdown dropdown-profile-sex is-label selected">
									<div class="label " aria-hidden="true">
										성별 <span class="star">*</span>
									</div>
									<div class="lyTplArea">
										<select title="진행여부" name="gender" id="gender"
											class="ipSelect ipSelect_1" onchange=""
											style="height: 60px; width: 110px; border-color: #DDDDDD">
											<option value=""></option>
											<option value="m" ${gender eq "m" ? 'selected' : '' }>남자</option>
											<option value="f" ${gender eq "f" ? 'selected' : '' }>여자</option>
										</select>
									</div>
								</div>
								<!-- 인적사항(이메일) -->
								<div class="input input-profile-email is-label is-value">
									<label for="UserInfo_M_Email">이메일</label> <input type="email"
										readonly="readonly" name="email" id="email" value="${email }">
								</div>
							</div>
							<div class="row">

								<!-- 인적사항(전화번호) -->
								<div class="input is-label input-profile-hp">
									<div class="input is-label input-profile-hp is-value">
										<label>휴대폰번호 <span class="star">*</span></label> <input
											readonly="readonly" type="text" name="tel" id="tel"  oninput="telValidation(this)" value="${tel }" maxlength="13">
									</div>
								</div>
								<!-- 인적사항(주소) -->
								<a href="javascript:post_check();"
									class="input is-label input-profile-addr is-value"> <label>주소</label>
									<input type="text" id="addr" name="addr" readonly="readonly"
									 value="${ addr }"> <i	class="icon icon-search" aria-hidden="true" id="kakao"></i>
								</a>
							</div>

							<div class="row">
									<button type="button" id="imageFileInput1" name="btnChange1"> 
										변경
									</button>
									<input type="file" id="imageFileInput" name="img" style="display: none;">
							</div>
							<div>
							<!-- 증명사진 div -->
									<!-- <div class="guide" style="display: none;">사진추가</div>

									<a href="javascript:;" class="buttonAddFile"
										style="display: none;"> 사진등록 </a> -->
									
									<div class="picture dropped" id="preview" class="image" aria-hidden="true">
									<img src="http://localhost/prj2/upload/${imageFileInput}" onerror="this.src='http://localhost/prj2/upload/no.png'"/>

									</div>
							</div>
							<!-- 증명사진 div 끝 -->
						</div>
					</div>
					<input type="hidden" name="hiddenImg" value="<%=udVO.getImg() %>"/>
					<!-- 경력 -->

					<div class="formWrap formWrapHopework" id="formWrapHopework">
						<h2 class="header">경력</h2>

						<div class="form formHopework" id="">
							<div class="row">
								<div class="dropdown dropdown-profile-sex is-label selected">
									<div class="label " aria-hidden="true">경력</div>
									<div class="lyTplArea">
										<select title="경력" name="career" id="career"
											class="ipSelect ipSelect_1" onchange=""
											style="height: 60px; width: 110px; border-color: #DDDDDD">
											<option value="">--선택--</option>
											<option value="신입">신입</option>
											<option value="1~3년">1~3년</option>
											<option value="4~6년">4~6년</option>
											<option value="7~9년">7~9년</option>
											<option value="10~15년">10~15년</option>
											<option value="16~20년">16~20년</option>
										</select>
									</div>
								</div>
							</div>
						</div>
					</div>

					<!-- 희망직무 -->
					<div class="formWrap formWrapHopework" id="">
						<h2 class="header">희망직무</h2>

						<div class="form formHopework" id="">
							<!-- 클론희망직무 -->
							<div class="row">
								<div class="listHopework" id="hopeLocal" style="width: 500px;">
									<div class="keyword-wrap">
										<div class="header">
											희망직무 <span class="guide">희망 직무를 적어주세요.</span><br> <input
												type="text" placeholder="웹개발 프로그래밍" name="job" id="job"
												style="font-size: 20px; border: 0px solid #333;">
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>

					<!-- 희망근무조건 -->
					<div class="formWrap formWrapHopework" id="">
						<h2 class="header">희망근무조건</h2>
						<div class="form formHopework" id="">
							<!-- 클론희망연봉 -->
							<div class="row">
								<div class="listHopework" id="hopeLocal" style="width: 500px;">
									<div class="keyword-wrap">
										<div class="header">
											희망연봉 <span class="guide">희망연봉을 만원 단위로 적어주세요.</span><br>
											<input type="text" id="sal" name="sal" placeholder="3000만원" style="font-size: 20px; border: 0px solid #333;" oninput="salValidation(this)"> 
											<input type="checkbox" name="checkSal" name="decision" id="decision" value="" onclick="toggleInput();"/> 면접 후 결정
										</div>
									</div>
								</div>
							</div>
	

							<!-- 클론희망근무지 -->
							<!--  -->
							<div class="row">
								<div class="listHopework" id="">
									<div class="dropdown dropdown-profile-sex is-label selected">
										<div class="label " aria-hidden="true">고용형태</div>
										<div class="lyTplArea">
											<select title="고용형태" name="empform" id="empform"
												class="ipSelect ipSelect_1" onchange=""
												style="height: 60px; width: 110px; border-color: #DDDDDD;">
												<option value="">--선택--</option>
												<option value="정규직">정규직</option>
												<option value="계약직">계약직</option>
												<option value="인턴">인턴</option>
												<option value="파견직">파견직</option>
												<option value="도급">도급</option>
												<option value="프리랜서">프리랜서</option>
											</select>
										</div>
									</div>
									<div class="dropdown dropdown-profile-sex is-label selected">
										<div class="label " aria-hidden="true">희망근무지</div>
										<div class="lyTplArea">
											<select title="희망근무지" name="area" id="area"
												class="ipSelect ipSelect_1" onchange=""
												style="height: 60px; width: 110px; border-color: #DDDDDD;">
												<option value="">--선택--</option>
												<option value="서울특별시">서울특별시</option>
												<option value="경기도">경기도</option>
												<option value="인천광역시">인천광역시</option>
												<option value="대전광역시">대전광역시</option>
												<option value="세종특별자치시">세종특별자치시</option>
											</select>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>

		<!-- 스킬 -->
		<div class="formWrap formWrapHopework" id="">
			<h2 class="header">스킬</h2>
			<div class="form formHopework" id="">
				<!-- 클론스킬 -->
				<div class="row">
					<div id="skill">
						<!-- 스킬(스킬명) -->
						<div class="input input-certificate-name is-label is-value"
							style="width: 300px;">
							<!-- hcy style 추가 -->
							<label>스킬명 <span class="star">*</span></label> <input type="text"
								name="nameS" id="nameS" value="">
						</div>

						<button type="button"
							style="height: 30px; width: 60px; border: 1px solid #999999; margin-top: 20px; margin-bottom: 20px; margin-right: 20px;"
							id="addSkill">
							<!-- hcy id변경 -->
							<span style="">+ 추가</span>
						</button>
					</div>
				</div>
				
				<!-- 
				<button type="button"
					style="height: 30px; width: 60px; border: 1px solid #999999; margin-top: 20px; margin-bottom: 20px;"
					id="saveSkill">
					<span style="">저장</span>
				</button>
				 -->
				
			</div>
		</div>
		
		

		<!-- 자격증 -->
		<div class="formWrap formWrapHopework" id="">
			<h2 class="header">자격증</h2>
			<div class="form formHopework" id="">
				<!-- 클론희망연봉 -->
				<div class="row">
					<div id="add">
						<!-- 자격증(자격증명) -->
						<div class="input input-certificate-name is-label is-value">
							<label>자격증명 <span class="star">*</span></label> <input
								type="text" name="nameC" id="nameC" value="">
						</div>

						<!-- 자격증(발행처/기관) -->
						<div class="input input-certificate-agency is-label is-value">
							<label>발행처/기관 <span class="star">*</span></label> <input
								id="issuerC" name="issuer" placeholder="" type="text" value="">
						</div>

						<!-- 자격증(취득일) -->
						<div class="input input-certificate-term is-label is-value">
							<label>취득일</label> <input type="text" name="getDateC"
								id="getDateC" maxlength="10" oninput="formatDate(this)" value="" placeholder="2023.04">
						</div>
						<button type="button"
							style="height: 30px; width: 60px; border: 1px solid #999999; margin-top: 20px; margin-bottom: 20px; margin-right: 20px;"
							id="addCertificate">
							<span style="">+ 추가</span>
						</button>
					</div>
				</div>
				
				<!-- 
				<button type="button"
					style="height: 30px; width: 60px; border: 1px solid #999999; margin-top: 20px; margin-bottom: 20px;"
					id="saveCertificate">
					<span style="">저장</span>
				</button>
				 -->
				
			</div>
		</div>
		
		

		<!-- 어학 -->
		<div class="formWrap formWrapHopework" id="">
			<h2 class="header">어학</h2>
			<div class="form formHopework" id="">
				<!-- 클론희망연봉 -->
				<div class="row">
					<div id="lang">
						<!-- 어학(외국어명) -->
						<!-- hcy div id추가 -->
						<div class="input input-certificate-name is-label is-value">
							<label>외국어명 <span class="star">*</span></label> <input
								type="text" name="nameL" id="nameL" value="">
						</div>

						<!-- 어학(자격증명) -->
						<div class="input input-certificate-name is-label is-value">
							<label>시험명 <span class="star">*</span></label> <input type="text"
								name="testName" id="testName" value="">
						</div>

						<!-- 어학(점수) -->
						<div class="input input-certificate-agency is-label is-value">
							<label>점수 <span class="star">*</span></label> <input id="score"
								name="score" type="text" value="">
						</div>

						<!-- 어학(취득일) -->
						<div class="input input-certificate-term is-label is-value">
							<label>취득일</label> <input type="text" name="getDateL" id="getDate"
								maxlength="10" oninput="formatDate(this)" value="">
						</div>
						<button type="button"
							style="height: 30px; width: 60px; border: 1px solid #999999; margin-top: 20px; margin-bottom: 20px;"
							id="addLang">
							<span style="">+ 추가</span>
						</button>
					</div>
				</div>
				
				<!-- 
				<button type="button"
					style="height: 30px; width: 60px; border: 1px solid #999999; margin-top: 20px; margin-bottom: 20px;"
					id="saveLanguage">
					<span style="">저장</span>
				</button>
				 -->
				
			</div>
		</div>
		

		<!-- 학력 -->
		<div class="formWrap formWrapHopework" id="">

			<h2 class="header">학력</h2>
			<div class="form formEducation">
				<div>
					<div class="container container1">
						<div class="row">
							<div id="edu">
								<div class="dropdown dropdown-profile-sex is-label selected">
									<div class="label " aria-hidden="true">
										학교구분 <span class="star">*</span>
									</div>
									<!-- 학교구분 -->
									<div class="lyTplArea">
										<select title="자격증/어학" name="schoolType" id="schoolType"
											class="ipSelect ipSelect_1" onchange="chkSch();"
											style="height: 60px; width: 110px; border-color: #DDDDDD;">
											<option value=""></option>
											<option value="고등학교" selected>고등학교</option>
											<!-- 첫번째는 고등학교만 기입 가능하므로 아래 주석 -->
											<!-- <option value="대학(2,3년)">대학(2,3년)</option>
											<option value="대학교(4년)">대학교(4년)</option>
											<option value="대학원(석사)">대학원(석사)</option>
											<option value="대학원(박사)">대학원(박사)</option> -->
										</select>
									</div>
								</div>

								<!-- 학교명 -->
								<div
									class="input input-education-name is-label is-ellipsis  is-value"
									id="">
									<label for="UnivSchool_Schl_Name_c4">학교명 <span
										class="star">*</span></label> <input type="text" id="schoolName"
										name="schoolName" value="" autocomplete="off" maxlength="50">
								</div>

								<!-- 재학기간 -->
								<div class="input input-certificate-agency is-label is-value">
									<label>재학기간 <span class="star">*</span></label> <input type="text" maxlength="15" oninput="formatDateEdu(this)" name="period" id="period" title="Please enter a date in the format xxxx-xx-xx" required>
								</div>
								
								<input type="hidden" value=" " name="major"/>
								<input type="hidden" value=" " name="gpa"/>
								
								<!-- 
								학점 
								<div class="input input-education-enddate is-label is-value" id="gpaDiv">
									<label>학점 <span class="star">*</span></label> <input
										type="text" name="gpa" id="gpa" value="" placeholder="">
								</div>

								전공명
								<div class="row" id="majorDiv" style="width:50px;">
									<div
										class="input input-education-major-name search is-label is-value">
										<label>전공명</label> <input type="text" id="major" name="major"
											value="" autocomplete="off" maxlength="50">
									</div>
								</div> 
								hcy 주석--> 
								<button type="button"
									style="height: 30px; width: 60px; border: 1px solid #999999; margin-top: 20px; margin-bottom: 20px;"
									id="addEducation">
									<span style="">+ 추가</span>
								</button>
							</div>
						</div>
						<div>
						
						<!-- 
						<button type="button"
							style="height: 35px; width: 60px; border: 1px solid #999999; margin-top: 20px; margin-bottom: 20px;"
							id="saveEducation">
							<span style="">저장</span>
						</button>
						 -->
						
						</div>
					</div>
				</div>
			</div>
			
			<div>
				<button type="button" id="resumeSave"
					style="height: 80px; width: 200px; border: 1px solid #999999; margin-top: 20px; margin-bottom: 20px; background: #3399FF; border-radius: 10px; float: right;">
					<span style="font-size: 20px; color: #FFFFFF; font-weight: bold;">이력서
						저장</span>
				</button>
			</div>
		</div>
	</div>
	</div>
	</form>
	</div>
</body>
</html>