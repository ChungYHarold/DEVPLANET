<%@page import="kr.co.sist.user.vo.LoginResultVO"%>
<%@page import="kr.co.sist.user.dao.JobDAO"%>
<%@page import="kr.co.sist.user.dao.ResumeModifyDAO"%>
<%@page import="kr.co.sist.util.cipher.DataDecrypt"%>
<%@page import="kr.co.sist.user.vo.ResumeDataVO"%>
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
	<%															//로그인 창으로 보내는 예시
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
<script type="text/javascript">

/* 추가 자격증 */
$(function(){ 
	$("#addCer").click(function(){
		var newDiv = $('<div name="row" class="row"><div class="input input-certificate-name is-label is-value"><label>자격증명 <span class="star">*</span></label><input type="text" name="nameC" id="nameC" value=""></div> <div class="input input-certificate-agency is-label is-value"><label>발행처/기관 <span class="star">*</span></label> <input id="issuer" name="issuer" placeholder="" type="text" value=""></div> <div class="input input-certificate-term is-label is-value"><label>취득일</label> <input type="text" name="getDateC" id="getDateC" maxlength="10" oninput="formatDate(this)" value=""></div> <button type="button" style="height: 30px; width: 60px; border: 1px solid #999999; margin-top: 20px; margin-bottom: 20px;" class="minusCertificate"> <span style="">삭제</span> </button></div>');
	    
		$('#CerBtn').append(newDiv);

			newDiv.find('.minusCertificate').click(function(){
			newDiv.remove();
		});
	});//click
});//ready
	
/* 추가 스킬 */	
$(function(){
	$("#addSkill").click(function(){
		var newDiv = $('<div class="row"><div id="skill"><div class="input input-certificate-name is-label is-value" style="width:300px;"><label>스킬명 <span class="star">*</span></label><input type="text" name="nameS" id="nameS" value=""></div><button type="button" style="height: 30px; width: 60px; border: 1px solid #999999; margin-top: 20px; margin-bottom: 20px;" class="minusSkill"><span style="">삭제</span></button></div></div>');
				    
		$('#skillBtn').append(newDiv);

			newDiv.find('.minusSkill').click(function(){
			newDiv.remove();
			});
	});//click
});//ready

/* 추가 어학 */
$(function(){ 
	$("#addLang").click(function(){
		var newDiv = $('<div class="row"><div class="input input-certificate-name is-label is-value"><label>외국어명 <span class="star">*</span></label><input type="text" name="nameL" id="nameL" value="" ></div><div class="input input-certificate-name is-label is-value"><label>시험명 <span class="star">*</span></label><input type="text" name="testName" id="testName" value="" ></div><div class="input input-certificate-agency is-label is-value"><label>점수 <span class="star">*</span></label><input  id="score" name="score" type="text" value=""></div><div class="input input-certificate-term is-label is-value"><label>취득일</label><input type="text" name="getDateL" id="getDateL" maxlength="10" oninput="formatDate(this)" value=""></div><button type="button"style="height: 30px; width: 60px; border: 1px solid #999999; margin-top: 20px; margin-bottom: 20px;"class="minusLang"><span style="">삭제</span></button></div>');
		$('#langBtn').append(newDiv);   
		
		newDiv.find('.minusLang').click(function(){
			newDiv.remove();
		});
	});//click
});//ready

