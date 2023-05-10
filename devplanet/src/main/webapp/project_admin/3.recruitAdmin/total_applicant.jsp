
<%@page import="kr.co.sist.util.cipher.DataEncrypt"%>
<%@page import="kr.co.sist.util.cipher.DataDecrypt"%>
<%@page import="java.sql.SQLException"%>
<%@page import="kr.co.sist.admin.dao.ApplyDAO"%>
<%@page import="kr.co.sist.admin.vo.ApplyVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="kr.co.sist.admin.dao.JobAdDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="check_login.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>채용공고 관리-지원자현황</title>
<style type="text/css">
#wrap{ margin:0px auto; width:1200px; height:900px; /* background-color: #333  */ }
#header{ position:relative; height:100px;  }
#container{ position:relative; height:800px;  background-color: #E0E0E0 }
.logo{ position:absolute; width:230px; height:50px; top:25px; left:0px; border-right:1px solid #CCC }
.page_name{ position:absolute; width:180px; height:40px; top:35px; left:250px; font-size:23px;}
.main_page{ position:absolute; width:80px; height:20px; top:40px; left:1100px; font-size:16px; background-color: #FFF}
.title{ position:absolute; top:230px; left:50px;  font-family:고딕; font-size:26px; }
.board{ position:absolute; top:120px; left:380px; width:400px; height:100px;}
.board_table{ margin:0px auto; text-align:center; font-size:15px;  width:400px; height:100px;  }
.search{ position:absolute; top:280px; left:900px; }
.search_btn{ position:absolute; top:283px; left:980px; } 

.btnSearch{ background-color: #5E5E5E; border:none; width: 52px; height:26px; border-radius:4px; color:white; cursor:pointer }
.btnRefresh{ background-color: #5E5E5E; border:none; width: 70px; height:26px; border-radius:4px; color:white; cursor:pointer }
.chart{ position: absolute; top:320px; left:50px; width: 1100px; height:300px; background-color: #E0E0E0; }
.chart_table{ border:1.5px solid #CCC; border-spacing: 0px; background-color: #FFF }
.delete{ border:none; width:40px; height:25px; background-color: transparent; cursor:pointer }
.top{ background-color: #323743;  }
th, tr{ border:1px solid #323743; border:none; border-bottom:0.5px solid #CCC }
td{ text-align:center; font-family:맑은 고딕; font-size:14px; border-bottom:0.2px solid #CCC }
tr.hover:hover{background-color: #D5E3E3;}



.title {
    position: absolute;
    top: 250px;
    left: 50px;
    font-family: 고딕;
    font-size: 26px;
}



.title1 {
    position: absolute;
    top: 290px;
    left: 45px;
    /* font-family: 맑은 고딕; */
    font-size: 16px;
    font-weight: normal;
}


</style>

<!-- CDN 시작 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<!-- CDN 끝 -->

<script type="text/javascript">

$(function() {
	
	//검색버튼
	$("#search_people").click(function() {
		
		if($("#people_text").val()==""){
			alert("입력 후 검색해주세요");
			return;
		}//end if
		
		$("#searchPeople").submit();	
	});//search_people
	
	
	
	
	//목록으로
	$("#refreshBtn").click(function(){
		//history.back();		
		location.href="http://localhost/prj2/project_admin/3.recruitAdmin/job_posting.jsp";
		
		window.scrollTo({
		    top: 0,
		    left: 0,
		    behavior: "auto"
		  });
		
	});
	
	
	
	
	
});//ready

</script>

</head>
<body>
<div id="wrap">
<div id="header">

<div class="logo">
<a href="http://localhost/prj2/project_admin/3.recruitAdmin/job_posting.jsp"><img src="http://localhost/prj2/images/devplanet_big.png" alt="데브플래닛"></a>
</div>

<div class="page_name">
<strong>채용공고 관리</strong>
</div>

<div class="main_page">
<a href="http://localhost/prj2/project_admin/1.mainAdmin/main.jsp" class="list" >메인페이지</a>
</div>
	
</div>

<div id="container">

<%

//DAO 객체화
ApplyDAO aDAO = new ApplyDAO();

List<ApplyVO> list = new ArrayList<ApplyVO>();

//공고번호, 지원자명, 회사명, 공고제목
String jobNumStr = request.getParameter("jobNum");
int jobNum = Integer.parseInt(jobNumStr);

String applyName = request.getParameter("people_text");
String cName = request.getParameter("cName");
String jobTitle = request.getParameter("jobTitle");
//String title = (String) session.getAttribute("jobTitle");
System.out.println(cName + "/"+jobTitle);


if(applyName==null){
	applyName="";
}//end if


//열람수
int cntRead =0;
//미열람수
int cntUread =0;
//총 지원자
int cntApply =0;



try{
DataEncrypt de= new DataEncrypt("FsRt4SfY4US0IWtK4JPJsw==");
DataDecrypt dd=new DataDecrypt("FsRt4SfY4US0IWtK4JPJsw=="); //이름 키 필요


//DAO의 select메서드 호출 (기업 현황 보여주기)


if(applyName!=""){
applyName = de.encryption(applyName);	
}


list = aDAO.selectApplyAll(applyName, jobNum);



//list의 0번방에 담긴 VO의 getter메서드 호출 - 반복시켜서 꺼내오고 복호화 진행
for(int i=0; i<list.size(); i++){
 
 list.get(i).setName(dd.decryption(list.get(i).getName()));// i번째 있는 이름들 반복시켜서 가져오기
 
 //이거 수업시간에 받은 암호화 복호화 파일 아마 lib에 있는 sist_util인듯?
}// end for


//복호화 완료한 이름들을 VO에 넣기 => 그러면 완료!!!!




//리스트를 반복시켜 VO에 담긴 값을 화면에 보여준다
pageContext.setAttribute("list", list);
pageContext.setAttribute("cName", cName);
pageContext.setAttribute("jobTitle", jobTitle);
System.out.println(cName+"/"+jobTitle);

//열람수
cntRead = aDAO.selectCountRead(jobNum);

//미열람수
cntUread = aDAO.selectCountUnRead(jobNum);

//총 지원자
cntApply = aDAO.selectCountApply(jobNum);



}catch(SQLException se){
	se.printStackTrace();
	
	
}//end catch

%>

<div class="title">
<span class="title_text" style="text-align:center; top:10px; left:10px">
<strong><c:out value="${cName }"/></strong></span>
</div>

<div class="title1">
<span class="title_text" style="text-align:center; top:20px; left:10px">
공고제목 : <c:out value="${jobTitle }"/></span>
</div>

<div class="board">
<table class="board_table">
<tr>
   <td style="font-size:20px"><%=cntApply%></td><!--총지원자 -->
   <td style="font-size:20px"><%=cntRead %></td><!--열람 수  -->
   <td style="font-size:20px"><%=cntUread %></td><!--미열람 수  -->
</tr>

<tr>
   <td>총 지원자</td>
   <td>열람</td>
   <td>미열람</td>
</tr>
</table>
</div><!-- board -->

<div class="search">
<form action="http://localhost/prj2/project_admin/3.recruitAdmin/total_applicant.jsp" name="searchPeople" id="searchPeople">
<input type="text" placeholder="지원자 검색" style="width:110px; height:25px" id="people_text" name="people_text"/>
<input type="hidden" name="jobNum" value="<%=jobNum%>"> 
<input type="hidden" name="jobTitle" value="<%=jobTitle%>"> 
<input type="hidden" name="cName" value="<%=cName%>"> 
<input type="button" class="btnSearch" value="검색" id="search_people"/>
<input type="button" class="btnRefresh" value="목록으로" id="refreshBtn"/>
</form>
</div>

<!-- 이게 표이긴 한데 이 표를 div로 감싸서 사용하시는게 편하실거에요 -->
<div class="chart">
<table class="chart_table">
<colgroup>
			<col style="width:2%">  <!-- 이건 표 항목마다 너비 비율로 맞추는 거라 원하는 비율로 바꿔가면서 하시면 됩니다! -->
			<%-- <col style="width:6%"> --%>
			<col style="width:16%">
			<col style="width:8%">
			<col style="width:12%">
			<col style="width:5%">
			<col style="width:5%">
			<col style="width:5%">
</colgroup>
<thead>
  <tr class="top">
  <th scope="col" ><font color="#FFF">번호</font></th>
  <!-- <th scope="col"><font color="#FFF">지원 기업명</font></th> -->
  <th scope="col"><font color="#FFF">이력서 제목</font></th>
  <th scope="col"><font color="#FFF">지원자명</font></th>
  <th scope="col"><font color="#FFF">학력</font></th>
  <th scope="col"><font color="#FFF">경력</font></th>
  <th scope="col"><font color="#FFF">지원일자</font></th>
  <th scope="col"><font color="#FFF">열람상태</font></th>
  </tr>
</thead>


<tbody>

<%
if(list.size()==0){ //검색된 결과가 없으면
%>	
	<tr>
		<td colspan="7">조회된 결과가 없음</td>
	</tr>
	
<%}else{
%>

<c:forEach var="aVO" items="${list}" varStatus="i">
<tr class="hover">
   <td><c:out value="${i.count }"/></td>
   <%-- <td><c:out value="${aVO.cName}" /></td>기업명 --%>
   <%-- <td><a href="http://localhost/prj2/project_admin/4.resumeView/resumeView.jsp?id=${aVO.id}&rNum=${aVO.rNum}&applyNum=${aVO.applyNum}"> --%>
   <td><a href="http://localhost/prj2/project_admin/4.resumeView/resumeView.jsp?jobNum=<%=jobNum%>&id=${aVO.id}&rNum=${aVO.rNum}&applyNum=${aVO.applyNum}">
   <c:out value="${aVO.resumeTitle}" /></a></td><%-- 이력서 제목 --%>
   <td><c:out value="${aVO.name }"/></td>
   <td>
  <%--  <c:out value="${aVO.major}"/> --%>
   
   <%-- CSV 형태의 데이터를 담고 있는 변수를 배열로 분리 --%>
    <c:set var="majorArr" value="${fn:split(aVO.major, ',')}" />
    <c:forEach items="${majorArr}" var="majorElement">
      <c:out value="${majorElement}" /><br/>
    </c:forEach>
   
   </td><%-- 학력 --%>
   <td><c:out value="${aVO.career}" /></td><%-- 경력 --%>
   <td><c:out value="${aVO.applyDate}" /></td><%-- 지원일 --%>
   <td>
   <c:choose>
	<c:when test="${aVO.readState eq 'RD'}">열람</c:when>
	<c:when test="${aVO.readState eq 'URD'}">미열람</c:when>
	</c:choose>
   </td>
</tr>
</c:forEach>
</tbody>

</table>
</div>

<%}//end else %>



</div><!-- container -->
</div><!-- wrap -->
</body>
</html>