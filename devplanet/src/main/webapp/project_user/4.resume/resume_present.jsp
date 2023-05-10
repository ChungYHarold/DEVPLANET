<!-- 검색 -->
<!-- footer시작, menubar시작 --><!--// GNB 개편 시작 -->	<!-- wrap 이력서 현황부분 -->
<!-- 검색 -->
<%@page import="kr.co.sist.user.vo.CompanyVO"%>
<%@page import="kr.co.sist.user.dao.JobDAO"%>
<%@page import="kr.co.sist.user.vo.LoginResultVO"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.SQLException"%>
<%@page import="kr.co.sist.user.vo.ResumeListVO"%>
<%@page import="kr.co.sist.user.dao.ResumeDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>



<!DOCTYPE html>
<html lang="ko">
<head>
<title>이력서 현황│잡코리아</title>

<!-- session 시작 -->
<%
JobDAO jDAO=new JobDAO();

String userId="";
// 페이지가 응답되면 가장먼저 세션의 값을 가져온다.
if(session.getAttribute("sesVO")==null) { // 정상적인 접근이라면 세션에 저장된 VO가 있을텐데 만약 세션의 값이 없다면(=null이라면) 로그인 창으로 보낸다.
	%>
	<script type="text/javascript">
	alert("로그인 후 이용해 주세요.");
	location.href="http://localhost/prj2/project_user/2.join/login.jsp";
	</script>  
	<%															
} else { // 세션의 값을 불렀는데 null이 아니다 (= 세션에 값이 있다 ) => 세션에 저장할 때는 로그인 할 때 밖에 없으니까 세션에 값이 있다는 것 자체가 정상적인 접근이다.
	LoginResultVO lrVO=(LoginResultVO)session.getAttribute("sesVO");  //세션의 값을 lrVO에 담아준다.
	userId=lrVO.getUserId(); //lrVO안의 이름을 꺼내서 보여준다.
}//end else
%>
<!-- session 끝 -->

<!-- jQuery CDN 시작 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<!-- jQuery CDN 끝 -->

<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />

<link rel="SHORTCUT ICON"
	href="//www.jobkorea.co.kr/favicon.ico?v1904091400">

<link rel="canonical" href="https://www.jobkorea.co.kr" />
<link rel="alternate" href="https://m.jobkorea.co.kr"
	media="only screen and (max-width: 640px)" />
<link rel="alternate" href="ios-app://569092652/https/m.jobkorea.co.kr" />
<link rel="alternate"
	href="android-app://com.jobkorea.app/https/m.jobkorea.co.kr" />



<meta name="title" content="이력서 관리│잡코리아">
<meta name="writer" content="잡코리아">
<meta name="description" content="나만의 강점을 어필하는 이력서를 작성해보세요.">
<meta name="keywords"
	content="jobkorea, 구인, 구직, 취업, 등록, 신문기사, 고용, 대기업, 채용, 기업, 검색, 컴퓨터, 정보통신, 웹마스터, 네트웍, 서버관리, 웹 디자인, 웹 마케팅, 컨텐트개발, 정보검색/사서직, 인터넷영업, 서버구축, 데이터베이스, 디자인, 편집디자인, MAC 편집, 제품 디자인, 산업 디자인, CAD, CAM, 웹 디자인, 캐릭터, 애니메이션, 프로그래머, 정보제공(IP/CP), 기술 영업, 통신 기술, 시스템 분석/설계, 정보통신강사, 하드웨어, 사무직, 관리직, 경리, 회계, 재무, 마케팅, 영업, 무역, 해외영업, 사무직, 기획, 총무, 인사, 홍보, 비서직, 프리랜서/아르바이트, 장애인, 외국인업체, 자원봉사, 노무직,잡코리아, JOKOREA, 헤드헌팅, 파견·대행, 아웃소싱, 인재파견, 채용대행, 위탁도급, 파견임시, 교육, 교육과정, 교육정보, 교육기관, 취업박람회, 채용박람회" />
<meta name="verify-v1"
	content="wfOOCE9Vtx+Z5etOXJnS9LU03yGpBxkK74T/yU63Xqs=">

