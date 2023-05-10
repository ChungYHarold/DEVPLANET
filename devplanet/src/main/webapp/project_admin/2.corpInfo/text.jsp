<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>



<head>


<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>기업정보 등록</title>

  
  	<link rel="stylesheet" type="text/css" href="/include/css/ver_2/common.css?201909051400"/>
	<link rel="stylesheet" type="text/css" href="/include/css/ver_2/footer_sub.css">
	<link rel="stylesheet" type="text/css" href="/include/css/ver_1/gnb.css?20170124001"/>
	<link rel="stylesheet" type="text/css" href="/include/css/ver_1/gnb_sub.css?20170317002"/>
	<link rel="stylesheet" type="text/css" href="//i.jobkorea.kr/content/css/ver_2/member/mbr_common.css?date=202103121100"/>
	<link rel="stylesheet" type="text/css" href="//i.jobkorea.kr/content/css/ver_2/member/mbr_tpl.css?date=202103121100">
	<link rel="stylesheet" type="text/css" href="//i.jobkorea.kr/content/css/ver_2/member/mbr_style.css?date=202103121100">
	<link rel="stylesheet" type="text/css" href="//i.jobkorea.kr/deploy/pc/dist/css/personal/layout/footer-sv-202301261521.css"/> <!-- (JK-9495) PC Main Footer 변경 (2021.02.18) -->
  



<style>

.mbrBtnCancel_1 {
    width: 88px;
    height: 49px;
    background-position: -708px 0;
}

.mbrBtnOk_3 {
    width: 88px;
    height: 49px;
    background-position: -490px 0;
}


.mbrBtn, .mbrBtn button, .mbrBtn input, .mbrBtn a {
    display: inline-block;
}


#secMbr #content .mbrBtnFunc {
    margin-top: 38px;
    text-align: center;
}


button {
    overflow: visible;
    background: transparent;
    cursor: pointer;
        border: 0 none;
}


#header {
    position: relative;
    background: url("")
}




.mbrTplDesc{
height:40px;
}


.mbrTplData2{
width:700; 
float:left;
}


.imgDiv{
width:250; height:550;
float:right;
text-align: center;
}


