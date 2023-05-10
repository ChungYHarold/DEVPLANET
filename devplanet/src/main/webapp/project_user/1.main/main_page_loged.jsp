<%@page import="kr.co.sist.user.vo.CompanyVO"%>
<%@page import="java.util.List"%>
<%@page import="kr.co.sist.user.dao.JobDAO"%>
<%@page import="kr.co.sist.user.vo.LoginResultVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DEVPLANET</title>
<style type="text/css">
#wrap{ margin:0px auto; width:1700px; height:1800px; }
#header{position:absolute; top:200px; left:300px }
#companyList{ position:absolute; top:500px; left:300px }
#loginbox{ position:relative; top:200px; left:1160px; background-color: #F3F4F6; width: 300px; height:200px; }
#loginb{ width:115px; height:35px; position:absolute; background-color: #3498DB; top:95px; left:160px; border-radius: 4px; font-size: 13px; font-family: "Malgun Gothic"; color:white}
#apply{ width:115px; height:35px; position:absolute; background-color: #3498DB; top:95px; left:25px; border-radius: 4px; font-size: 13px; font-family: "Malgun Gothic"; color:white}
#appli{position:absolute; top:65px; left:112px}
#logout{ width:250px; height:35px; position:absolute; background-color: #E0E0E0; top:145px; left:25px; border-radius: 4px; font-size: 13px; font-family: "Malgun Gothic"}
#footer{ position:absolute; top:1400px; left:-20px }
#abs {position:absolute; top:290px; left:300px}
#headerWrap{ top:-200px; left:-100px; position:absolute }
#named{ position:absolute; top:40px; left:115px; background-color:transparent;  border:none; width:50px; text-align:center; font-size: 17px }
#lab{ position:absolute; top:38px; left:170px; width:30px; text-align:left; font-size: 17px }

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

<!-- jQuery CDN 시작 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<!-- jQuery CDN 끝 -->

<%

JobDAO jDAO=new JobDAO();
List<CompanyVO> list = jDAO.selectMain();

pageContext.setAttribute("corpList", list);

String userName="";
//System.out.println("1.==sesVO is ==============="+session.getAttribute("sesVO") );
// 페이지가 응답되면 가장먼저 세션의 값을 가져온다.
if(session.getAttribute("sesVO")==null) { // 정상적인 접근이라면 세션에 저장된 VO가 있을텐데 만약 세션의 값이 없다면(=null이라면) 로그인 창으로 보낸다.
	%>
	<script type="text/javascript">
	alert("로그인 후 이용해 주세요.");
	location.href="http://localhost/prj2/project_user/2.join/login.jsp";
	</script>  
	<%															//로그인 창으로 보내는 예시
}else { // 세션의 값을 불렀는데 null이 아니다 (= 세션에 값이 있다 ) => 세션에 저장할 때는 로그인 할 때 밖에 없으니까 세션에 값이 있다는 것 자체가 정상적인 접근이다.
	LoginResultVO lrVO=(LoginResultVO)session.getAttribute("sesVO");  //세션의 값을 lrVO에 담아준다.
	userName=lrVO.getName(); //lrVO안의 이름을 꺼내서 보여준다.
}//end else
%>

<script type="text/javascript">

$(function() {
	$("#apply").click(function() {
		location.href="http://localhost/prj2/project_user/4.resume/job_application.jsp";
	});//click
	
	$("#searchBtn").click(function() {
		if($("#stext").val() == "") {
			alert("검색어를 입력해 주세요.");
			return;
		}//end if
		$("#searchFrm").submit();
	});//click stext
	
	
});//ready


	
function logout() {
	location.href="main_page.jsp";
}//logout

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
            <h1 class="jkLogo" >
                        <a href="http://localhost/prj2/project_user/1.main/main_page_loged.jsp"><img id="jkLogo" src="http://localhost/prj2/images/devplanet_big.png" /></a>
            </h1>
        </div>
        <!-- headInner // -->

        <div id="headNavBar" class="headNavBar">
            <div class="navInner">

<!-- 전체보기 버튼 클릭시 active 클래스 추가 -->
<div class="allArea">
    <h2 class="skip">전체서비스</h2>
    <button type="button"  class="btnAllService" onclick="GA_Event('공통_PC', 'gnb', '전체서비스');"><span class="spGnb"><span class="txIr">전체서비스 열기</span></span></button>
    <!-- // 전체보기 레이어 -->
    <div class="lyNavArea" id="devGnbAllServiceMenu"></div>
    <!-- 전체보기 레이어 // -->
</div>

                <div class="jkNavArea">
                    <h2 class="skip">주요서비스</h2>
                    <ul class="serviceNav">

                        <!-- 메뉴 활성화 클래스 navFixed 마우스 오버시 active 클래스 추가 -->
                        <li id="gnbGi" class="navItem gi ">
                            <a href="http://localhost/prj2/project_user/6.recruit/adPage.jsp" class="linkItem" ><span class="spNav"><span class="txIr">채용정보</span></span></a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- 네비바 끝  -->

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
 
 <input type="text" id="named" readonly="readonly" value="<%= userName%>"/><label id="lab">님</label>
 <span id="appli"><a href="http://localhost/prj2/project_user/5.memberInfo/confrimInfo.jsp">회원정보 수정</a></span>
 <a href="http://localhost/prj2/project_user/4.resume/resume_present.jsp"><button type="button" id="loginb"><strong>이력서 현황</strong></button></a>
 <button type="button" id="apply"><strong>지원 현황</strong></button>
 <button type="button" id="logout" onclick="logout()">로그아웃</button>
 
 
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

</div>


</body>
</html>