/*
추가 학력
$(function(){ 
	$("#addEdu").click(function(){
		var newDiv = $('<div id="edu" style="height:160px;"><div class="dropdown dropdown-profile-sex is-label selected"><div class="label " aria-hidden="true">학교구분 <span class="star">*</span></div><div class="lyTplArea"><select title="자격증/어학" name="schoolType" id="schoolType"class="ipSelect ipSelect_1" onchange="chkSch();"style="height: 60px; width: 110px; border-color: #DDDDDD;"><option value=""></option><option value="고등학교">고등학교</option><option value="대학(2,3년)">대학(2,3년)</option><option value="대학교(4년)">대학교(4년)</option><option value="대학원(석사)">대학원(석사)</option><option value="대학원(박사)">대학원(박사)</option></select></div></div><div class="input input-education-name is-label is-ellipsis  is-value" id=""><label for="UnivSchool_Schl_Name_c4">학교명 <span class="star">*</span></label> <input type="text" id="schoolName"name="schoolName" value="" autocomplete="off" maxlength="50"></div><div class="input input-certificate-agency is-label is-value"><label>재학기간 <span class="star">*</span></label> <input type="text" name="period" id="period" value="" maxlength="15" oninput="formatDateEdu(this)"></div><div class="input input-education-enddate is-label is-value" id="gpaDiv"><label>학점 <span class="star">*</span></label> <input type="text" name="gpa" id="gpa" value="" maxlength="4" placeholder=""></div><div class="row" id="majorDiv" style="width:455px;"><div class="input input-education-major-name search is-label is-value"><label>전공명</label> <input type="text" id="major" name="major" value="" autocomplete="off" maxlength="50"></div></div><button type="button"style="height: 30px; width: 60px; border: 1px solid #999999; margin-top: 20px; margin-bottom: 20px;"class="minusEdu"><span style="">삭제</span></button></div>');
		$('#eduBtn').append(newDiv);   
		
		newDiv.find('.minusEdu').click(function(){
			newDiv.remove();
		});
	});//click
});//ready
*/