.imageBox{
border:1px solid #333;
	width: 250px;
    height: 270px;
    background-image: url(http://211.63.89.133/pj3/project_admin/images/sistLogo.jpg);
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



</style>




<!-- jQuery CDN -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<!-- jQuery CDN -->


<script type="text/javascript">

$(function(){
	
	$("#okLink").click(function(){
	
		alert("등록버튼 눌림");
		alert("기업회원 등록 완료");
		alert("기업회원 현황 목록 페이지로 이동");
		
	});//click
	
	
});//ready




</script>








</head>
<body>
    <!--header//////////////////////////////////////////////////////////////////////////////////////////////  -->
<div id="header">
	<div id="space"></div>
	<div class="gnbWrap gnbWrap_mMng">
		<div id="gnb">
	
			<!--// 개인회원 -->
			<h1><a class="logo" href="#void"><img alt="데브플래닛" src="http://211.63.89.133/pj3/project_admin/images/devplanet_logo.png"></a>
			<span class="bar"></span><span style="font-size:23px">&nbsp;기업정보 등록</span>
			</h1>
			<a id="main_page" href="#void">메인페이지</a>
		</div>
	</div>
</div>


<div id="wrap">
	<!--// Contents Area -->
	<div id="container">
		<div id="content">
			<h1 class="skip"><!-- 회원정보 수정 --></h1>
<!--폼태그 --><form action="" name="frm" method="post">
				<div class="mbrSec mbrMngInfo">
					<h2 class="mbrHeading2"><span>기본정보 등록</span></h2>
					<div class="mbrTplDesc">
						<p>기업의 기본정보를 등록합니다.</p>
					</div>
<hr/>
					<div class="mbrTplData2">
					<br>
						<table summary="이 표는 회원정보 수정 입력폼으로 아이디, 비밀번호, 비밀번호확인, 이름, 생년월일/성별, 연락처, 이메일을 나타내고 있습니다.">
		<!--skip  -->					<caption><span class="skip"><!-- 회원정보 수정 입력폼 --></span></caption>
				
							<tbody>
							
							<tr >
								<td><label>기업명</label><br><input type="text" class="text" placeholder="내용을 입력해주세요" id="name" name="name"></td>
								<td><label>기업형태</label><br>
								<select class="text" name="type" id="type">
									<option>===선택===</option>
									<option>대기업</option>
									<option>대기업 계열사,자회사</option>
									<option>중소기업(300명이하)</option>
									<option>중견기업(300명이상)</option>
									<option>벤처기업</option>
									<option>외국계(외국 투자기업)</option>
									<option>외국계(외국 법인기업)</option>
									<option>국내 공공기관,공기업</option>
									<option>비영리단체,협회,교육재단</option>
									<option>외국 기관,비영리기구,단체</option>
								</select>
								</td>
								
							</tr>
							
							<tr>
								<td ><label>사업자 등록번호</label><br><input type="text" class="text" placeholder="내용을 입력해주세요" name="businessNum" id="businessNum"></td>
								<td ><label>산업(업종)</label><br>
								<select class="text" name="field" id="field">
									<option>===선택===</option>
									<option>솔루션</option>
									<option>SI</option>
									<option>CRM</option>
									<option>ERP</option>
									<option>WAS</option>
									<option>BigData</option>
									<option>DataMining</option>
									<option>DataWarehouse</option>
									<option>SM</option>
									<option>모바일 앱개발</option>
								</select>
								
								</td>
							</tr>
							
							<tr>
								<td ><label>대표자명</label><br><input type="text" class="text" placeholder="내용을 입력해주세요" name="representativeName" id="representativeName"></td>
								<td ><label>사원 수</label><br><input type="text" class="text" placeholder="내용을 입력해주세요" name="emp" id="emp">
								</td>
								
							</tr>
							
							<tr>
								<td ><label>홈페이지</label><br><input type="text" class="text" placeholder="내용을 입력해주세요" name="homepage" id="homepage"></td>
								<td ><label>설립년도</label><br><input type="date" name="date" class="text" name="establishYear" id="establishYear">
								</td>
								
							</tr>
							<tr>
								<td><label>우편번호</label> <input type="button" value="주소검색" name="zipcode" id="zipcode"><br>
								<input type="text" style="width:300px" class="text" placeholder="주소검색 버튼을 클릭하여 검색해주세요"></td>
								<td><label>상세주소</label><br><input type="text" style="width:400px" class="text" placeholder="주소검색 버튼을 클릭하여 검색해주세요" name="addr" id="addr"><br>
								<input type="text" class="text" style="width:400px" placeholder="상세주소를 입력해주세요" name="addr2" id="addr2"></td>
							</tr>
							
							
					
							</tbody>
						</table>
					
				</div>
					
					<div class="imgDiv">
					<br>
						<div class="imageBox">							
						</div>
						<br/>
						<input type="button" value="변경" id="imgBtn" name="imgBtn"/> 
					</div>
					<p style="clear:both;"></p>
					
				</div>
				<br>
				<br>
				<br>
				<hr>
				<br>
				
				<p class="mbrBtnFunc" style="text-align:center">
					<span class="mbrBtn mbrBtnOk_3"><a id="okLink" name="okLink" style="cursor:pointer;"><span></span></a></span>
					<span class="mbrBtn mbrBtnCancel_1"><input type="button" id="cancleBtn" name="cancleBtn" onclick="#void"><span></span></button></span>
				</p>
		</form>		
		</div>
		<!-- <hr> -->
		
	<br>
	</div>
</div>
<!--footer//////////////////////////////////////////////////////////////////////////////////////  -->



</body>
</html>