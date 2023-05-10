<%@page import="kr.co.sist.admin.vo.JobAdNewVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="check_login.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>recruit</title>
<style type="text/css">
* {
	box-sizing:border-box; 
	margin: 0;
	padding: 0;
}

/* #header, #container, #container1 원래는 100%. */
#header {
	background-color: #323743;	
	width: 2000px;
	height: 220px;
	padding-right: 13%;
	padding-left: 13%;
}

#innerBar {
	text-align: right;
	padding-top: 10px;
	padding-right: 20px;
	padding-right: 10%;
	padding-left: 10%;
}

#title #mainTitle {
	color: white;
	margin-bottom: 40px;
}

#info {
	padding-left: 5%;
}

#container {
	background-color: #f7f7f7;
	width: 2000px;
	height: 100%;
	text-align: left;
	padding-top: 50px;
	padding-right: 25%;
	padding-left: 25%;
}

#container1 {
	background-color: #f7f7f7;
	width: 2000px;
	height: 100%;
	text-align: left;
	padding-top: 50px;
	padding-right: 25%;
	padding-left: 25%;
}

#recruitTitle {
	margin-bottom: 60px;
}

#careerCSS {
	float: left;
}

#ftitle {
	color: #f1f1f1;
	font-size: 30px;
	padding-bottom: 10px;
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
	color: white;
}

