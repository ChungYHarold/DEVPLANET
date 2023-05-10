<%@page import="kr.co.sist.admin.dao.AdminDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="check_login.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>mainAd</title>
<style type="text/css">
* {
	box-sizing:border-box;
	margin: 0;
	padding: 0;
}

#header {
	width: 100%;
	height: 170px;
	background-color: #323743;	
	padding-right: 15%;
	padding-left: 15%;
}

#logo {
	margin: 0 auto;
	color: white;
	font-weight: bolder;
	font-size: 30px;
	margin-top: 10px;
	margin-left: 20px;
	float: left;
}


#logout {
	color: white;
	text-align: right;
	margin-right: 20px;
	padding-top: 10px;
}

#navi {
	position: relative;
	width: 100%;
	height: 90px;
	bottom: 0px;
	margin-left: 20px;
}

select::-ms-expand { 
	display: none;
}

.select {
	position: absolute;
    margin-top: 10px;
    bottom: 0px;
  	width: 150px;
	height: 35px;
  	padding: 5px 30px 5px 10px;
  	border-radius: 4px;
	border: 1px solid #999999; 
}

#btn {
	position: absolute;
	bottom: 0px;
	margin-left: 200px;
	width: 130px;
	height: 35px;
	background-color: #3498db;
	color: white;
	border: none;
}

#btn:hover {
	cursor: pointer;
}

#container {
	background-color: #f7f7f7;
	width: 100%;
	height: 900px;	
}

#main {
	padding-top: 50px;
	padding-right: 15%;
	padding-left: 15%;
	height: 700px;
}

#user {
	text-align: left;
	padding-left: 13%;
	margin-top: 30px;
	margin-right: 30px;
	margin-left: 30px;
	margin-bottom: 50px;
}

#comp {
	text-align: left;
	padding-left: 13%;
	margin-top: 30px;
	margin-right: 30px;
	margin-left: 30px;
	margin-bottom: 30px;
}

h1 {
	text-align: center;
	margin-bottom: 30px;
	padding-top: 10px;
	padding-bottom: 10px;
}

h2 {
	font-weight: normal;
	margin-bottom: 20px;
}

.user1 {
	float: left;
	width: 257px;
}

.user2 {
	float: left;
	width: 257px;
}

.user3 {
	float: left;
	width: 257px;
}

.comp1 {
	float: left;
	width: 257px;
}

.comp2 {
	float: left;
	width: 300px;
}

#all {
	float: left;
	width: 200px;
	height: 90px;
	padding-top: 20px;
	padding-left: 20px;
	background-color: white;
}

.img {
	float: left;
	width: 96px;
	height: 96px;
}

.cnt {
	font-size: 40px;
	font-weight: bolder;
	margin-left: 100px;
	padding-left: 10px;
}

.cntlabel {
	font-size: 20px;
	margin-left: 100px;
	padding-left: 10px;
}

a { text-decoration-line: none; }
</style>

<!-- jQuery CDN 시작 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<!-- jQuery CDN 끝 -->

<script type="text/javascript">
$(function() {
	$("#btn").click(function() {
		location.href="http://localhost/prj2/project_admin/6.memberAdmin/member_manage.jsp";
	});// click
	
	$("#logout").click(function() {
		if(confirm("로그아웃 하시겠습니까?")) {
			location.href="http://localhost/prj2/project_admin/1.mainAdmin/adminLogin.jsp";
		} else {
			location.reload();
		}
	});
});// ready
</script>

</head>

<body>
<div id="wrap">	
	<div id="header">
		<p id="logo">DEVPLANET</p>
		<a href="#" id="logout"><p id="logout">로그아웃</p></a> <br/>
		<div id="navi">
    		<select class="select" onchange="if(this.value) location.href=(this.value);">
        		<option>==선택==</option>
        		<option value="http://localhost/prj2/project_admin/2.corpInfo/company_info.jsp">기업 정보 관리</option>
        		<option value="http://localhost/prj2/project_admin/5.recruitAd/recruit.jsp">채용 공고 등록</option>
        		<option value="http://localhost/prj2/project_admin/3.recruitAdmin/job_posting.jsp">채용 공고 관리</option>
   			</select>
   			<input type="button" id="btn" value="회원관리" />
		</div>
	</div>

	<div id="container">
	<%
	AdminDAO aDAO = new AdminDAO();
	
	int joinCount = aDAO.selectCountJoin();
	int quitCount = aDAO.selectCountQuitUser();
	int resumeCount = aDAO.selectCountResume();
	int JobCount = aDAO.selectCountJobSeeker();
	
	int corpCount = aDAO.selectCountCorp();
	int adCount = aDAO.selectCountAd();
	
	int countAllUser = aDAO.selectCountAllUser();
	int countAllCorp = aDAO.selectCountAllCorp();
	int countAllJob = aDAO.selectCountAllJobSeeker();
	
	pageContext.setAttribute("joinCount", joinCount);
	pageContext.setAttribute("quitCount", quitCount);
	pageContext.setAttribute("resumeCount", resumeCount);
	pageContext.setAttribute("JobCount", JobCount);
	pageContext.setAttribute("corpCount", corpCount);
	pageContext.setAttribute("adCount", adCount);
	pageContext.setAttribute("countAllUser", countAllUser);
	pageContext.setAttribute("countAllCorp", countAllCorp);
	pageContext.setAttribute("countAllJob", countAllJob);
	
	%>
		<div id="main">
			<h1>오늘의 주요 현황</h1>
			<div id="user">
				<h2>개인 현황</h2>
				<div class="user1">
					<img src="http://localhost/prj2/project_admin/1.mainAdmin/images/user.PNG" alt="user Image" class="img">
					<p class="cnt">${ joinCount }</p> <br/>
					<p class="cntlabel">회원가입<p>
				</div>
				<div class="user2">
					<img src="http://localhost/prj2/project_admin/1.mainAdmin/images/user.PNG" alt="user Image" class="img">
					<p class="cnt">${ quitCount }</p> <br/>
					<p class="cntlabel">회원탈퇴<p>
				</div>
				<div class="user3">
					<img src="http://localhost/prj2/project_admin/1.mainAdmin/images/user.PNG" alt="user Image" class="img">
					<p class="cnt">${ resumeCount }</p> <br/>
					<p class="cntlabel">이력서등록<p>
				</div>
				<div class="user4">
					<img src="http://localhost/prj2/project_admin/1.mainAdmin/images/user.PNG" alt="user Image" class="img">
					<p class="cnt">${ JobCount }</p> <br/>
					<p class="cntlabel">구직자수</p>
				</div>
			</div>
			<div id="comp">
				<h2>기업 현황</h2>
				<div class="comp1">
					<img src="http://localhost/prj2/project_admin/1.mainAdmin/images/comp.PNG" alt="user Image" class="img">
					<p class="cnt">${ corpCount }</p> <br/>
					<p class="cntlabel">등록된 기업<p>
				</div>
				<div class="comp2">
					<img src="http://localhost/prj2/project_admin/1.mainAdmin/images/comp.PNG" alt="user Image" class="img">
					<p class="cnt">${ adCount }</p> <br/>
					<p class="cntlabel">등록된 공고<p>
				</div>
				<div id="all">
					<p>총 회원수 : <span>${ countAllUser }명</span></p>
					<p>총 기업수 : <span>${ countAllCorp }기업</span></p>
					<p>구직자 수 : <span>${ countAllJob }명</span></p>
				</div>
			</div>
		</div>
	</div>

	<div id="footer">
	</div>
</div>
</body>
</html>