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

#header {
	width: 100%;
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

#title {
	margin-bottom: 40px;
}

#info {
	padding-left: 5%;
}

#container {
	width: 100%;
	height: 100%;
	text-align: left;
	padding-top: 50px;
	padding-right: 25%;
	padding-left: 25%;
}

#container1 {
	width: 100%;
	height: 100%;
	text-align: left;
	padding-top: 50px;
	padding-right: 25%;
	padding-left: 25%;
}

#recruitTitle {
	margin-bottom: 60px;
}

#career {
	float: left;
}

#ftitle {
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

#app, #edu, #cond, #time, #detail, #field, #people, #corpName {
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

</style>
<!-- jQuery CDN 시작-->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<!-- jQuery CDN 끝-->
<script type="text/javascript">
$(function(){
	$("#corpbtn").click(function(){
		$("#container1").fadeIn(1000); //괄호안에ms 1000단위당 1초
	});
});
</script>
</head>
<body>
<div wrap="">
	<div id="header">
		<div id="innerBar">
			<p>메인 페이지</p>
		</div>
		<div id="title">
			<h1>DEVPLANET </h1> 
			<h2 class="h2">채용공고 등록</h2>
		</div>
		<div id="info">
			<p id="ftitle">채용공고 등록</p>
			<p>채용공고를 등록할 수 있습니다.</p>
		</div>
	</div>
	<hr/>
	
	<div id="container">
		<div id="corpName">
			<p class="titles">기업명</p>
			<p class="p">채용공고를 등록하기 위해 기업명을 입력해주세요.</p>
			<input type="text" id="tinput" placeholder="ex)쌍용교육센터"/>
			<input type="button" value="조회하기" id="corpbtn"/>
		</div>
		</div>
	<div id="container1" style="display:none">
		<div id="recruitTitle">
			<p class="titles">채용공고 제목</p>
			<input type="text" id="tinput" placeholder="SIST 온라인 마케팅 담당자 모집"/>
		</div>
		<div id="app">
			<p class="titles">지원자격</p>
			<div id="career">
				<p class="p">경력</p>
				<select class="selectL">
					<option>==선택==</option>
					<option>신입</option>
					<option>1~3년</option>
					<option>4~6년</option>
					<option>7~9년</option>
					<option>10년 이상</option>
				</select>
			</div>
			<div id="edu">
				<p class="p">학력</p>
				<select class="selectR">
					<option>==선택==</option>
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
				<select class="selectL">
					<option>==선택==</option>
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
				<input type="text" class="contxtR" placeholder="회사내규에 따름"/>
			</div>
			<div id="cond3">
				<p class="p">지역</p>
				<select class="selectL">
					<option>==선택==</option>
					<option>서울특별시</option>
					<option>경기도</option>
					<option>성남시 분당구</option>
					<option>서울특별시 강남구</option>
				</select>
			</div>
			<div id="cond4">
				<p class="p">근무요일 및 시간</p>
				<input type="text" class="contxtR" placeholder="주5일(월~금) | 09:00~18:00"/>
			</div>
			
		</div>
		<div id="time">
			<p class="titles">접수기간</p>
			<div id="time1">
				<p class="p">시작일</p>
				<input type="text" class="contxtL"/>
			</div>
			<div id="time2">
				<p class="p">마감일</p>
				<input type="text" class="contxtR"/>
			</div>
		</div>
		<div id="field">
			<p class="titles">모집분야</p>
			<input type="text" class="contxtL" placeholder="백엔드 개발자"/>
		</div>
		<div id="people">
			<p class="titles">모집인원</p>
			<input type="text" class="contxtR" placeholder="OO명"/>
		</div>
		<div id="detail">
			<p id="detailtitles">상세요강</p>
			<input type="button" value="첨부파일 불러오기" id="detailbtn"/>
			<p class="p">주요 업무, 자격 사항, 사용하고 있는 기술 스택, 우대사항, 혜택 및 복지, 기타 사항 등의 내용을 넣어 작성해주세요.</p>
			<input type="text" id="detailtxt" placeholder="java 개발자 모집 공고.jpg"/>
		</div>
		
		<div class="find-btn">
			<input type="button" id="save" value="저장"/>
			<input type="button" id="cancel" value="취소"/>
		</div>
	</div>
</div>
</body>
</html>