h2 {
	display: inline;
	font-weight: normal;
	color: #323232;
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

 #edu,#app, #cond, #time, #detail, #field, #people, #corpName {
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

#save {
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

#cancel {
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


.input-file-button{
  padding: 6px 20px;
  background-color:#3a405d;
  border-radius: 4px;
  color: white;
  cursor: pointer;
  font-size: 15px;
}

a { text-decoration-line: none; }
</style>

<!-- jQuery CDN 시작-->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<!-- jQuery CDN 끝-->

<script type="text/javascript">

//조회하기 버튼으로 등록되어있는 회사인지 확인 (search_process.jsp에서 select 메소드로 회사 조회 수행)
/* function btnClick(){ 
	frm.submit();
}; */


//등록된 기업명이면 숨겨진 div 보여주기 (입력 양식 노출)
$(function(){
	
	
	//조회하기 버튼을 눌렀을 때
	$("#corpBtn").click(function() {
		$("#frm").submit();
	});//click
	
	
	//플래그가 엠티가 아니면
	if(${not empty param.flag}){
		$("#container1").fadeIn(1000);
		
	}//end if
	
	$('#file').on('change', function() {
        var fileName = $(this).val().split('\\').pop(); //개발자 모집.jpg
        $('#description').val(fileName);

      });
	
});//ready


$(function(){ 
	
 	$("#save").click(function(){
		
	if($("#title").val()==""){
		alert("채용공고 제목을 입력해주세요.");
		return;
	}//end if
	
	if($("#career").val()==null){
		alert("경력 사항을 선택해주세요.");
		return;
	}//end if
	
	if($("#education").val()==null){
		alert("학력 사항을 선택해주세요.");
		return;
	}//end if
	
	if($("#empform").val()==null){
		alert("고용형태 사항을 선택해주세요.");
		return;
	}//end if
	
	if($("#sal").val()==""){
		alert("연봉을 입력해주세요.");
		return;
	}//end if
	
	if($("#area").val()==null){
		alert("지역 사항을 선택해주세요.");
		return;
	}//end if
	
	if($("#workHours").val()==""){
		alert("근무요일 및 시간을 입력해주세요.");
		return;
	}//end if
	
	if($("#startDate").val()==""){
		alert("접수 시작일을 선택해주세요.");
		return;
	}//end if
	
	if($("#endDate").val()==""){
		alert("접수 마감일을 선택해주세요.");
		return;
	}//end if
	
	if( $("#startDate").val() > $("#endDate").val() ){
		alert("접수 시작일과 마감일을 다시 확인해주세요.");
		return;
	}//end if 
	
	if($("#recruitField").val()==""){
		alert("모집 분야를 입력해주세요.");
		return;
		
	}//end if
	
	var input = document.getElementById("recruitPeople").value;
	
	if (isNaN(input) || parseInt(input) != input) {
	    alert("모집인원은 숫자만 입력가능합니다.");
	    return; 
	}//end if
	
	if($("#recruitPeople").val()==""){
		alert("모집인원을 입력해주세요.");
		return;
	}//end if
	
	if($("#description").val()==""){
		alert("상세요강 첨부파일을 추가해주세요.");
		return;
	}//end if
	
	alert("완료!!")
	 $("#frm2").submit(); 
	
 	});//click   
	
});//ready 


</script>
<%
String company=request.getParameter("name");
pageContext.setAttribute("nameC", company);
%>


</head>
<body>
<div wrap="">
	<div id="header">
		<div id="innerBar">
			<p><a style="color: #f1f1f1" href="http://localhost/prj2/project_admin/1.mainAdmin/main.jsp">메인 페이지</a></p>
		</div>
		<div id="mainTitle">
			<h1>DEVPLANET </h1> 
			<h2 class="h2">채용공고 등록</h2>
		</div>
		<div id="info">
			<p id="ftitle">채용공고 등록</p>
			<p style="color: #f1f1f1">채용공고를 등록할 수 있습니다.</p>
		</div>
	</div>
	<hr/>
	
	<div id="container">
		<form id="frm" name="frm" action="http://localhost/prj2/project_admin/5.recruitAd/search_process.jsp">
		<div id="corpName">
			<p class="titles">기업명</p>
			<p class="p">채용공고를 등록하기 위해 기업명을 입력해주세요.</p>
			<br/>
			<input type="text" name="cName" id="" placeholder="ex)쌍용교육센터" value="${ nameC }" ${ nameC eq null?"":"readonly='readonly'" }
						style="width: 200px; height: 30px"/>
			<!-- <input type="button" value="조회하기" id="corpbtn" onClick="btnClick()"/> -->
			<input type="button" value="조회하기" id="corpBtn"/>
		</div>
		</form>
		</div>
	<div id="container1" style="display:none">
		<form id="frm2" name="frm2" method="post" action="http://localhost/prj2/project_admin/5.recruitAd/recruit_process.jsp" enctype="multipart/form-data">
		
		<input type="hidden" value="${ nameC }" name="company"> <!-- 히든이 유용한 이유.... -규미 -->
		<div id="recruitTitle">
			<p class="titles">채용공고 제목</p>
			<input type="text" id="title" name="title" placeholder="채용공고 제목을 입력해주세요." style="width: 330px; height: 30px"/>
		</div>
		<div id="app">
			<p class="titles">지원자격</p>
			<div id="careerCSS">
				<p class="p">경력</p>
				<select class="selectL" name="career" id="career">
					<option selected disabled>==선택==</option>
					<option>신입</option>
					<option>1~3년</option>
					<option>4~6년</option>
					<option>7~9년</option>
					<option>10년 이상</option>
				</select>
			</div>
			<div id="edu">
				<p class="p">학력</p>
				<select class="selectR" name="education" id="education">
					<option selected disabled>==선택==</option>
					<option>대학교졸업(4년)</option>
					<option>대학졸업(2,3년)</option>
					<option>대학원 석사졸업</option>
					<option>대학원 박사졸업</option>
					<option>고등학교 졸업</option>
					<option>학력무관</option>
				</select>
			</div>
			
		</div>
		<div id="cond">
			<p class="titles">근무조건</p>
			<div id="cond1">
				<p class="p">고용형태</p>
				<select class="selectL" name="empform" id="empform">
					<option selected disabled>==선택==</option>
					<option>정규직</option>
					<option>계약직</option>
					<option>인턴</option>
					<option>파견직</option>
					<option>도급</option>
					<option>프리랜서</option>
				</select>
			</div>
			<div id="cond2">
				<p class="p">연봉</p>
				<input type="text" class="contxtR" placeholder="회사 내규에 따름" name="sal" id="sal"/>
			</div>
			<div id="cond3">
				<p class="p">지역</p>
				<select class="selectL" name="area" id="area">
					<option selected disabled>==선택==</option>
					<option>서울특별시</option>
					<option>경기도</option>
					<option>성남시 분당구</option>
					<option>서울특별시 강남구</option>
				</select>
			</div>
			<div id="cond4">
				<p class="p">근무요일 및 시간</p>
				<input type="text" class="contxtR" placeholder="주5일(월~금) | 09:00~18:00" name="workHours" id="workHours"/>
			</div>
			
		</div>
		<div id="time">
			<p class="titles">접수기간</p>
			<div id="time1">
				<p class="p">시작일</p>
				<input type="date" class="contxtL" name="startDate" id="startDate"/>
			</div>
			<div id="time2">
				<p class="p">마감일</p>
				<input type="date" class="contxtR" name="endDate" id="endDate"/>
			</div>
		</div>
		<div id="field">
			<p class="titles">모집분야</p>
			<input type="text" class="contxtL" placeholder="백엔드 개발자" name="recruitField" id="recruitField"/>
		</div>
		<div id="people">
			<p class="titles">모집인원</p>
			<input type="text" class="contxtR" placeholder="OO명" name="recruitPeople" id="recruitPeople"/>
		</div>
		<div id="detail">
			<p id="detailtitles">상세요강</p>
			
		<!-- 	<input type="button" value="첨부파일 불러오기" id="detailbtn"/>
			<p class="p">주요 업무, 자격 사항, 사용하고 있는 기술 스택, 우대사항, 혜택 및 복지, 기타 사항 등의 내용을 넣어 작성해주세요.</p>
			<input type="file" placeholder="java 개발자 모집 공고.jpg" name="file"/>
			<input type="text" id="detailtxt" placeholder="java 개발자 모집 공고.jpg" name="decription"/>
		
		 -->
		<label class="input-file-button" for="file" id="detailbtn">첨부파일</label>
     		 <input type="file" id="file" name="file" hidden="true"/>
			<p class="p">주요 업무, 자격 사항, 사용하고 있는 기술 스택, 우대사항, 혜택 및 복지, 기타 사항 등의 내용을 넣어 작성해주세요.</p>
			<input type="text" class="contxtR" id="description" readonly="readonly" name="description"/>
		</div>
		
			
		<div class="find-btn">
			<input type="button" id="save" value="저장"/>
			<a href="http://localhost/prj2/project_admin/3.recruitAdmin/job_posting.jsp"><input type="button" id="cancel" value="취소"/></a>
		</div>
		</form>
	</div>
</div>
</body>
</html>