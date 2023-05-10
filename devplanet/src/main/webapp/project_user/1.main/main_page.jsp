<%@page import="java.util.ArrayList"%>
<%@page import="kr.co.sist.user.vo.CompanyVO"%>
<%@page import="java.util.List"%>
<%@page import="kr.co.sist.user.dao.JobDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DEVPLANET_main</title>
<style type="text/css">
#wrap{ margin:0px auto; width:1700px; height:1600px; }
#header{position:absolute; top:200px; left:300px }
#container{ position:relative }  /* 이거마저 완성하기 */
#companyList{ position:absolute; top:500px; left:300px }
#loginbox{ position:relative; top:200px; left:1160px; background-color: #F3F4F6; width: 300px; height:200px; }
#loginb{ width:250px; height:65px; position:absolute; background-color: #E0E0E0; top:20px; left:25px; border-radius: 4px; font-size: 15px; font-family: "Malgun Gothic";}
#join{ width:250px; height:55px; position:absolute; background-color: #3498DB; top:95px; left:25px; border-radius: 4px; font-size: 16px; font-family: "Malgun Gothic"; color:white}
#idbx{ position:absolute; top:165px; left:115px }
#pwbx{ position:absolute; top:165px; left:140px }
#footer{ position:absolute; top:1400px; left:-20px }
#abs {position:absolute; top:290px; left:300px}
#headerWrap{ top:-200px; left:-100px; position:absolute }

</style>
<script type="text/javascript" src="/NET/Scripts/EchoScriptV2.js"></script>

    <link href="//i.jobkorea.kr/content/css/ver_2/modules/swiper/4.3.3/swiper.min.css?v=202302231400" rel="stylesheet" type="text/css" />
    <link href="//i.jobkorea.kr/content/css/ver_2/main/main-sv-202302161117.css" rel="stylesheet" type="text/css" />
    <link href="//i.jobkorea.kr/content/css/ver_2/gnb/gnb-sv-202302072128.css" rel="stylesheet" type="text/css" />
    <link href="//i.jobkorea.kr/content/css/ver_2/event/banner.promotion-sv-202211241151.css" rel="stylesheet" type="text/css" />
    <link href="//i.jobkorea.kr/content/css/components/notification/1.0.0/notification-sv-202005061649.css" rel="stylesheet" type="text/css" />
    <link href="//i.jobkorea.kr/deploy/pc/dist/css/personal/layout/footer-sv-202301261521.css" rel="stylesheet" type="text/css" />

    
    <link href="//i.jobkorea.kr/deploy/pc/dist/css/mtu/mtu_popup-sv-202302171313.css" rel="stylesheet" type="text/css" />

<script type='text/javascript' src='/resources/lib/datastory/dslog.js?ver=1.1' id='dslog_tag'></script> 


<!-- CDN 시작 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<!-- CDN 끝 -->

<%
session.removeAttribute("sesVO");
	
JobDAO jDAO=new JobDAO();
List<CompanyVO> list = jDAO.selectMain();
	
pageContext.setAttribute("corpList", list);
%>

<script type="text/javascript">

	
$(function() {
	$("#loginb").click(function() {
		location.href="http://localhost/prj2/project_user/2.join/login.jsp";
	});//click loginb
	
	$("#join").click(function() {
		location.href="http://localhost/prj2/project_user/2.join/join.jsp";
	});//click join
	
	$("#searchBtn").click(function() {
		if($("#stext").val() == "") {
			alert("검색어를 입력해 주세요.");
			return;
		}//end if
		$("#searchFrm").submit();
	});//click stext
	
});//ready


</script>

</head>
<body>



<div id="wrap">
<!-- 네비바 시작  -->
<div id="headerWrap" class="gnbTheme1260 devGnbContainer ">
    <div id="header" class="">
        <!--신입공채 메뉴일경우 클래스 start-sub 추가 -->
        <!-- // headInner -->
        <div class="headInner">
            <h1 class="jkLogo" onclick="GA_Event('공통_PC', '헤더', '잡코리아로고');">
                        <a href=""><img id="jkLogo" src="http://localhost/prj2/images/devplanet_big.png" /></a>
            </h1>
        </div>
        <!-- headInner // -->

        <div id="headNavBar" class="headNavBar">
            <div class="navInner">

<!-- 전체보기 버튼 클릭시 active 클래스 추가 -->
<div class="allArea">
    <h2 class="skip">전체서비스</h2>
    <button type="button" class="btnAllService" onclick="GA_Event('공통_PC', 'gnb', '전체서비스');"><span class="spGnb"><span class="txIr">전체서비스 열기</span></span></button>
    <!-- // 전체보기 레이어 -->
    <div class="lyNavArea" id="devGnbAllServiceMenu"></div>
    <!-- 전체보기 레이어 // -->