<meta name="Robots" content="noindex,nofollow">


<meta property="og:site_name" content="이력서 관리│잡코리아" />
<meta property="og:title" content="이력서 관리│잡코리아" />
<meta property="og:description" content="나만의 강점을 어필하는 이력서를 작성해보세요." />
<meta property="og:image"
	content="//file1.jobkorea.co.kr/banner/share/share_img_01.png" />
<meta property="og:url" content="https://www.jobkorea.co.kr" />
<meta property="og:type" content="website" />





<style>
.async-hide {
	opacity: 0 !important
}
p{
	color: #39f!important;
	font-size: 20px;

}
</style>



<link
	href="//i.jobkorea.kr/content/css/ver_2/event/banner.promotion-sv-202211241151.css"
	rel="stylesheet" type="text/css" />

<link
	href="//i.jobkorea.kr/content/css/ver_2/common-sv-202302221621.css"
	rel="stylesheet" type="text/css" />
<link
	href="//i.jobkorea.kr/content/css/ver_2/gnb/gnb-sv-202302271621.css"
	rel="stylesheet" type="text/css" />
<link
	href="//i.jobkorea.kr/deploy/pc/dist/css/mtu/mtu_common-sv-202111021410.css"
	rel="stylesheet" type="text/css" />
<link
	href="//i.jobkorea.kr/content/css/ver_2/mtu/mtu_tpl-sv-202006091259.css"
	rel="stylesheet" type="text/css" />
<link
	href="//i.jobkorea.kr/content/css/ver_2/mtu/mtu_style-sv-202302271621.css"
	rel="stylesheet" type="text/css" />
<link
	href="//i.jobkorea.kr/deploy/pc/dist/css/mtu/mtu_popup-sv-202302171313.css"
	rel="stylesheet" type="text/css" />
<link
	href="//i.jobkorea.kr/content/css/components/notification/1.0.0/notification-sv-202005061649.css"
	rel="stylesheet" type="text/css" />
<link
	href="//i.jobkorea.kr/content/css/ver_2/text_user/resume/popup.email-sv-202005061649.css"
	rel="stylesheet" type="text/css" />
<link
	href="//i.jobkorea.kr/deploy/pc/dist/css/personal/layout/footer-sv-202301261521.css"
	rel="stylesheet" type="text/css" />
<link
	href="//i.jobkorea.kr/deploy/pc/dist/css/components/tooltip.css?v=202302281400"
	rel="stylesheet" type="text/css" />

<link
	href="//i.jobkorea.kr/content/css/ver_2/mtu/mtu_popup-sv-202212281122.css"
	rel="stylesheet" type="text/css" />

<!--[if lt IE 9]>
        <script src="https://i.jobkorea.kr/content/js/html5shiv.min.js"></script>
    <![endif]-->

<script
	src="/NET/bundles/jquery?v=FVs3ACwOLIVInrAl5sdzR2jrCDmVOWFbZMY6g6Q0ulE1"></script>

<script
	src="/NET/bundles/backbone?v=v0-3Qm9SB2AUlk_aeK9GniBVmVTE9yxsGpDYtXZWlYU1"></script>

<script type="text/javascript" src="/Scripts/jquery.cookie.min.js"></script>
<script type="text/javascript"
	src="https://i.jobkorea.kr/content/js/jk_uit.js?202302281400"></script>
<script
	src="//i.jobkorea.kr/content/js/swiper-4.3.3.min.js?v=202302281400"
	type="text/javascript"></script>
<script type="text/javascript"
	src="https://i.jobkorea.kr/content/js/uit_mypage.js?202302281400"></script>
<script type="text/javascript"
	src="https://i.jobkorea.kr/content/js/starter/jquery.nanoscroller.js?202302281400"></script>
<script type="text/javascript"
	src="https://i.jobkorea.kr/content/js/sidebar.min.js?202302281400"></script>


