<%@page import="kr.co.sist.user.dao.UserDAO"%>
<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="http://211.63.89.139/jsp_prj/common/main_v20230217.css">
<style type="text/css">
#wrap{ width: 400px; height: 400px; margin: 0px auto;  }
#body{ width:400px; height:180px; margin-top: 30px }
#searchResult{ margin-top:30px }

</style>
<!-- jQuery CDN 시작 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<!-- jQuery CDN 끝 -->

<!-- bootstrap 시작-->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
<!-- bootstrap 끝-->

<script type="text/javascript">
$(function() {
	 $(".fw-normal").css("color", "red");
	
	 $("#btn").on("click", function() {
		 
		    var value = $("#id").val();
		    if (/[\s~`!@#$%\^&*+=\-\[\]\\';,/{}|\\":<>\?()\._]/.test(value)) {
		      alert("아이디에 공백이나 특수문자를 사용할 수 없습니다.");
		      return false; // 중복확인 버튼 클릭 이벤트를 중단합니다.
		    }else if($("#id").val() == ""){
		    	
					alert("아이디는 필수 입력입니다.");
					return;
		    }else {
		    	
		      $("#frm").submit(); // 중복확인을 처리합니다.
		    }
		  });//ready
	
});//ready


function sendId(id) {
	opener.window.document.joinFrm.userId.value=id;
	self.close();
}//sendId

</script>
</head>
<body>
<div id="wrap"> 
<div id="body">
<form action="id_dup.jsp" method="post" id="frm">
<div style="top:20px">
<h3>아이디 중복 확인</h3><br/>
<p class="fw-normal" style="font-size:12px; font-color:#FFF;">공백 또는 특수문자가 포함된 아이디는 사용할 수 없습니다.
</p>
</div>
 <div class="col-auto">
    <label class="visually-hidden" for="autoSizingInput">아이디</label>
    <input type="text" class="form-control" id="id" name="id" placeholder="아이디를 입력해주세요" ><br>
<input type="button" value="중복확인" class="btn btn-primary" id="btn"/>
  </div>
<!-- <label>아이디</label>
<input type="text" autofocus="autofocus" name="id" id="id" class="inputBox" style="width:250px"/> -->
</form>
</div>

<%

request.setCharacterEncoding("UTF-8");

String id=request.getParameter("id");
if( "POST".equals(request.getMethod()) && !"".equals(id) ) {
	
	//IdDupDAO idDAO=new IdDupDAO();
	UserDAO uDAO=new UserDAO();
	try{
	String resultId=uDAO.selectIdDup(id);
	
%>
<div id="searchResult">
<%if("".equals(resultId)) { // 아이디 사용가능%>
입력하신 <span style="font-weight: bold; color:#0142BA; font-size:20px">
<%= id %></span>는 사용가능합니다.<br/>
<a href="#void" onclick="sendId('<%= id %>')">사용하기</a>

<%}else { // 아이디 중복이므로 사용 불가능%>

입력하신 <span style="font-weight: bold; color:#E43C2F; font-size:20px">
<%= id %></span>는 이미 사용중인 아이디 입니다.<br/>
다른 아이디를 입력해 주세요.

<%}//end else %>

</div>
<%
	}catch(SQLException se) {
		se.printStackTrace();
	%>
	아이디 중복확인 중 문제가 발생했습니다.<br/> 잠시 후 다시 시도해 주세요.
	<%
	}//end catch
}//end if%>
</div>
</body>
</html>