<%@page import="kr.co.sist.admin.vo.ModifyAdVO"%>
<%@page import="java.sql.SQLException"%>
<%@page import="kr.co.sist.admin.dao.JobAdDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ include file="check_login.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>채용공고 수정</title>
<style type="text/css">
* {
	box-sizing:border-box; 
	margin: 0;
	padding: 0;
}

#header {
	background-color: #323743;	
	width: 100%;
	height: 220px;
	padding-right: 13%;
	padding-left: 13%;
}

#innerBar {
	text-align: right;
	padding-top: 10px;
	padding-right: 5%;
}

#titlee {
	color: white;
	margin-bottom: 40px;
}

#info {
	padding-left: 5%;
}

#container {
	background-color: #f7f7f7;
	width: 100%;
	min-height: 1700px;
	text-align: left;
	padding-top: 50px;
	padding-right: 25%;
	padding-left: 25%;
}

#recruitTitle {
	margin-bottom: 60px;
}

#careerr {
	float: left;
}

#ftitle {
	color: #f1f1f1;
	font-size: 30px;
	padding-bottom: 10px;
	font-weight: bolder;
}

#cond1, #cond3, #time1 {
	float: left;
}

.titles {
	font-size: 25px;
	font-weight: bold;
	padding-bottom: 8px;
}

h1 {
	display: inline;
	padding-left: 5%;
}

h2 {
	display: inline;
	font-weight: normal;
	color: white;
}

#tinput {
	margin-top: 10px;
	margin-bottom: 20px;
	width: 500px;
	height: 50px;
	padding: 5px 30px 5px 10px;
  	border-radius: 4px;
	border: 1px solid #999999;
}

#app, #eduu, #cond, #time, #detail, #field, #people, #corpName {
	margin-bottom: 60px;
}

#detailtxt {
	width: 955px;
	height: 50px;
	margin-top: 10px;
	margin-bottom: 20px;
	padding: 5px 30px 5px 10px;
  	border-radius: 4px;
	border: 1px solid #999999; 
}

#modifyBtn {
	display :inline-block;
	width: 150px;
	height: 50px;
	background-color: #2c3250;
	color: white;
	border: none;
	margin-right: 30px;
	font-size: 18px;
	font-weight: bold;
}

#cancelBtn {
	display :inline-block;
	width: 150px;
	height: 50px;
	background-color: #5e5e5e;
	color: white;
	border: none;
	font-size: 18px;
	font-weight: bold;
}

select::-ms-expand { 
	display: none;
}

.selectL {
	margin-top: 10px;
	margin-right: 150px;
  	width: 400px;
  	height: 50px;
  	padding: 5px 30px 5px 10px;
  	border-radius: 4px;
	border: 1px solid #999999; 
}

.selectR {
	margin-top: 10px;
  	width: 400px;
  	height: 50px;
  	padding: 5px 30px 5px 10px;
  	border-radius: 4px;
	border: 1px solid #999999; 
}

.p {
	margin-top: 10px;
}

.contxtL {
	width: 400px;
	height: 50px;
	margin-top: 10px;
	margin-bottom: 20px;
	margin-right: 150px;
	padding: 5px 30px 5px 10px;
  	border-radius: 4px;
	border: 1px solid #999999; 
}

.contxtR {
	width: 400px;
	height: 50px;
	margin-top: 10px;
	margin-bottom: 20px;
	padding: 5px 30px 5px 10px;
  	border-radius: 4px;
	border: 1px solid #999999; 
}

.find-btn {
	text-align: center;
	margin-bottom: 50px;
}

#detailtitles {
	display: inline;
	font-size: 25px;
	font-weight: bold;
	padding-bottom: 8px;
	margin-right: 20px;
}

#detailbtn {
	background-color: #5e5e5e;
	color: white;
	width: 150px;
	height: 30px;
	border: none;
}

#detailbtn:hover {
	cursor: pointer;
}

#field {
	float: left;
}

#corpbtn {
	background-color: #5e5e5e;
	color: white;
	width: 100px;
	height: 30px;
	border: none;
	margin-left: 20px;
}

