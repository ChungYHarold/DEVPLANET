<%@page import="java.sql.SQLException"%>
<%@page import="kr.co.sist.admin.dao.AdminCorpDAO"%>
<%@page import="kr.co.sist.admin.vo.SelectCorpVO"%>
<%@page import="kr.co.sist.admin.vo.AdminCorpVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="check_login.jsp" %>
<%
request.setCharacterEncoding("UTF-8");
%>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>기업정보 수정</title>
		<link rel="stylesheet" type="text/css" href="/include/css/ver_2/common.css?201909051400">
		<link rel="stylesheet" type="text/css" href="/include/css/ver_2/footer_sub.css">
        <link rel="stylesheet" type="text/css" href="/include/css/ver_1/gnb.css?20170124001">
	    <link rel="stylesheet" type="text/css" href="/include/css/ver_1/gnb_sub.css?20170317002">
	    <link rel="stylesheet" type="text/css" href="//i.jobkorea.kr/content/css/ver_2/member/mbr_common.css?date=202103121100">
	    <link rel="stylesheet" type="text/css" href="//i.jobkorea.kr/content/css/ver_2/member/mbr_tpl.css?date=202103121100">
	    <link rel="stylesheet" type="text/css" href="//i.jobkorea.kr/content/css/ver_2/member/mbr_style.css?date=202103121100">
   		<link rel="stylesheet" type="text/css" href="//i.jobkorea.kr/deploy/pc/dist/css/personal/layout/footer-sv-202301261521.css"> <!-- (JK-9495) PC Main Footer 변경 (2021.02.18) -->
<style>

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
    padding-right:36px;
}

tr{
height:135px;
}

td{
width:330px;
}

.rep {
	width: 80px;
}

.repTd {
	width: 300px;
}