//추가학력
$(function(){
  $("#addEdu").click(function(){
    var newDiv = $('<div id="edu" style="height:160px;"><div class="dropdown dropdown-profile-sex is-label selected"><div class="label " aria-hidden="true">학교구분 <span class="star">*</span></div><div class="lyTplArea"><select title="자격증/어학" name="schoolType" id="schoolType" class="ipSelect ipSelect_1" onchange="chkSch();" style="height: 60px; width: 110px; border-color: #DDDDDD;"><option value=""></option><option value="고등학교">고등학교</option><option value="대학(2,3년)">대학(2,3년)</option><option value="대학교(4년)">대학교(4년)</option><option value="대학원(석사)">대학원(석사)</option><option value="대학원(박사)">대학원(박사)</option></select></div></div><div class="input input-education-name is-label is-ellipsis is-value" id=""><label for="UnivSchool_Schl_Name_c4">학교명 <span class="star">*</span></label> <input type="text" id="schoolName" name="schoolName" value="" autocomplete="off" maxlength="50"></div><div class="input input-certificate-agency is-label is-value"><label>재학기간 <span class="star">*</span></label> <input type="text" name="period" id="period" value="" maxlength="15" oninput="formatDateEdu(this)"></div><div class="input input-education-enddate is-label is-value" id="gpaDiv"><label>학점 <span class="star">*</span></label> <input type="text" name="gpa" id="gpa" value="" maxlength="4" placeholder=""></div><div class="row" id="majorDiv" style="width:455px;"><div class="input input-education-major-name search is-label is-value"><label class="majorL">전공명</label> <input type="text" id="major" name="major" value="" autocomplete="off" maxlength="50"></div></div><button type="button" style="height: 30px; width: 60px; border: 1px solid #999999; margin-top: 20px; margin-bottom: 20px; position : relative; margin-bottom: 0px;" class="minusEdu"><span style="">삭제</span></button></div>');
    $('#eduBtn').append(newDiv);   
    
    newDiv.find('.minusEdu').click(function(){
		newDiv.remove();
	});
    
    newDiv.find('#schoolType').change(function(){
      if($(this).val() == '고등학교'){
    	newDiv.find('#majorDiv').css('visibility', 'hidden');
    	newDiv.find('.majorL').hide();
        newDiv.find('#gpaDiv').hide();
      }else{
    	newDiv.find('#majorDiv').css('visibility', 'visible');
    	newDiv.find('.majorL').show();
        newDiv.find('#gpaDiv').show();
      }
      
      
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
			alert("제목을 입력해주세요.");
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
			alert("생일을 입력해주세요.");
			$("#birthDate").focus();
			return;
		}

		//성별
		if($("select[name=gender]").val() == ""){
			alert("성별을 골라주세요.");
			$("#gender").focus();
			return;
		}
		
		//경력
		if($("#career").val() == ""){
			alert("경력을 입력해주세요.");
			$("#career").focus();
			return;
		}

		//희망직무
		if($("#job").val() == ""){
			alert("희망 직무를 입력해주세요.");
			$("#job").focus();
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
		
		/*
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
		*/
		
		if(!confirm("이력서를 수정하시겠습니까?")) {
			/* location.href="http://localhost/prj2/project_user/4.resume/2.resume_complete.jsp" */
			$("#title").focus();
		} else {
			$(function(){
				$("#userFrm").submit();
			});//ready 
			
		}//end if
	});//click
});//ready

/* $(function () {
	$('#fileInput').on('change', function() {
		  if ($(this).val()) {
		    // 파일 버튼이 눌렸을 때의 처리
		    console.log('파일이 선택되었습니다.');
		  } else {
		    // 파일 버튼이 안 눌렸을 때의 처리
		    console.log('파일이 선택되지 않았습니다.');
		  }
	});
}); */
 
 /* text 날짜 형식 유효성 검증 
  // 스킬, 어학, 자격증 ex)2023-05-12 //
 		2023-04-23 최종 확인 */
function formatDate(input) {
		// 입력에서 숫자가 아닌 모든 문자 제거
	  var sanitized = input.value.replace(/[^0-9]/g, '');
	  
	   // 입력이 6자보다 더 이상인지 점검
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
 
/* 이미지 파일(증명사진) 삭제하기 버튼 */ 
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
	});//ready

	
<% String rrNum = request.getParameter("rNum"); %>
$(function () {
		var jsonSkill = {rNum : <%= rrNum %>}
		
		// 스킬
		
		$.ajax({
			url : "data_skill.jsp",
			data: jsonSkill,
			dataType : "JSON",
			error : function(xhr){
				console.log(xhr.status);
				var errorView="<div style='color: #FF0000;'>조회된 스킬이 존재하지 않습니다.</div>";
				
				$("#skillDiv").append(errorView);
			},
			success : function(jsonArr) {
				var skillView="";
				
				 if(jsonArr !== null && jsonArr.length > 0){
					 $.each(jsonArr,function(idx,jsonObj){
						skillView +=	"<div class='row'><div id='skill'>스킬(스킬명)"+
									"<div class='input input-certificate-name is-label is-value' style='width: 300px;'>"+
									"<label>스킬명 <span class='star'>*</span></label> <input type='text' readonly='readonly' value='"+jsonObj.name+"'></div>"+
									"<a href='http://localhost/prj2/project_user/4.resume/CLSE_delete.jsp?num="+jsonObj.num+"'>"+
									"<button type='button' style='height: 30px; width: 60px; border: 1px solid #999999; margin-top: 20px; margin-bottom: 20px; margin-right: 20px;' id='deleteSkill'>"+
									"<span style=''>- 삭제</span></button></a></div></div>"
						
					});//each
				 } else {
					 skillView = "<div style='color : red'>조회된 결과가 없습니다</div>"
				 }//end else
				
				$("#skillDiv:last").append(skillView);
				
			}//end success
		});//ajax
		
		 
		var jsonLang = {rNum : <%= rrNum %>}
		//어학
		$.ajax({
			url : "data_lang.jsp",
			data : jsonLang,
			dataType : "json",
			error : function(xhr) {
				console.log(xhr.status);
				var errorView="<div style='color: #FF0000;'>조회된 어학이 존재하지 않습니다.</div>";
				
				$("#langDiv").append(errorView);
			},
			success : function(jsonArr) {
				var langView="";
				
				if(jsonArr !== null && jsonArr.length>0){
					$.each(jsonArr,function(idx,jsonObj){
						langView+="<div class='row'><div class='input input-certificate-name is-label is-value'><label>외국어명 <span class='star'>*</span></label>"+
								  "<input type='text' readonly='readonly' value='"+jsonObj.name+"' ></div><div class='input input-certificate-name is-label is-value'>"+
								  "<label>시험명 <span class='star'>*</span></label><input type='text' readonly='readonly' value="+jsonObj.testName+"' ></div>"+
								  "<div class='input input-certificate-agency is-label is-value'>"+
								  "<label>점수 <span class='star'>*</span></label>"+
								  "<input type='text' readonly='readonly' value='"+jsonObj.score+"'></div><div class='input input-certificate-term is-label is-value'>"+
								  "<label>취득일</label><input type='text' maxlength='10' oninput='formatDate(this)' readonly='readonly' value='"+jsonObj.getDate+"'></div>"+
								  "<a href='http://localhost/prj2/project_user/4.resume/CLSE_delete.jsp?num="+jsonObj.num+"'>"+
									"<button type='button' style='height: 30px; width: 60px; border: 1px solid #999999; margin-top: 20px; margin-bottom: 20px; margin-right: 20px;' id='deleteSkill'>"+
									"<span style=''>- 삭제</span></button></a>"
					});//each
				}else{
					langView="<div style='color : red'>조회된 결과가 없습니다</div>"
				}//end else
				
				$("#langDiv:last").append(langView);
			}
		});//ajax
		
		
		var jsonCer = {rNum : <%= rrNum %>}
		//자격증
		$.ajax({
			url : "data_cer.jsp",
			data : jsonCer,
			dataType : "json",
			error : function(xhr) {
				console.log(xhr.status +"/"+ xhr.statusText);
				var errorView="<div style='color: #FF0000;'>조회된 자격증이 존재하지 않습니다.</div>";
				
				$("#cerDiv").append(errorView);
			},
			success : function(jsonArr) { 
				var cerView="";
				
				if(jsonArr !== null && jsonArr.length>0){
					$.each(jsonArr,function(idx,jsonObj){
						cerView+="<div name='row' class='row'><div class='input input-certificate-name is-label is-value'>"+
								 "<label>자격증명<span class='star'>*</span></label><input type='text' readonly='readonly' value='"+jsonObj.name+"'></div>"+
								 "<div class='input input-certificate-agency is-label is-value'>"+
								 "<label>발행처/기관<span class='star'>*</span></label>"+
								 "<input placeholder='' type='text' readonly='readonly' value='"+jsonObj.issuer+"'></div> <div class='input input-certificate-term is-label is-value'>"+
								 "<label>취득일</label><input type='text' maxlength='10' oninput='formatDate(this)' readonly='readonly' value='"+jsonObj.getDate+"'></div>"+
								 "<a href='http://localhost/prj2/project_user/4.resume/CLSE_delete.jsp?num="+jsonObj.num+"'>"+
								  "<button type='button'style='height: 30px; width: 60px; border: 1px solid #999999; margin-top: 20px; margin-bottom: 20px;'class='minusLang'><span style=''>-삭제</span></button></a>"
					});//each
					
				}else{
					cerView="<div style='color : red'>조회된 결과가 없습니다</div>"
				}//end else
				
				$("#cerDiv:last").append(cerView);
			}
		});//ajax
		
		/*
		//undefined 처리할 때 보면 좋을 거 같아서 주석 처리
		 $(function () {
		    var x = $('select[name=testSel]').val();
		   
		    if(x == "고등학교"){
		       $("input[name=testRead]").remove();
		    }
		    
		});//ready
		*/
		
		var jsonEdu = {rNum : <%= rrNum %>}
		//학력
		$.ajax({
			url : "data_edu.jsp",
			data : jsonEdu,
			dataType : "json",
			error : function(xhr) {
				console.log(xhr.status);
				var errorView="<div style='color: #FF0000;'>조회된 학력이 존재하지 않습니다.</div>";
				
				$("#eduDiv").append(errorView);
			},
			success : function(jsonArr) { 
				var eduView="";
				
				if(jsonArr !== null && jsonArr.length>0){
					$.each(jsonArr,function(idx,jsonObj){ 
						eduView+="<div class='row' style='height:155px;'>"+
								 	"<div class='dropdown dropdown-profile-sex is-label selected'>"+
								 	"<div class='label' aria-hidden='true'>학교구분 <span class='star'>*</span></div>"+
								 	"<div class='lyTplArea'>"+
								 		"<select title='자격증/어학' id='ipSelect' name='testSel' class='ipSelect ipSelect_1' onchange='chkSch();'style='height: 60px; width: 110px; border-color: #DDDDDD;'>"+
								 			"<option disabled='disabled' display='' value='" + jsonObj.schoolType + "' " + (jsonObj.schoolType === '고등학교' ? 'selected' : '') + ">고등학교</option>"+
								 			"<option disabled='disabled' value='" + jsonObj.schoolType + "' " + (jsonObj.schoolType === '대학(2,3년)' ? 'selected' : '') + ">대학교(2,3년)</option>"+
								 			"<option disabled='disabled' value='" + jsonObj.schoolType + "' " + (jsonObj.schoolType === '대학교(4년)' ? 'selected' : '') + ">대학교(4년)</option>"+
								 			"<option disabled='disabled' value='" + jsonObj.schoolType + "' " + (jsonObj.schoolType === '대학원(석사)' ? 'selected' : '') + ">대학원(석사)</option>"+
								 			"<option disabled='disabled' value='" + jsonObj.schoolType + "' " + (jsonObj.schoolType === '대학원(박사)' ? 'selected' : '') + ">대학원(박사)</option>"+
								 		"</select>"+
								 	"</div>"+
								 	"</div>"+
								 	"<div class='input input-education-name is-label is-ellipsis  is-value' id=''>"+
								 		"<label for='UnivSchool_Schl_Name_c4'>학교명 <span class='star'>*</span></label>"+
								 		"<input type='text' readonly='readonly' value='"+jsonObj.schoolName+"' autocomplete='off' maxlength='50'/>"+
								 	"</div>"+
								 	"<div class='input input-certificate-agency is-label is-value'>"+
								 		"<label>재학기간 <span class='star'>*</span></label>"+
								 		"<input type='text' readonly='readonly' value='"+jsonObj.period+"' maxlength='15' oninput='formatDateEdu(this)'/>"+
								 	"</div>"+
								 	"<div class='input input-education-enddate is-label is-value' id='gpaDiv' style='" + (jsonObj.schoolType === '고등학교' ? 'display:none;' : '') + "'>"+
								 		"<label>학점 <span class='star'>*</span></label> <input type='text' id='gpa1' value='"+jsonObj.gpa+"' readonly='readonly' name='testRead' maxlength='4' placeholder=''/>"+
								 	"</div>"+
								 	"<div class='row' id='majorDiv' style='width:455px;" + (jsonObj.schoolType === '고등학교' ? 'visibility:hidden;' : '') + "'>"+
								 		"<div class='input input-education-major-name search is-label is-value'>"+
								 			"<label style='" + (jsonObj.schoolType === '고등학교' ? 'visibility:hidden;' : '') + "'>전공명</label> <input type='text' id='maj1' readonly='readonly' value='"+jsonObj.major+"' autocomplete='off' maxlength='50'/>"+
								 		"</div>"+
								 	"</div>"+
								 	"<a href='http://localhost/prj2/project_user/4.resume/CLSE_delete.jsp?num="+jsonObj.num+"'>"+
									 	"<button type='button'style='height: 30px; width: 60px; border: 1px solid #999999; margin-top: 20px; margin-bottom: 20px;'class='minusEdu'><span style=''>삭제</span></button>"+
									 "</a>"+
								"</div>"
					
						
					
					});//each
				}else{
					eduView="<div style='color : red'>조회된 결과가 없습니다</div>"
				}//end else
				
				$("#eduDiv:last").append(eduView);
			}
		});//ajax
		
		
		
		
		
		 
});//ready
	

//undefined 처리할 때 보면 좋을 거 같아서 주석 처리
/* $(function () {
    var x = $('input[name=testRead]').val();
	
    if(x == undefined){
    	$("[name=testRead]").prop("readonly", true);
    }
    
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
<%
request.setCharacterEncoding("UTF-8");
%>
<%
int rNum = Integer.parseInt(request.getParameter("rNum"));
System.out.println(rNum);
ResumeModifyDAO rmDAO=new ResumeModifyDAO();
ResumeDataVO rdVO= null;
try{
	rdVO = rmDAO.selectResumeData(rNum);
	if(rdVO != null){ // 객체 생성 / 성공
		System.out.println("회원 객체 성공");
	}
}catch(SQLException se){
	se.printStackTrace();
}//end catch

//복호화한 값들 VO에 저장 (이름, 이메일, 휴대폰번호, 주소)
DataDecrypt dd=new DataDecrypt("FsRt4SfY4US0IWtK4JPJsw==");
rdVO.setName(dd.decryption(rdVO.getName()));
rdVO.setEmail(dd.decryption(rdVO.getEmail()));
rdVO.setTel(dd.decryption(rdVO.getTel()));
rdVO.setAddr(dd.decryption(rdVO.getAddr()));

//보여주기 위해 scope 객체에 저장 (유저 테이블)
pageContext.setAttribute("name", rdVO.getName());
pageContext.setAttribute("email", rdVO.getEmail());
pageContext.setAttribute("tel", rdVO.getTel());
pageContext.setAttribute("addr", rdVO.getAddr());
pageContext.setAttribute("birthDate", rdVO.getBirthDate());
pageContext.setAttribute("gender", rdVO.getGender());
pageContext.setAttribute("imageFileInput", rdVO.getImg()); 

//보여주기 위해 scope 객체에 저장 (회원 테이블)
pageContext.setAttribute("title", rdVO.getTitle());
pageContext.setAttribute("job", rdVO.getJob());
pageContext.setAttribute("career", rdVO.getCareer());
pageContext.setAttribute("empform", rdVO.getEmpform());
pageContext.setAttribute("sal", rdVO.getSal());
pageContext.setAttribute("area", rdVO.getArea());
  
// 이력서 번호
pageContext.setAttribute("rNum", rNum);
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
					
		<!-- 폼태그 -->
		<form method="post" name="postFrm" enctype="multipart/form-data" id="userFrm"
				action="resume_modify_process.jsp?rNum=${ rNum }">
			<div class="resumeWrapper">
				<div class="resumeContainer">
					<div class="formWrap formWrapProfile">
						<h2 style="font-size: 50px; font-style: bold; text-align: center;
									margin-bottom: 30px; color: #144280">
							이력서 수정
						</h2>
					</div>
					<!-- 제목 -->
					<div class="resumeTitle">
						<input type="text" maxlength="100"
							placeholder="HTML로 프로그래밍 하는거 좋아합니다." value="${ title }" id="title"
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
										readonly="readonly" type="text" name="name" id="name" value="${ name }">
								</div>
								<!-- 인적사항(생년월일) -->
								<div class="input is-label input-profile-birth is-value">
									<label>생년월일 <span class="star">*</span></label> <input
										readonly="readonly" oninput="birthValidation(this)" id="birthDate" name="birthDate" type="text" maxlength="10" value="${birthDate }">
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
											<option value="m" ${gender eq "m" ? 'selected' : ' ' }>남자</option>
											<option value="f" ${gender eq "f" ? 'selected' : ' ' }>여자</option>
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
									<input type="hidden" name="hiddenImg" value="<%=rdVO.getImg() %>"/>
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
											<option value="신입" ${ career eq '신입'?'selected':''}>신입</option>
											<option value="1~3년" ${ career eq '1~3년'?'selected':''}>1~3년</option>
											<option value="4~6년" ${ career eq '4~6년'?'selected':''}>4~6년</option>
											<option value="7~9년" ${ career eq '7~9년'?'selected':''}>7~9년</option>
											<option value="10~15년" ${ career eq '10~15년'?'selected':''}>10~15년</option>
											<option value="16~20년" ${ career eq '16~20년'?'selected':''}>16~20년</option>
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
												type="text" placeholder="웹개발 프로그래밍" value="${job }" name="job" id="job"
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
											<input type="text" id="sal" name="sal" value="${sal}" placeholder="3000만원" style="font-size: 20px; border: 0px solid #333;" oninput="salValidation(this)"> 
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
												<option value="정규직" ${ empform eq '정규직'?'selected':''}>정규직</option>
												<option value="계약직" ${ empform eq '계약직'?'selected':''}>계약직</option>
												<option value="인턴" ${ empform eq '인턴'?'selected':''}>인턴</option>
												<option value="파견직" ${ empform eq '파견직'?'selected':''}>파견직</option>
												<option value="도급" ${ empform eq '도급'?'selected':''}>도급</option>
												<option value="프리랜서" ${ empform eq '프리랜서'?'selected':''}>프리랜서</option>
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
												<option value="서울특별시" ${ area eq '서울특별시'?'selected':''}>서울특별시</option>
												<option value="경기도" ${ area eq '경기도'?'selected':''}>경기도</option>
												<option value="인천광역시" ${ area eq '인천광역시'?'selected':''}>인천광역시</option>
												<option value="대전광역시" ${ area eq '대전광역시'?'selected':''}>대전광역시</option>
												<option value="세종특별자치시" ${ area eq '세종특별자치시'?'selected':''}>세종특별자치시</option>
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
			<div class="form formHopework" id="skillBtn">
				<!-- 클론스킬 -->
				<div id="skillDiv">
				
				</div>
				
				<button type="button"
							style="height: 30px; width: 60px; border: 1px solid #999999; margin-top: 20px; margin-bottom: 20px; margin-right: 20px;"
							id="addSkill">
							<span style="">+ 추가</span>
				</button>
			</div>
		</div>

		<!-- 자격증 -->
		<div class="formWrap formWrapHopework" id="">
			<h2 class="header">자격증</h2>
			<div class="form formHopework" id="CerBtn">
				<!-- 클론희망연봉 -->
				<div id="cerDiv">
				
				</div>
				 
				<button type="button"
					style="height: 30px; width: 60px; border: 1px solid #999999; margin-top: 20px; margin-bottom: 20px;"
					id="addCer"> 
					<span style="">+추가</span>
				</button>
				 
				
			</div>
		</div>
		
		

		<!-- 어학 -->
		<div class="formWrap formWrapHopework" id="">
			<h2 class="header">어학</h2>
			<div class="form formHopework" id="langBtn">
				<!-- 클론희망연봉 -->
				
				<div id="langDiv">
				
				</div>
				
				 
				<button type="button"
					style="height: 30px; width: 60px; border: 1px solid #999999; margin-top: 20px; margin-bottom: 20px;"
					id="addLang">
					<span style="">+추가</span>
				</button>
				 
				
			</div>
		</div>
		

		<!-- 학력 -->
		<div class="formWrap formWrapHopework" >

			<h2 class="header">학력</h2>
			<div class="form formEducation" >
				<div>
					<div class="container container1" id="eduBtn">
						<div>
							<div id="eduDiv">
							
							</div>
							
							<input type="hidden" value=" " name="major"/>
							<input type="hidden" value=" " name="gpa"/>
							
						 
							<button type="button"
								style="height: 35px; width: 60px; border: 1px solid #999999; margin-top: 20px; margin-bottom: 20px;"
								id="addEdu">
								<span style="">+추가</span>
							</button>
						 
						
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
	</div>
</body>
</html>