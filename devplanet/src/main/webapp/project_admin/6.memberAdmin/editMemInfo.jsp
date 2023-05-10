<%@page import="kr.co.sist.service.PlainService"%>
<%@page import="kr.co.sist.admin.vo.AdminUserVO"%>
<%@page import="kr.co.sist.admin.dao.AdminUserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="check_login.jsp" %>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">

<title>회원정보 수정</title>

<link rel="stylesheet" type="text/css" href="/include/css/ver_2/common.css?201909051400">
<link rel="stylesheet" type="text/css" href="/include/css/ver_2/footer_sub.css">

<link rel="stylesheet" type="text/css" href="/include/css/ver_1/gnb.css?20170124001">
<link rel="stylesheet" type="text/css" href="/include/css/ver_1/gnb_sub.css?20170317002">

<link rel="stylesheet" type="text/css" href="//i.jobkorea.kr/content/css/ver_2/member/mbr_common.css?date=202103121100">
<link rel="stylesheet" type="text/css" href="//i.jobkorea.kr/content/css/ver_2/member/mbr_tpl.css?date=202103121100">
<link rel="stylesheet" type="text/css" href="//i.jobkorea.kr/content/css/ver_2/member/mbr_style.css?date=202103121100">
<link rel="stylesheet" type="text/css" href="//i.jobkorea.kr/deploy/pc/dist/css/personal/layout/footer-sv-202301261521.css"> <!-- (JK-9495) PC Main Footer 변경 (2021.02.18) -->

<style>
#header {
    position: relative;
    background: url("")
}

button {
    overflow: visible;
    background: transparent;
    cursor: pointer;
        border: 0 none;
}

.mbrBtnCancel_1 {
    width: 88px;
    height: 49px;
    background-position: -708px 0;
}

.mbrTplDesc{
height:40px;
}

.mbrTplData2{
width:700; 
float:left;
}

.imgDiv{
/* border:1px solid #333; */
width:250; height:550;
float:right;
text-align: center;
}

.imageBox, #profile{
border:1px solid #333;
	width: 250px;
    height: 270px;
    background-size: contain;
    background-repeat: no-repeat;
    background-position: center;

}

.mbrTplData2 table, .mbrTplData2 table td {
   
    border-top: none;
    border-bottom: none;
    vertical-align: top;
    padding-left:0px;
    padding-right:50px;
}

tr{
height:135px;
}

td{
width:330px;

}

label{

font-size:20px;
font-weight:bold;
}

.text{
color:#666;	
margin-top:10px;
width:300px; height:35px;
border: 1px solid #999999; 
padding:8px;

}

#gnb{
position:relative;

}

#main_page{
position:absolute; left:850px;

}

#space{
height: 10px; width:100%;
}

.input-file-button{
  padding: 6px 20px;
  background-color:#3a405d;
  border-radius: 4px;
  color: white;
  cursor: pointer;
  font-size: 15px;
}

#file {
	display: none;
}

.policy-table th, td {
	border: none;
}

a { text-decoration-line: none; }
a:link { color : black; }
a:visited { color : black; }
a:hover { color : blue; } 
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

<script type="text/javascript">
$(function(){
	$("#modifyBtn").click(function(){
		
		if($("#name").val() == "") {
			alert("이름은 필수 입력입니다.");
			return;
		}// end if
		
		if($("#tel").val() == "") {
			alert("휴대폰 번호는 필수 입력입니다.");
			return;
		}// end if
		
		if($("#birthDate").val() == "") {
			alert("생년월일은 필수 입력입니다.");
			return;
		}// end if
		
		if($("#email").val() == "") {
			alert("이메일 주소는 필수 입력입니다.");
			return;
		}// end if
		
		const email = /\S+@\S+\.\S+/; // 이메일 검증용 정규식
		if(!email.test($("#email").val())) {
		  alert("유효한 이메일 주소를 입력해주세요.");
		  return;
		}
		
		if($("#zipcode").val() == "") {
			alert("이름은 필수 입력입니다.");
			return;
		}// end if
		
		if($("#detailAddr").val() == "") {
			alert("상세주소는 필수 입력입니다.");
			return;
		}// end if
		
		$("#frm").submit();
	});//click	
	
	$("#addrBtn").click(function() {
		findZip();
	});//kakao

});//ready

function addHyphen(input) {
	// 하이픈을 제외한 숫자만 추출합니다.
	var value = input.value.replace(/[^0-9]/g, '');

	// 추출한 숫자를 하이픈으로 구분합니다.
	var first = value.slice(0, 3);
	var second = value.slice(3, 7);
	var third = value.slice(7, 11);

	// 입력창에 하이픈을 추가하여 반영합니다.
	input.value = first + (second ? '-' + second : '') + (third ? '-' + third : '');
}
	
function img() {
	const imgUpload = document.getElementById("file");
	const imgDiv = document.getElementById("profile");

	var blockFlag = false;
	
	//이미지 선택 버튼에서 파일을 선택하면 이벤트가 발생합니다.
	imgUpload.addEventListener('change', function() {
  	
		// 선택한 파일이 이미지 파일인지 확인합니다.
  		if (this.files && this.files[0] && this.files[0].type.match('image.*')) {
    		const reader = new FileReader();
	
    		// 파일을 읽어서 이미지를 가져옵니다.
    		reader.addEventListener('load', function(e) {
      			const image = new Image();
     			image.src = e.target.result;
      	
      			// 이미지 크기 조절
     			image.width = 250;
      			image.height = 270;

      			// 이미지를 표시할 div에 추가합니다.
      			imgDiv.innerHTML = '';
      			imgDiv.appendChild(image);
    		});

    		reader.readAsDataURL(this.files[0]);
  		} else {
  			if (!blockFlag) {
  				blockFlag = true;
	  			alert("이미지 파일만 업로드 가능합니다. \n이미지를 선택해주세요.");
	  			blockFlag = false;
  			}
	  		return;
  		}// end else
	});
}// image
</script>