</div>

                <div class="jkNavArea">
                    <h2 class="skip">주요서비스</h2>
                    <ul class="serviceNav">

                        <!-- 메뉴 활성화 클래스 navFixed 마우스 오버시 active 클래스 추가 -->
                        <li id="gnbGi" class="navItem gi ">
                            <a href="http://localhost/prj2/project_user/6.recruit/adPage.jsp" class="linkItem" onclick="GA_Event('공통_PC', 'gnb', '전체서비스_채용정보');"><span class="spNav"><span class="txIr">개인회원 홈</span></span></a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- 네비바 끝  -->

<div id="contanier">
<!-- 검색바 시작 -->
<div id="header" class="" > 

 <div class="search">
    <h2 class="skip">검색</h2>
    <form name="search_bar" id="searchFrm" action="http://localhost/prj2/project_user/6.recruit/adPage.jsp" >
        <fieldset>
            <div class="smKey">
                <input type="text" id="stext" title="검색어 입력" name="stext" placeholder="기업명과 직무검색" maxlength="50">
                <input type="button" value="검색" class="submit spGnb" id="searchBtn"/> 
            </div>
        </fieldset>
    </form>
 </div>
</div>
<!-- 검색바 끝 -->

<!-- 로그인 시작 -->
 <div id="loginbox">
 
 <button type="button" id="loginb"><strong>개인회원</strong><br/>로그인
</button>
 <button type="button" id="join"><strong>회원가입</strong></button>
 
 <span class="links">
  <span class="idBx" id="idbx">
  <a href="http://localhost/prj2/project_user/3.idPass/findId.jsp"class="devHref devClick" data-click-value="56" 
    onclick="GA_Event('홈_PC', '회원정보', 'ID 찾기');">ID / </a>
  </span>

  <span class="pwBx" id="pwbx">
  <a href="http://localhost/prj2/project_user/3.idPass/findPw.jsp" class="devHref devClick" data-click-value="56"
	onclick="GA_Event('홈_PC', '회원정보', 'PW 찾기');"> PW 찾기</a>
	</span>
</span>
</div>
 
<!-- 로그인 끝 -->

<!-- 광고 시작 -->
<div id="abs">
    <iframe width="752" height="110" scrolling="no" frameborder="0" marginheight="0" marginwidth="0" src="https://yellow.contentsfeed.com/RealMedia/ads/adstream_sx.ads/jobkorea/main@Top" title="광고"></iframe>
    <span class="ad_bd ad_lt"></span>
	<span class="ad_bd ad_tp"></span>
	<span class="ad_bd ad_rt"></span>
	<span class="ad_bd ad_bt"></span>
</div>
<!-- 광고 끝 -->
<br/>
<br/>
<br/>
<br/>
<!-- 채용공고 시작 -->
<div class="grand_banner_wrap" id="companyList">
            <h3 class="header"><strong>DEVPLANET 채용공고</strong></h3>
            <ul class="list list_firstvvip">
            <c:forEach var="corps" items="${ corpList }">
            <input type="hidden" id="corp_name" name="corp_name" value="${ corps.cName }">
                            <li>
                                <div class="company">
                                    <span class="name">
                                        <a href="http://localhost/prj2/project_user/7.apply/company.jsp?name=${ corps.cName }&jobNum=${ corps.jobNum }" onclick="Job_DB_window(this.href,1000,500);SpaceClick(41119625,42);return false;" target="_blank"><span class="logo"><img src="http://localhost/prj2/upload/${ corps.logo }" width="180" height="72" alt="" onerror="this.src='//img.jobkorea.co.kr/Images/Logo/180/l/o/logo_none_180.gif';"></span>${ corps.cName }</a>
                                    </span>
                                </div>
                                <div class="description"><a href="http://localhost/prj2/project_user/7.apply/company.jsp?name=${ corps.cName }&jobNum=${ corps.jobNum }" onclick="Job_DB_window(this.href,1000,500);SpaceClick(41119625,42);return false;" target="_blank">${ corps.title }<br /></a></div>
                                <div class="company-background-image"><img src="http://localhost/prj2/upload/${ corps.logo }" alt="${ corps.cName }" onerror="this.src='//file1.jobkorea.co.kr/banner/images/100006303.jpg';"></div>
                            </li>
            </c:forEach>
            </ul>
        </div>
 
<!-- 채용공고 끝 -->
</div>

<!-- footer 시작 -->
<div id="footer" class="footer footer--main">
    <div class="footer__wrap">
        <h2 class="skip">잡코리아 기타 정보</h2>

         <div class="footer__notice">
                <p class="copyright">
            © <strong><a href="http://sist.co.kr/" target="_blank">DEVPLANET</a></strong> LLC. All rights reserved.
        </p>
            
        </div> 

         <div class="footer__service">
            <h3 class="blind">잡코리아 서비스 링크</h3>
            <ul>
                <li><a href="http://localhost/prj2/project_user/1.main/main_page.jsp" target="_blank">회사소개</a></li>
            </ul>
        </div>  
        
    </div>
</div>
<!-- footer 끝 -->
</div><!-- wrap -->


</body>
</html>