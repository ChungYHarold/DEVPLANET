<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 로그인</title>
<style type="text/css">
h1 {
	font-weight: normal;
	margin-bottom: 50px;
}

.wrap {
	min-height: 100vh;
	text-align: center;
}

.main {
	position: absolute;
  	left: 50%;
  	top: 40%;
  	transform: translate(-50%, -50%);
}

#id {
	margin-bottom: 10px;
	width: 300px;
	height: 50px;
}

#pw {
	margin-bottom: 20px;
	width: 300px;
	height: 50px;
}

#chk {
	margin-bottom: 20px;
}

#login {
	border: none;
	width: 220px;
	height: 35px;
	background-color: #3488dd;
	color: white;
}

#login:hover {
	cursor: pointer;
}
</style>

<!-- jQuery CDN 시작 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<!-- jQuery CDN 끝 -->

<script type="text/javascript">
$(function() {	
	$("#login").click(function() {
		if($("#id").val() == "") {
			alert("아이디는 필수 입력입니다.");
			return;
		}// end if
		
		if($("#pw").val() == "") {
			alert("비밀번호는 필수 입력입니다.");
			return;
		}// end if
		$("#loginFrm").submit();
	});// click
});// ready
</script>
</head>
<body>
<div class="wrap">
	<div class="main">
		<form action="adminLogin_Pro.jsp" method="post" id="loginFrm" name="loginFrm">
			<h1>admin</h1>
			<p>관리자 로그인 후 이용 가능합니다.</p>
			<input type="text" id="id" name="id" placeholder="아이디"/> <br/>
			<input type="password" id="pw" name="pw" placeholder="비밀번호"/> <br/>
			<input type="button" id="login" value="LOGIN"/>
		</form>
	</div>
</div>
</body>
</html>