<body>
    <!--header//////////////////////////////////////////////////////////////////////////////////////////////  -->
   <div id="header">
	<div id="space"></div>
	<div class="gnbWrap gnbWrap_mMng">
		<div id="gnb">
	
			<!--// 개인회원 -->
			<h1><a class="logo" href="#void"><img alt="데브플래닛" src="http://localhost/prj2/project_admin/images/devplanet_logo.png"></a>
			<span class="bar"></span><span style="font-size:23px">&nbsp;회원정보 수정</span>
			</h1>
			<a id="main_page" href="http://localhost/prj2/project_admin/1.mainAdmin/main.jsp">메인페이지</a>
		</div>
	</div>
</div>


<div id="wrap">

	<!--// Contents Area -->
	<div id="container">
	
	<%
	String userId = request.getParameter("user_id");
	
	AdminUserDAO auDAO = new AdminUserDAO();
	AdminUserVO auVO = auDAO.selectUserInfo(userId);
	
	// 복호화
	PlainService ps = new PlainService();
	ps.selectEditUser(auVO);
	
	
	%>
		<div id="content">
			<h1 class="skip"><!-- 회원정보 수정 --></h1>
<!--폼태그 --><form action="http://localhost/prj2/project_admin/6.memberAdmin/edit_process.jsp?user_id=<%= userId %>" id="frm" name="frm" method="post" enctype="multipart/form-data">
				<div class="mbrSec mbrMngInfo">
					<h2 class="mbrHeading2"><span>기본정보 수정</span></h2>
					<div class="mbrTplDesc">
						<p>회원의 기본정보를 수정·확인할 수 있습니다.</p>
					</div>
<hr/>
					<div class="mbrTplData2">
					<br>
						<table summary="이 표는 회원정보 수정 입력폼입니다">
		<!--skip  -->		<caption><span class="skip"><!-- 회원정보 수정 입력폼 --></span></caption>
			
							<tbody>
							<tr >
								<td><label>이름</label><br>
								<input type="text" class="text" placeholder="회원가입 시 입력한 값" name="name" id="name" value="<%= auVO.getName() %>"></td>
								<td><label>아이디</label><br>
								<input type="text" class="text" readonly="readonly" placeholder="회원가입 시 입력한 값" name="id" id="id" value="<%= auVO.getId() %>"></td>
							</tr>
							<tr>
								<td ><label>휴대폰 번호</label><br>
								<input type="text" class="text" placeholder="회원가입 시 입력한 값" name="tel" id="tel" value="<%= auVO.getTel() %>" maxlength="13" oninput="addHyphen(this)"></td>
								<td ><label>생년월일</label><br>
								<input type="date" class="text" name="birthDate" id="birthDate" value="<%= auVO.getBirthDate() %>"></td>
							</tr>
							<tr>
								<td ><label>이메일 주소</label><br>
								<input type="text" class="text" placeholder="회원가입 시 입력한 값" name="email" id="email" value="<%= auVO.getEmail() %>"></td>
							</tr>
							<tr>
								<td><label>우편번호</label> <input type="button" value="주소검색" name="addBtn" id="addrBtn"><br>
								<input type="text" style="width:300px" class="text" placeholder="회원가입 시 입력한 값" name="zipcode" id="zipcode" value="<%= auVO.getZipcode() %>"></td>
								<td><label>상세주소</label><br>
								<input type="text" style="width:400px" class="text" placeholder="회원가입 시 입력한 값" name="addr" id="addr" value="<%= auVO.getAddr() %>"><br>
								<input type="text" class="text" style="width:400px" placeholder="회원가입 시 입력한 값" name="detailAddr" id="detailAddr" value="<%= auVO.getDetailAddr() %>"></td>
							</tr>
							</tbody>
						</table>
						</div>
						<div class="imgDiv">
						<br>
						<div id="profile">
							<img id="profile" src="http://localhost/prj2/upload/<%= auVO.getImg() %>" onerror="this.src='http://localhost/prj2/upload/no.png'"/>
						</div>
						<br/>
						<label class="input-file-button" for="file" onclick="img()">
  							변경
						</label>
						<input type="file" name="file" id="file" />	
						<input type="hidden" name="imgHidden" value="<%= auVO.getImg() %>"/>						
						</div>
					<p style="clear:both;"></p>
					
				</div>
				<br>
				<br>
				<br>
				<hr>
				<br>
				<p class="mbrBtnFunc" style="text-align:center">
					<span class="mbrBtn mbrBtnModify_1"><a id="modifyBtn" style="cursor:pointer;"><span>저장하기</span></a></span>
					<span class="mbrBtn mbrBtnCancel_1">
					<input type="button" id="cancelBtn" onclick="location.href='http://localhost/prj2/project_admin/6.memberAdmin/member_manage.jsp'"><span>취소</span></span>
				</p>
<!--폼태그 -->	</form>
		</div>
		<!-- <hr> -->
	<br>
	</div>
</div>
</body>
</html>