#corpbtn, #modify, #cancel:hover {
	cursor: pointer;
}


.input-file-button{
  padding: 6px 20px;
  background-color:#3a405d;
  border-radius: 4px;
  color: white;
  cursor: pointer;
  font-size: 15px;
}


#preview{
max-width: 100%;
}

a { text-decoration-line: none; }
</style>

<!-- jQuery CDN 시작 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<!-- jQuery CDN 끝 -->

<script type="text/javascript">

$(function() {	
	
	//수정 버튼
	$("#modifyBtn").click(function() {
		
		
		if($("#title").val()==""){
			alert("공고 제목은 필수 입력입니다.");
			return;
		}//end if
		
		
		if($("#career").val()=="none"){
			alert("경력 사항은 필수 선택입니다.");
			return;
		}//end if
		
		if($("#education").val()=="none"){
			alert("학력 사항은 필수 선택입니다.");
			return;
		}//end if
		
		if($("#empform").val()=="none"){
			alert("고용 형태는 필수 선택입니다.");
			return;
		}//end if
		
		if($("#sal").val()==""){
			alert("연봉 항목은 필수 입력입니다.");
			return;
		}//end if
		
		if($("#sal").val()==""){
			alert("연봉 항목은 필수 입력입니다.");
			return;
		}//end if
		
		
		
		if($("#area").val()=="none"){
			alert("지역 항목은 필수 선택입니다.");
			return;
		}//end if
		
		if($("#workHours").val()==""){
			alert("근무 시간은 필수 입력입니다.");
			return;
		}//end if
		
		if($("#startDate").val()==""){
			alert("공고 시작일은 필수 입력입니다.");
			return;
		}//end if
		
		if($("#endDate").val()==""){
			alert("공고 마감일은 필수 입력입니다.");
			return;
		}//end if
		
		
		//시작일자 마감일자 비교
		if (validateDates()) {
			alert("마감일은 시작일보다 빠를 수 없습니다. 입력 날짜를 확인해주세요.");
		    return;
		  }//end if
		
		
		
		if($("#recruitField").val()==""){
			alert("모집 분야는 필수 입력입니다.");
			return;
		}//end if
		
		
		if($("#recruitPeople").val()==""){
			alert("모집 인원 수는 필수 입력입니다.");
			return;
		}//end if
		
		
		
		// 숫자만 입력되도록 유효성 검사
		  var numRegEx = /^[0-9]+$/; // 숫자만을 위한 정규식
		  var inputVal = $("#recruitPeople").val(); // 입력된 값

		  // 숫자가 아닌 다른 문자가 입력된 경우
		  if (!numRegEx.test(inputVal)) {
		    alert("숫자만 입력 가능합니다.");
		    $("#recruitPeople").val(""); // 입력된 값을 초기화
		    $("#recruitPeople").focus();
		    
		    return;
		  }//end if
		
		  
		  
		  if($("#description").val()==""){
				alert("상세 요강은 첨부파일로 반드시 등록해야 합니다.");
				return;
			}//end if
		  
		  
		
		
		$("#recruitAdMod").submit(); //수정 버튼을 누르면 처리 페이지로 이동하기
		
	});// click
	

	
	//취소 버튼
	$("#cancelBtn").click(function() {
		
		if (confirm("정말로 취소하시겠습니까?")) {
		    // 확인 버튼 클릭 시 실행될 코드
		    location.href="http://localhost/prj2/project_admin/3.recruitAdmin/job_posting.jsp";
		  }//end if 
		  
	});// click
	
	
	
	//첨부파일 버튼 누르면 파일명을 얻고 이미지 미리보기
	  $('#file').on('change', function() {
          var fileName = $(this).val().split('\\').pop();
          $('#description').val(fileName);

          var reader = new FileReader();
          reader.onload = function (e) {
            $('#previewDiv').html('<img src="' + e.target.result + '">');
          }
          reader.readAsDataURL(this.files[0]);
               
        });
	
	
	// 유효성 체크 함수
	  function validateDates() {
	    var startDate = new Date($("#startDate").val());
	    var endDate = new Date($("#endDate").val());

	    if (startDate > endDate) {
	      return true;
	    }else{
	    	return false;
	    }

	  }//validateDates
		
	
	
	
	
});// ready
</script>