.repTr {
	height: 10px;
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
	var nameList = []; // 이름들을 저장할 배열
	
	$("#addBtn").click(function() {
	    var repName = $("#repName").val();
	    var result = '';
	    
	    if(repName == '') {
	        result = '';
	    } else {
	        result += '<td class="repTd"><input type="text" readonly="readonly" name="repNames" value="'+repName+'"/></td><td><input type="button" value="x" class="delName"/></td>';
	        nameList.push(repName); // 배열에 이름 추가
	    }
	    
	    var repNameHtml = '<tr class="repTr">' + result + '</tr>';
	    $("#repTable").append(repNameHtml);
	    
	    /* $(".delName").click(function() {
	        var index = $(".delName").index(this); // 삭제 버튼의 인덱스
	        nameList.splice(index, 1); // 해당 인덱스의 이름 제거
	        $(this).closest(".repTr").remove();
	    }); */
	    
	    $("#repName").val(''); // 입력한 내용 리셋
	    addRepresent();
	});
	
	$(".delName").click(function() {
        var index = $(".delName").index(this); // 삭제 버튼의 인덱스
        nameList.splice(index, 1); // 해당 인덱스의 이름 제거
        $(this).closest(".repTr").remove();
        deleteRepresent();
    });
	
	// 삭제 버튼 시 메서드 실행
	function deleteRepresent() {
		acDAO.deleteRepresent(corpNum);
	}
	
	$("#modifyBtn").click(function(){
		if($("#name").val() == "") {
			alert("기업명은 필수 입력입니다.");
			return;
		}// end if
		
		if($("#type").val() == "") {
			alert("기업형태는 필수 선택입니다.");
			return;
		}// end if
		
		if($("#businessNum").val() == "") {
			alert("사업자번호는 필수 입력입니다.");
			return;
		}// end if
		
		if($("#field").val() == "") {
			alert("산업(업종)은 필수 선택입니다.");
			return;
		}// end if
		
		 if ($('#repTable tr').length == 0) {
			alert('대표자는 필수 입력입니다.');
			return;
		} 
		
		if($("#emp").val() == "") {
			alert("사원수는 필수 입력입니다.");
			return;
		}// end if
		
		if($("#establishYear").val() == "") {
			alert("설립년도는 필수 입력입니다.");
			return;
		}// end if
		
		if($("#zipcode").val() == "") {
			alert("우편번호는 필수 입력입니다.");
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

function checkInput(input) {
	// 입력값에서 숫자만 추출합니다.
	var value = input.value.replace(/[^0-9]/g, '');

	// 추출한 숫자가 입력값과 다른 경우
	if (value !== input.value) {
	  // 알림창을 띄웁니다.
	  alert("숫자만 입력 가능합니다.");
	  // 입력값을 숫자로 변경합니다.
	  input.value = value;
	}
}

function addHyphen(input) {
	// 하이픈을 제외한 숫자만 추출합니다.
	var value = input.value.replace(/[^0-9]/g, '');

	// 추출한 숫자를 하이픈으로 구분합니다.
	var first = value.slice(0, 3);
	var second = value.slice(3, 5);
	var third = value.slice(5, 10);

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



<!--header//////////////////////////////////////////////////////////////////////////////////////////////  -->
<body>
<div id="header">
	<div id="space"></div>
	<div class="gnbWrap gnbWrap_mMng">
		<div id="gnb">
			<!--// 기업회원 -->
			<h1><a class="logo" href="http://localhost/prj2/project_admin/1.mainAdmin/main.jsp">
			<img alt="데브플래닛" src="http://localhost/prj2/project_admin/images/devplanet_logo.png"></a>
			<span class="bar"></span><span style="font-size:23px">&nbsp;기업정보 수정</span>
			</h1>
			<a id="main_page" href="http://localhost/prj2/project_admin/1.mainAdmin/main.jsp">메인페이지</a>
		</div>
	</div>
</div>


<div id="wrap">
	<!--// Contents Area -->
	<div id="container">
	
	<%
	int corpNum = Integer.parseInt(request.getParameter("corp_num"));
	
	AdminCorpDAO acDAO = new AdminCorpDAO();
	AdminCorpVO acVO = acDAO.selectCorp(corpNum);
	// acDAO.deleteRepresent(corpNum);
	%>

	
		<div id="content">
			<h1 class="skip"><!-- 회원정보 수정 --></h1>
<!--폼태그 --><form action="http://localhost/prj2/project_admin/2.corpInfo/edit_process.jsp?corp_num=<%= corpNum %>" id="frm" name="frm" method="post" enctype="multipart/form-data">
					<div class="mbrSec mbrMngInfo">
						<h2 class="mbrHeading2">
							<span>기본정보 수정</span>
						</h2>
						<div class="mbrTplDesc">
							<p>기업의 기본정보를 수정·확인할 수 있습니다.</p>
						</div>
						<hr />
						<div class="mbrTplData2">
							<br>
							<table
								summary="이 표는 회원정보 수정 입력폼으로 아이디, 비밀번호, 비밀번호확인, 이름, 생년월일/성별, 연락처, 이메일을 나타내고 있습니다.">
								<!--skip  -->
								<caption>
									<span class="skip">
										<!-- 회원정보 수정 입력폼 -->
									</span>
								</caption>

								<tbody>

									<tr>
										<td><label>기업명</label><br> 
										<input type="text" class="text" placeholder="내용을 입력해주세요" name="name" id="name" value="<%= acVO.getName() %>"></td>

										<td>
											<label>기업형태</label><br> 
											<select required="required" class="text" name="type" id="type">
												<option value="">===선택===</option>
												<option value="대기업" <%= acVO.getType().equals("대기업") ? "selected" : "" %>>대기업</option>
												<option value="대기업 계열사,자회사" <%= acVO.getType().equals("대기업 계열사,자회사") ? "selected" : "" %>>대기업 계열사,자회사</option>
												<option value="중소기업(300명이하)" <%= acVO.getType().equals("중소기업(300명이하)") ? "selected" : "" %>>중소기업(300명이하)</option>
												<option value="중견기업(300명이상)" <%= acVO.getType().equals("중견기업(300명이상)") ? "selected" : "" %>>중견기업(300명이상)</option>
												<option value="벤처기업" <%= acVO.getType().equals("벤처기업") ? "selected" : "" %>>벤처기업</option>
												<option value="외국계(외국 투자기업)" <%= acVO.getType().equals("외국계(외국 투자기업)") ? "selected" : "" %>>외국계(외국 투자기업)</option>
												<option value="외국계(외국 법인기업)" <%= acVO.getType().equals("외국계(외국 법인기업)") ? "selected" : "" %>>외국계(외국 법인기업)</option>
												<option value="국내 공공기관,공기업" <%= acVO.getType().equals("국내 공공기관,공기업") ? "selected" : "" %>>국내 공공기관,공기업</option>
												<option value="비영리단체,협회,교육재단" <%= acVO.getType().equals("비영리단체,협회,교육재단") ? "selected" : "" %>>비영리단체,협회,교육재단</option>
												<option value="외국 기관,비영리기구,단체" <%= acVO.getType().equals("외국 기관,비영리기구,단체") ? "selected" : "" %>>외국 기관,비영리기구,단체</option>
											</select>
											</td>
									</tr>

									<tr>
										<td>
											<label>사업자 등록번호</label><br> 
											<input type="text" class="text" placeholder="내용을 입력해주세요" name="businessNum" id="businessNum" value="<%= acVO.getBusinessNum() %>" maxlength="12" oninput="addHyphen(this)"/>
										</td>
										<td>
											<label>산업(업종)</label><br> 
											<select  required="required" class="text" name="field">
												<option value="">===선택===</option>
												<option value="솔루션" <%= acVO.getField().equals("솔루션") ? "selected" : "" %>>솔루션</option>
												<option value="SI" <%= acVO.getField().equals("SI") ? "selected" : "" %>>SI</option>
												<option value="CRM" <%= acVO.getField().equals("CRM") ? "selected" : "" %>>CRM</option>
												<option value="ERP" <%= acVO.getField().equals("ERP") ? "selected" : "" %>>ERP</option>
												<option value="WAS" <%= acVO.getField().equals("WAS") ? "selected" : "" %>>WAS</option>
												<option value="BigData" <%= acVO.getField().equals("BigData") ? "selected" : "" %>>BigData</option>
												<option value="DataMining" <%= acVO.getField().equals("DataMining") ? "selected" : "" %>>DataMining</option>
												<option value="DataWarehouse" <%= acVO.getField().equals("DataWarehouse") ? "selected" : "" %>>DataWarehouse</option>
												<option value="SM" <%= acVO.getField().equals("SM") ? "selected" : "" %>>SM</option>
												<option value="모바일 앱개발" <%= acVO.getField().equals("모바일 앱개발") ? "selected" : "" %>>모바일 앱개발</option>
											</select>
										</td>
									</tr>
									<tr>
										<td>
											<label>홈페이지</label><br> 
											<input type="text" class="text" name="homepage" id="homepage" value="<%= acVO.getHomepage() %>">
										</td>
										
										<td>
											<label>설립년도</label><br> 
											<input type="date" class="text" name="establishYear" id="establishYear" value="<%= acVO.getEstablishYear() %>">
										</td>
									</tr>

									<tr>
										<td>
											<label>대표자명</label>
											<input type="text" class="text" style="width: 250px" placeholder="" name="repName" id="repName" value="" /> 
											<input type="button" value="추가" name="addBtn" id="addBtn">
											
											<table id="repTable">
												<%
												String[] reps = acVO.getRepresentativeName();
												String[] splitReps = reps[0].split(","); // ","로 구분된 문자열을 배열로 분할
												
												%>
												<%
												for (String rep : splitReps) {
												%>
												<tr class="repTr">
													<td class="repTd"><input type="text" readonly="readonly" name="repNames" value="<%= rep %>"/></td>
													<td><input type="button" value="x" class="delName"/></td>
												</tr>
												<%
												}// end for
												%>
											</table>
										</td>
										<td><label>사원 수</label><br> <input type="text"
											class="text" placeholder="내용을 입력해주세요" name="emp"
											id="representativeName" value="<%= acVO.getEmp() %>" oninput="checkInput(this)">
										</td>
									</tr>

									<tr>
										<td>
											<label>우편번호</label> 
										 	<input type="button" value="주소검색" name="addBtn" id="addrBtn"><br>
											<input type="text" style="width: 300px" class="text" readonly="readonly" value="<%= acVO.getZipcode() %>"placeholder="주소검색 버튼을 클릭하여 검색해주세요" name="zipcode" id="representativeName">
										</td>
										<td>
											<label>상세주소</label><br> 
										 	<input type="text" style="width: 400px" class="text" placeholder="주소검색 버튼을 클릭하여 검색해주세요" name="addr" id="addr" value="<%= acVO.getAddr() %>"/><br>
											<input type="text" class="text" style="width: 400px" placeholder="상세주소를 입력해주세요" name="detailAddr" id="detailAddr" value="<%= acVO.getDetailAddr() %>"/>
										</td>
									</tr>

								</tbody>
							</table>
						</div>

						<div class="imgDiv">
						<br>
							<div id="profile">
								<img id="profile" src="http://localhost/prj2/upload/<%= acVO.getLogo() %>" onerror="this.src='http://localhost/prj2/upload/no.png'"/>
							</div>
							<br/> 
							<label class="input-file-button" for="file" onclick="img()"> 
								변경 
							</label> 
							<input type="file" name="file" id="file" />
							<input type="hidden" name="logoHidden" value="<%= acVO.getLogo() %>"/>
						</div>
						<p style="clear: both;"></p>

					</div>
					<br> <br>
				<br>
				<hr>
				<br>
				<p class="mbrBtnFunc" style="text-align:center">
					<span class="mbrBtn mbrBtnModify_1"><a id="modifyBtn" style="cursor:pointer;"><span>수정하기</span></a></span>
					<span class="mbrBtn mbrBtnCancel_1"><input type="button" id="cancelBtn" onclick="location.href='http://localhost/prj2/project_admin/2.corpInfo/company_info.jsp'"><span>취소</span></span>
				</p>
<!--폼태그 -->	</form>
		</div>
		<!-- <hr> -->
		<br>
	</div>
</div>
</body>
</html>