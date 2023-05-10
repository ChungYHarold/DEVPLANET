<%@page import="java.sql.SQLException"%>
<%@page import="kr.co.sist.user.dao.ApplyResumeDAO"%>
<%@page import="kr.co.sist.user.vo.ApplyResumeVO"%>
<%@page import="java.util.List"%>
<%@page import="kr.co.sist.user.vo.LoginResultVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
        <title>입사지원</title>


<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />

<link rel="SHORTCUT ICON" href="//www.jobkorea.co.kr/favicon.ico?v1904091400">

    <link rel="canonical" href="https://www.jobkorea.co.kr" />
    <link rel="alternate" href="https://m.jobkorea.co.kr" media="only screen and (max-width: 640px)" />
    <link rel="alternate" href="ios-app://569092652/https/m.jobkorea.co.kr" />
    <link rel="alternate" href="android-app://com.jobkorea.app/https/m.jobkorea.co.kr" />



<meta name="title" content="입사지원 : 잡코리아 - 좋은 일이 생긴다">
<meta name="writer" content="잡코리아">
<meta name="description" content="구인 구인 검색 엔진, 취업 정보, 채용 정보, 구직 정보, 구인 정보, 취업 가이드, 원 클릭 취업 검색, 경력 관리,잡코리아, JOKOREA, 헤드헌팅, 파견·대행, 아웃소싱, 인재파견, 채용대행, 위탁도급, 파견임시, 교육, 교육과정, 교육정보, 교육기관, 취업박람회, 채용박람회">
<meta name="keywords" content="jobkorea, 구인, 구직, 취업, 등록, 신문기사, 고용, 대기업, 채용, 기업, 검색, 컴퓨터, 정보통신, 웹마스터, 네트웍, 서버관리, 웹 디자인, 웹 마케팅, 컨텐트개발, 정보검색/사서직, 인터넷영업, 서버구축, 데이터베이스, 디자인, 편집디자인, MAC 편집, 제품 디자인, 산업 디자인, CAD, CAM, 웹 디자인, 캐릭터, 애니메이션, 프로그래머, 정보제공(IP/CP), 기술 영업, 통신 기술, 시스템 분석/설계, 정보통신강사, 하드웨어, 사무직, 관리직, 경리, 회계, 재무, 마케팅, 영업, 무역, 해외영업, 사무직, 기획, 총무, 인사, 홍보, 비서직, 프리랜서/아르바이트, 장애인, 외국인업체, 자원봉사, 노무직,잡코리아, JOKOREA, 헤드헌팅, 파견·대행, 아웃소싱, 인재파견, 채용대행, 위탁도급, 파견임시, 교육, 교육과정, 교육정보, 교육기관, 취업박람회, 채용박람회" />
<meta name="verify-v1" content="wfOOCE9Vtx+Z5etOXJnS9LU03yGpBxkK74T/yU63Xqs=">

        <meta name="Robots" content="noindex,nofollow">



<script type="text/javascript" src="/Scripts/EchoScriptV2.js"></script>

<link href="//i.jobkorea.kr/content/css/ver_2/event/banner.promotion-sv-202211241151.css" rel="stylesheet" type="text/css" />

<link href="//i.jobkorea.kr/content/css/ver_1/common-sv-202109161807.css" rel="stylesheet" type="text/css" /><link href="//i.jobkorea.kr/content/css/ver_2/gnb/gnb-sv-202302271621.css" rel="stylesheet" type="text/css" />
<link href="//i.jobkorea.kr/content/css/ver_2/common-sv-202302221621.css" rel="stylesheet" type="text/css" /><link href="//i.jobkorea.kr/content/css/ver_2/mtu/mtu_pass-sv-202111221549.css" rel="stylesheet" type="text/css" />

<!-- bootstrap 시작 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
<!-- bootstrap  -->

<style>
    .async-hide {
        opacity: 0 !important
    }
</style>

<!-- CDN 시작 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<!-- CDN 끝 -->

<%
List<ApplyResumeVO> list=(List<ApplyResumeVO>)session.getAttribute("resumeList");

pageContext.setAttribute("resumeList", list);

System.out.print(list.size());

String cName=request.getParameter("name");
String cTitle=request.getParameter("title");
int jobNum=Integer.parseInt(request.getParameter("jobNum"));

pageContext.setAttribute("cName", cName);
pageContext.setAttribute("cTitle", cTitle);
pageContext.setAttribute("jobNum", jobNum);

%>


<script type="text/javascript">

		
		$(function(){
			  $('#btnChange').click(function(){
			    var selectedRadio = $('input[name=listGroupRadio]:checked');
			    if(selectedRadio.length > 0){
			      var hrNum = selectedRadio.closest('li').find('#hr_num').val();
			      var hrEmail = selectedRadio.closest('li').find('#hr_email').val();
			      var hrTitle = selectedRadio.closest('li').find('#hr_title').val();
			      var hrTel = selectedRadio.closest('li').find('#hr_tel').val();
			      var cName = selectedRadio.closest('li').find('#cName').val();
			      var cTitle = selectedRadio.closest('li').find('#cTitle').val();
			      var jobNum = selectedRadio.closest('li').find('#jobNum').val();
			      window.location.href = "apply_respone.jsp?hr_email=" + hrEmail + "&hr_title=" + hrTitle + "&hr_tel=" + hrTel + "&cName="+cName+"&cTitle="+cTitle+"&rNum="+hrNum+"&jobNum="+jobNum;
			    }else {
			      alert("이력서를 선택해주세요.");
			    }//end else
			  });//click
			});//ready

</script>
    
</head>
<body>
    <div id="onPassWrap">
        
        
<form method="post" action="/Recruit/OnPass/OnPassApply" id="devForm" name="devForm">
    <fieldset>
    
        <legend>입사지원</legend>
        <div class="onPassCate">
            <p class="txCate">
                <strong>${ cName }</strong>
                <a title="${ cTitle }" ><span id="title">${ cTitle }</span></a>
            </p>


        </div>

        <div class="onPassCont">
             <article class="passResumeAtc" id="devResumeContainer">
                    <div class="devResumeArea" data-pass-gbn="1">
                        <h2 class="hd">이력서 제목</h2>

                        <div class="txResumeBx">
                            <ul class="list-group">
                        <c:forEach var="resume" items="${ resumeList }">
                        
  								<li class="list-group-item">
  									<input type="hidden" id="hr_num" name="r_num" value="${ resume.rNum }">
  									<input type="hidden" id="hr_email" name="r_email" value="${ resume.email }">
                        			<input type="hidden" id="hr_title" name="r_title" value="${ resume.title }">
                        			<input type="hidden" id="hr_tel" name="r_tel" value="${ resume.tel }">
                        			<input type="hidden" id="cName" name="cName" value="${ cName }">
                        			<input type="hidden" id="cTitle" name="cTitle" value="${ cTitle }">
                        			<input type="hidden" id="jobNum" name="jobNum" value="${ jobNum }">
    								<input class="form-check-input me-1" type="radio" name="listGroupRadio" value="" id="firstRadio" >
    								<label class="form-check-label" >${ resume.title }</label>
  								</li>
  
							</c:forEach>
							</ul>
                        </div>
                    </div>
            </article> 
            


            <!-- // 선택항목 영역 -->
            <div class="sendBtnWrap">
                <button class="btnPassSend "  id="btnChange" type="button" ><span style="font-size: 20px; font-family: 맑은 고딕; color: #FFF" >이력서 선택하기</span></button>
            </div>
        </div>
        
        
</fieldset>
</form>
</div>
</body>
</html>