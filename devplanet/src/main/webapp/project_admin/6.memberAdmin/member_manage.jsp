<%@page import="kr.co.sist.service.PlainService"%>
<%@page import="java.util.Base64"%>
<%@page import="kr.co.sist.util.cipher.DataEncrypt"%>
<%@page import="java.util.ArrayList"%>
<%@page import="kr.co.sist.util.cipher.DataDecrypt"%>
<%@page import="kr.co.sist.admin.vo.AdminUserVO"%>
<%@page import="kr.co.sist.admin.vo.SelectUserVO"%>
<%@page import="kr.co.sist.admin.dao.AdminUserDAO"%>
<%@page import="kr.co.sist.admin.vo.SelectCorpVO"%>
<%@page import="java.util.List"%>
<%@page import="kr.co.sist.admin.dao.AdminCorpDAO"%>
<%@page import="kr.co.sist.admin.vo.AdminCorpVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="check_login.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 관리</title>
<style type="text/css">
#wrap{ margin:0px auto; width:1200px; height:900px; /* background-color: #333  */ }
#header{ position:relative; height:100px;  }
#container{ position:relative; width: 100%; height: 100%;  background-color: #f7f7f7 }
.logo{ position:absolute; width:230px; height:50px; top:25px; left:0px; border-right:1px solid #CCC }
.page_name{ position:absolute; width:180px; height:40px; top:35px; left:250px; font-size:23px;}
.main_page{ position:absolute; width:80px; height:20px; top:40px; left:1100px; font-size:16px; background-color: #FFF}
.title{ position:absolute; top:50px; left:50px;  font-family:고딕; font-size:26px; }
.board{ position:absolute; top:120px; left:380px; width:400px; height:100px;}
.board_table{ margin:0px auto; text-align:center; font-size:15px;  width:400px; height:100px;  }
.search{ position:absolute; top:280px; left:50px; }
.search_btn_div{ position:absolute; top:283px; left:180px; }
.btn{ background-color: #5E5E5E; border:none; width: 52px; height:26px; border-radius:4px; color:white; cursor:pointer }
.regist_div{ position:absolute; top:273px; left:1050px; }
.regist_btn{ background-color: #3498DB; border:none; width: 100px; height:40px; border-radius:4px; cursor:pointer; color:white; font-size: 16px }
.chart{ position: absolute; top:320px; left:50px; width: 1100px; height:300px; background-color: #E0E0E0; }
.chart_table{ border:1.5px solid #CCC; border-spacing: 0px; background-color: #FFF }
.delete{ border:none; width:40px; height:25px; background-color: transparent; cursor:pointer }
.top{ background-color: #323743;  }
th, tr{ border:1px solid #323743; border:none; border-bottom:0.5px solid #CCC }
td{ text-align:center; font-family:맑은 고딕; font-size:14px; border-bottom:0.2px solid #CCC }
a { text-decoration-line: none; }
a:link { color : black; }
tr.hover:hover{background-color: #D5E3E3;}
a:visited { color : black; }
a:hover { color : blue; } 
.policy-table th, td {
	border: none;
}


</style>

<!-- CDN 시작 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<!-- CDN 끝 -->

<script type="text/javascript">

$(function() {
	$("#id_btn").click(function() {
		$("#id_frm").submit(); 
	});//id_btn
});//ready

function confirmDelete(userId) {
	if(confirm("정말 삭제하시겠습니까?")) {
		location.href="http://localhost/prj2/project_admin/6.memberAdmin/delete_process.jsp?user_id="+ userId;
	}// end if
}// confirmDelete
</script>


</head>
<body>
<div id="wrap">
<div id="header">

<div class="logo">
<img src="http://localhost/prj2/project_admin/images/devplanet_big.png">
</div>

<div class="page_name">
<strong>회원 관리</strong>
</div>

<div class="main_page">
<a href="http://localhost/prj2/project_admin/1.mainAdmin/main.jsp">메인페이지</a>
</div>

</div>

<div id="container">
<% 
String uName = request.getParameter("uName");

AdminUserDAO auDAO = new AdminUserDAO();
List<SelectUserVO> list = auDAO.selectUser(uName);

int userCount = auDAO.selectCountAllUser();
// 복호화
PlainService ps=new PlainService();
ps.selectUser(list); 

// List<SelectUserVO> deList = new ArrayList<>();
 
//복호화 키 설정

/* pageContext.setAttribute("result", list);  */
pageContext.setAttribute("result", list); 
pageContext.setAttribute("userCount", userCount);

//for문 안에서 복호화된 VO를 담는다

%>
<div class="title">
<span class="title_text" style="text-align:center; top:10px; left:10px"><strong>가입자 현황</strong></span>
</div>

<div class="board">
<table class="board_table">
<tr>
   <td style="font-size:20px">${ userCount }</td>
</tr>

<tr>
   <td>등록된 회원</td>
</tr>
</table>
</div><!-- board -->

<div class="search">
<form action="http://localhost/prj2/project_admin/6.memberAdmin/member_manage.jsp" name="id_frm" id="id_frm">
<input type="text" placeholder="아이디 검색" style="width:110px; height:25px" id="uName" name="uName"/>
<input type="button" class="btn" value="검색" id="id_btn" />
</form>
</div>

<div class="chart">
<form name="chart_frm" id="chart_frm">
<table class="chart_table">
<colgroup>
			<col style="width:3%">
			<col style="width:6%">
			<col style="width:6%">
			<col style="width:6%">
			<col style="width:18%">
			<col style="width:6%">
			<col style="width:6%">
			<col style="width:6%">
</colgroup>
<thead>
  <tr class="top">
  <th scope="col" ><font color="#FFF">번호</font></th>
  <th scope="col"><font color="#FFF">아이디</font></th>
  <th scope="col"><font color="#FFF">이름</font></th>
  <th scope="col"><font color="#FFF">생년월일</font></th>
  <th scope="col"><font color="#FFF">주소</font></th>
  <th scope="col"><font color="#FFF">연락처</font></th>
  <th scope="col"><font color="#FFF">가입일</font></th>
  <th scope="col"><font color="#FFF">수정 / 삭제</font></th>
  </tr>
</thead>

<tbody>
<c:forEach var="val" items="${ result }" varStatus="i">
	<tr class="hover">
   		<td><c:out value="${ i.count }"/></td>
   		<td><c:out value="${ val.id }"/></td>
  	 	<td><c:out value="${ val.name }"/></td>
   		<td><c:out value="${ val.birthDate }"/></td>
   		<td><c:out value="${ val.addr }"/></td>
   		<td><c:out value="${ val.tel }"/></td>
   		<td><c:out value="${ val.regDate }"/></td>
   		<td>
   			<a href="http://localhost/prj2/project_admin/6.memberAdmin/editMemInfo.jsp?user_id=${ val.id }">수정</a> / 
   			<a href="http://localhost/prj2/project_admin/6.memberAdmin/delete_process.jsp?user_id=${ val.id }" onclick="return confirm('정말 삭제하시겠습니까?')">삭제</a>
   		</td>
	</tr>
</c:forEach>
</tbody>
</table>
</form>
</div>
</div><!-- container -->
</div><!-- wrap -->
</body>
</html>