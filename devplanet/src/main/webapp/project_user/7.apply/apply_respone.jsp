<%@page import="java.sql.SQLException"%>
<%@page import="kr.co.sist.user.dao.ApplyResumeDAO"%>
<%@page import="kr.co.sist.user.vo.ApplyResumeVO"%>
<%@page import="java.util.List"%>
<%@page import="kr.co.sist.user.vo.LoginResultVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


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

<style>
    .async-hide {
        opacity: 0 !important
    }
</style>

<!-- CDN 시작 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<!-- CDN 끝 -->
<%
//apply.jsp?hr_num=387&hr_title=1&hr_tel=010-1212-8989&cName=&cTitle=
String title=request.getParameter("hr_title");
String email=request.getParameter("hr_email");
String tel=request.getParameter("hr_tel");
String cName=request.getParameter("cName");
String cTitle=request.getParameter("cTitle");
int jobNum=Integer.parseInt(request.getParameter("jobNum"));
int rNum=Integer.parseInt(request.getParameter("rNum"));

pageContext.setAttribute("title", title);
pageContext.setAttribute("email", email);
pageContext.setAttribute("tel", tel);
pageContext.setAttribute("cName", cName);
pageContext.setAttribute("cTitle", cTitle);
pageContext.setAttribute("jobNum", jobNum);
pageContext.setAttribute("rNum", rNum);

%>

<script type="text/javascript">
$(function() {
	$("#btnSubmit").click(function() {
		
		$("#devForm").submit();
		
	});//click
	
	
	
});//ready

function change_page(cName, cTitle, jobNum) {
	var url="http://localhost/prj2/project_user/7.apply/apply_list.jsp?name="+cName+"&title="+cTitle+"&jobNum="+jobNum;
	location.href=url;
}//change

</script>
    
</head>
<body>
    <div id="onPassWrap">
        
        
<form method="get" action="apply_process.jsp" id="devForm" name="devForm">
    <fieldset>
    <input type="hidden" id="rNum" name="rNum" value="${ rNum }">
    <input type="hidden" id="jobNum" name="jobNum" value="${ jobNum }">
    <input type="hidden" id="title" name="title" value="${ title }">
    <input type="hidden" id="email" name="email" value="${ email }">
    <input type="hidden" id="tel" name="tel" value="${ tel }">
        <legend>입사지원</legend>
        <div class="onPassCate">
            <p class="txCate">
                <strong>${ cName }</strong>
                <h1><span id="title">${ cTitle }</span></h1>
            </p>


        </div>

        <div class="onPassCont">
            <article class="passResumeAtc" id="devResumeContainer">
                    <div class="devResumeArea" data-pass-gbn="1">
                        <h2 class="hd">지원이력서</h2>

                        <div class="txResumeBx">
                            <p class="jkResume">
                                <input type="hidden" name="SelAttachFileName" id="SelAttachFileName" />
                                <a href="http://localhost/prj2/project_user/4.resume/1.resume_modify.jsp?rNum=${ rNum }" id="devResumeTitle" target="_new">${ title }</a>
                            </p>
                        </div>

                        <div class="onPassBtnWrap">
                                    <button class="onPassBtn resChange devBtnResumeChg" type="button" data-ly-name="lyResumeList" data-ly-gbn="1" id="change" onclick="javascript:change_page('${cName}', '${cTitle}','${jobNum }')"><span class="ico"></span>이력서 변경</button>

                        </div>
                    </div>


                <div class="etcDescBx">
                    <dl class="mail">
                        <dt>이메일</dt>
                        <dd class="devMEmail">${ email }</dd>
                    </dl>
                    <dl class="phNum">
                        <dt>휴대폰</dt>
                        <dd class="devHPhone">${ tel }</dd>
                    </dl>
                </div>
            </article>


            <!-- // 선택항목 영역 -->
            <div class="sendBtnWrap">
                <button class="btnPassSend "  id="btnSubmit" type="button"><span style="font-size: 20px; font-family: 맑은 고딕; color: #FFF">지원하기</span></button>
            </div>
        </div>
        
        
</fieldset>
</form>
</div>
</body>
</html>