</head>
<body>
<div id="wrap">
	<div id="header">
		<div id="innerBar">
			<p><a style="color: #f1f1f1" href="http://localhost/prj2/project_admin/1.mainAdmin/main.jsp">메인 페이지</a></p>
		</div>
		<div id="titlee">
			<h1>DEVPLANET </h1> 
			<h2 class="h2">채용공고 수정</h2>
		</div>
		<div id="info">
			<p id="ftitle">채용공고 수정</p>
			<p style="color: #f1f1f1">채용공고를 수정할 수 있습니다.</p>
		</div>
	</div>
	<hr/>
	
	<div id="container">
	
	
<%

	request.setCharacterEncoding("UTF-8");	

	//공고번호 받아서 int로 처리 - 공고번호가 없으면 예외 발생할 것 < 처리 필요함
	String jobNumStr = request.getParameter("jobNum");
	int jobNum = Integer.parseInt(jobNumStr);
	
	
	ModifyAdVO mVO = null;
	
	JobAdDAO jDAO = new JobAdDAO();
	
	try{
		//DB에서 select해서 값 보여주기
		mVO = jDAO.selectAdContent(jobNum);
		
		
	}catch(SQLException se){
		se.printStackTrace();
		
		%>	
		<script>
			alert("서버에 문제 발생! 잠시 후 다시 시도해주세요.");
			location.href="http://localhost/prj2/project_admin/1.mainAdmin/main.jsp";
		</script>
		
		<%	
		
		
	}//end catch
	
	
		if(mVO==null){ //셀렉에 실패하면
%>	
			<script>
			alert("서버에 문제 발생! 잠시 후 다시 시도해주세요.");
			location.href="http://localhost/prj2/project_admin/3.recruitAdmin/job_posting.jsp";
		</script>
			
<%	
		}else{
			
			request.setAttribute("mVO", mVO);
			
		}//end else
		