</head>
<body id="secMtu">

	<div id="skipNavigation">
		<p>
			<a href="#container">메뉴 건너뛰기</a>
		</p>
	</div>
	<hr />

	<!--// GNB 개편 시작 -->
	<div id="headerWrap" class="gnbTheme1200 devGnbContainer ">
		<div id="header" class="">
			<!--신입공채 메뉴일경우 클래스 start-sub 추가 -->
			<!-- // headInner -->
			<div class="headInner">
				<h1 class="jkLogo" >
					<a href="http://localhost/prj2/project_user/1.main/main_page_loged.jsp"><img
						src="http://localhost/prj2/images/devplanet_logo.png"
						alt="JOBKOREA"></a>
				</h1>

			</div>
			<!-- headInner // -->
			
			<div id="headNavBar" class="headNavBar">
				<div class="navInner">

					<div class="allArea">
						<h2 class="skip">전체서비스</h2>
						<button type="button" class="btnAllService">
							<span class="spGnb"><span class="txIr">전체서비스 열기</span></span>
						</button>
						<!-- // 전체보기 레이어 -->
						<div class="lyNavArea" id="devGnbAllServiceMenu"></div>
						<!-- 전체보기 레이어 // -->
					</div>

					<div class="jkNavArea">
						<h2 class="skip">주요서비스</h2>
						<ul class="serviceNav">

							<!-- 채용정보 버튼 -->
							<li id="gnbGi" class="navItem gi ">
							<a href="" class="linkItem"><span class="spNav"><span class="txIr">채용정보</span></span></a> <!-- // 채용정보 레이어 -->
								<div class="lyNavArea">
								</div> <!-- 채용정보 레이어 // --></li>
						</ul>
					</div>

				</div>
			</div>
		</div>
	</div>

	<div class="jkNavDimm"></div>
	<!-- GNB 개편 끝 //-->

	<script
		src="/NET/bundles/jquery?v=FVs3ACwOLIVInrAl5sdzR2jrCDmVOWFbZMY6g6Q0ulE1"></script>

	<script
		src="/NET/bundles/backbone?v=v0-3Qm9SB2AUlk_aeK9GniBVmVTE9yxsGpDYtXZWlYU1"></script>

	<script
		src="/NET/bundles/Gnb?v=qmiTZhA3rdSyWmrFGLLcawPSYpJ4KyrIXD-Y53QTRQs1"></script>



	<script
		src="//i.jobkorea.kr/content/js/uit.carousel-sv-202005061649.js"
		type="text/javascript"></script>
	<script type="text/javascript" src="/Scripts/User/Mict.js?202302281400"></script>


	<!-- wrap 이력서 현황부분 -->
	<div id="wrap">
		<section id="container">
			<h1 class="skip">개인회원 서비스</h1>

			<section class="content">
				<script
					src="/NET/bundles/JK5cript?v=kt6fvRQVnlFhtrZQRB60lIBi5ru4auyenJ3cQsNF3hg1"></script>


				<div class="modal modal-spinner" role="dialog" aria-hidden="true"
					style="display: none;"></div>
				<div class="contWrap ResumeMngCont">

					<div class="hdWrap">
						<h2 class="hd_1">이력서 현황</h2>
					</div>



					<div class="btnBx">
						<a
							href="http://localhost/prj2/project_user/4.resume/resume_add.jsp"
							class="btn btnBl mtuSpImgBefore" target="_blank"><span>이력서
								등록</span></a>
					</div>

					<div class="tableList">
						<div>
							<div class="listSortArea">
								<div class="col col01">이력서 제목</div>
								<div class="col col02">이력서 관리</div>
							</div>
							
							
	<%
	ResumeDAO rDAO = new ResumeDAO();
	//지금은 session에서 가져온 값을 사용하고 있으므로 나중에 테스트 해보려면 맨 위에 session 스크립틀릿 주석처리하고 여기 풀어서 값 넣기
	/* String userId = "test777"; */
	List<ResumeListVO> list = null; 
	
	try{
		list = rDAO.selectResume(userId);
	}catch(SQLException se){
		se.printStackTrace();
	}//end catch
	
	pageContext.setAttribute("result", list);
	
	%>
	<!-- 이력서 제목 보여주기 -->
		<c:forEach var="val" items="${result}">
			<div class="mtuList">
				<ul>
					<li class=chk>
						<div class="col col01">
							<div class="tit">
								<p class="hd_1"><c:out value="${ val.title }"/></p>
							</div>
						</div>
						<div class="col col02">

							<div class="btnCell">
								<a class="btn"
									href="http://localhost/prj2/project_user/4.resume/resume_modify.jsp?rNum=${val.rNum} "target="_blank">수정</a>
							</div>
							<div class="btnCell">
								<a class="btn" href="http://localhost/prj2/project_user/4.resume/resume_presnet_delete.jsp?rNum=${val.rNum}">삭제</a>
							</div>

						</div>
					</li>
				</ul>
			</div>
		</c:forEach>

						<!-- TIP -->
						<div class="mtuTip">
							<strong class="skip">이용 TIP</strong>
							<ul class="tipList">
								<li>입사지원을 한 후 해당 이력서의 내용을 수정해도 <em>이전에 지원한 이력서의 내용은
										바뀌지 않으므로</em> 회사마다 이력서 내용을 다르게 지원할 수 있습니다.
								</li>
							</ul>
						</div>
						<div id="devResumeEmail" name="devResumeEmail"
							style="position: absolute; top: 100px; left: 70px; z-index: 9999; display: none;">
							<iframe id="devResumeEmailIfrm" name="devResumeEmailIfrm"
								width="593" height="450" marginwidth="0" marginheight="0"
								frameborder="no" scrolling="no" title="이력서 이메일전송 레이어"></iframe>
						</div>
					</div>

					<iframe id="frmFileDownload" style="display: none" title="빈 프레임"></iframe>

				</div>
			</section>
			<hr />


			<!-- menubar시작 -->
			<section class="secLnb">
				<h1 class="skip">개인회원 서비스 메뉴</h1>
				<div class="lnbGroup">
					<h2 class="lnbTit">
						<a href="http://localhost/prj2/project_user/1.main/main_page_loged.jsp">개인회원 홈</a>
					</h2>
				</div>
				<div class="lnbGroup">
					<h2 class="lnbTit">이력서 관리</h2>
					<ul>
						<li><a href="http://localhost/prj2/project_user/4.resume/resume_add.jsp" target="_blank">이력서 등록</a></li>
						<li><a class=on href="http://localhost/prj2/project_user/4.resume/resume_present.jsp">이력서 현황</a></li>
					</ul>
				</div>
				<div class="lnbGroup">
					<h2 class="lnbTit">입사지원 관리</h2>
					<ul>
						<li><a href="http://localhost/prj2/project_user/4.resume/job_application.jsp">입사지원 현황</a></li>
					</ul>
				</div>

				<div class="lnbGroup">
					<h2 class="lnbTit">회원정보 관리</h2>
					<ul>
						<li><a href="http://localhost/prj2/project_user/5.memberInfo/confrimInfo.jsp">회원정보 수정</a></li>
						<li><a href="http://localhost/prj2/project_user/5.memberInfo/confirmPass.jsp">비밀번호 변경</a></li>
					</ul>
				</div>
			</section>
			<hr>
			<!-- Lnb Area //-->
		</section>
	</div>
<br><br><br><br><br><br><br><br>
	<!-- footer 시작 -->
<div id="footer" class="footer footer--main">
    <div class="footer__wrap">
        <h2 class="skip">잡코리아 기타 정보</h2>

         <div>
                <p class="copyright">
            © <strong><a href="http://sist.co.kr/" target="_blank">DEVPLANET</a></strong> LLC. All rights reserved.
        </p>
            
        </div> 

         <div class="footer__service">
            <h3 class="blind">잡코리아 서비스 링크</h3>
            <ul>
                <li><a href="http://211.63.89.139/prj3/project_user/1.main/main_page.jsp" target="_blank">회사소개</a></li>
                <li><a href="https://www.jobkorea.co.kr/service_jk/provision/provision_gg.asp" target="_blank">이용약관</a></li>
                <li><a href="https://www.jobkorea.co.kr/service/PolicyPrivacy" target="_blank"><strong>개인정보처리방침</strong></a></li>
            </ul>
        </div>  
        
    </div>
</div>
<!-- footer 끝 -->

</body>

</html>