%>

		<form action="http://localhost/prj2/project_admin/5.recruitAd/recruitmod_process.jsp" name="recruitAdMod" id="recruitAdMod" method="post"
		enctype="multipart/form-data">
		<input type="hidden" id="jobNum" name="jobNum" value="${mVO.jobNum}">
		<div id="corpName">
			<p class="titles">기업명</p>
			<input type="hidden" value="${mVO.cName}"/>
			<p class="p"><c:out value="${mVO.cName}"/></p>
		</div>
		<div id="recruitTitle">
			<p class="titles">채용공고 제목</p>
			<input type="text" id="title" name = "title" class="contxtR" value="<c:out value="${mVO.title}"/>" style="color:#333"/>
		</div>
		<div id="app">
			<p class="titles">지원자격</p>
			<div id="careerr">
				<p class="p">경력</p>
				<select class="selectL" id="career" name="career" >
					<option value="none">==선택==</option>
					<option value="신입" selected="${mVO.career eq '신입'}">신입</option>
					<option value="1~3년" selected="${mVO.career eq '1~3년'}">1~3년</option>
					<option value="4~6년" selected="${mVO.career eq '4~6년'}">4~6년</option>
					<option value="7~9년" selected="${mVO.career eq '7~9년'}">7~9년</option>
					<option value="10년 이상" selected="${mVO.career eq '10년 이상'}">10년 이상</option>
				</select>
			</div>
			<div id="eduu">
				<p class="p">학력</p>
				<select class="selectR" id="education" name="education">
					<option value="none">==선택==</option>
					<option value="대학교졸업(4년)" selected="${mVO.education eq '대학교졸업(4년)'}">대학교졸업(4년)</option>
						<option value="대학졸업(2,3년)" selected="${mVO.education eq '대학졸업(2,3년)'}">대학졸업(2,3년)</option>
					<option value="대학원 석사졸업" selected="${mVO.education eq '대학원 석사졸업'}">대학원 석사졸업</option>
					<option value="대학원 박사졸업" selected="${mVO.education eq '대학원 박사졸업'}">대학원 박사졸업</option>
					<option value="고등학교 졸업" selected="${mVO.education eq '고등학교 졸업'}">고등학교 졸업</option>
					<option value="학력무관" selected="${mVO.education eq '학력무관'}">학력무관</option>
					
				</select>
			</div>
			
		</div>
		<div id="cond">
			<p class="titles">근무조건</p>
			<div id="cond1">
				<p class="p">고용형태</p>
				<select class="selectL" id="empform" name="empform">
					<option value="none">==선택==</option>
				<option value="정규직" selected="${empform eq '정규직'}">정규직</option>
				<option value="계약직" selected="${empform eq '계약직'}">계약직</option>
				<option value="인턴" selected="${empform eq '인턴'}">인턴</option>
				<option value="파견직" selected="${empform eq '파견직'}">파견직</option>
				<option value="도급" selected="${empform eq '도급'}">도급</option>
				<option value="프리랜서" selected="${empform eq '프리랜서'}">프리랜서</option>


				</select>
			</div>
			<div id="cond2">
				<p class="p">연봉</p>
				<input type="text" class="contxtR" id="sal" name="sal" value="<c:out value="${mVO.sal}"/>"/>
			</div>
			<div id="cond3">
				<p class="p">지역</p>
				<select class="selectL" id="area" name="area">
					<option value="none">==선택==</option>
					<option value="서울특별시" selected="${area eq '서울특별시'}">서울특별시</option>
					<option value="경기도" selected="${area eq '경기도'}">경기도</option>
					<option value="성남시 분당구" selected="${area eq '성남시 분당구'}">성남시 분당구</option>
					<option value="서울특별시 강남구" selected="${area eq '서울특별시 강남구'}">서울특별시 강남구</option>
				</select>
			</div>
			<div id="cond4">
				<p class="p">근무요일 및 시간</p>
				<input type="text" class="contxtR" id="workHours" name="workHours" value="<c:out value="${mVO.workHours}"/>"/>
			</div>
			
		</div>
		<div id="time">
			<p class="titles">접수기간</p>
			<div id="time1">
				<p class="p">시작일</p>
				<input type="date" class="contxtL" id="startDate" name="startDate" value="<c:out value="${mVO.startDate}"/>"/>
			</div>
			<div id="time2">
				<p class="p">마감일</p>
				<input type="date" class="contxtR" id="endDate" name="endDate" value="<c:out value="${mVO.endDate}"/>"/>
			</div>
		</div>
		<div id="field">
			<p class="titles">모집분야</p>
			<input type="text" class="contxtL" id="recruitField" name="recruitField" value="<c:out value="${mVO.recruitField}"/>"/>
		</div>
		<div id="people">
			<p class="titles">모집인원</p>
			<input type="text" class="contxtR" id="recruitPeople" name="recruitPeople" value="<c:out value="${mVO.recruitPeople}"/>"/>
		</div>
		<div id="detail">
			<p id="detailtitles">상세요강</p>
			<label class="input-file-button" for="file">첨부파일</label>
     		 <input type="file" id="file" name="file" style="display:none"/>
			<p class="p">주요 업무, 자격 사항, 사용하고 있는 기술 스택, 우대사항, 혜택 및 복지, 기타 사항 등의 내용을 넣어 작성해주세요.</p>
			<input type="text" class="contxtR" id="description" readonly="readonly" name="description" value="<c:out value="${mVO.description}"/>"/>
			<input type="hidden" class="contxtR" id="descriptionHidden" readonly="readonly" name="descriptionHidden" value="<c:out value="${mVO.description}"/>"/>
			
			 <div id="previewDiv">
			 	<img id="preview" src="http://localhost/prj2/upload/${mVO.description}">
			 </div>
		</div>
		
		<div class="find-btn">
			<input type="button" id="modifyBtn" value="수정"/>
			<input type="button" id="cancelBtn" value="취소"/>
		</div>
		</form>
	</div>


</div>
</body>
</html>