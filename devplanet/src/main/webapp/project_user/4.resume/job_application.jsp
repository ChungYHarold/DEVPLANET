<%@page import="java.sql.SQLException"%>
<%@page import="kr.co.sist.user.vo.CountNumVO"%>
<%@page import="kr.co.sist.user.dao.ApplicationDAO"%>
<%@page import="java.util.List"%>
<%@page import="kr.co.sist.user.vo.UserApplyVO"%>
<%@page import="kr.co.sist.user.vo.OptionVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<title>입사지원 현황│잡코리아</title>
<!-- jQuery CDN 시작 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<!-- jQuery CDN 끝 -->

<%@ include file="checkLogin.jsp" %>

<%
// select main
try{
	
ApplicationDAO aDAO=new ApplicationDAO();
LoginResultVO lrVO=(LoginResultVO)session.getAttribute("sesVO");
String id=lrVO.getUserId();

OptionVO oVO=new OptionVO();
oVO.setUserId(id);
String name="";

if(request.getParameter("searchText")==null || request.getParameter("searchText").equals("")){
	oVO.setCorpName("all");
}else {
oVO.setCorpName(request.getParameter("searchText"));
}//end else

oVO.setProgress(request.getParameter("progress"));
oVO.setReadState(request.getParameter("readState") );
oVO.setCancel(request.getParameter("cancel"));


List<UserApplyVO> list= aDAO.selectMain(oVO);
pageContext.setAttribute("applyList", list);
//select main

CountNumVO cnVO=aDAO.selectCount(id);
int unread=cnVO.getApplyState();
int read=cnVO.getRead();

int apply=aDAO.selectCountApply(id);

pageContext.setAttribute("unread", unread);
pageContext.setAttribute("read", read);
pageContext.setAttribute("apply", apply);




}catch(NullPointerException ne) {
	ne.printStackTrace();
	String msg="<script>alert('로그인 후 이용해 주세요');  location.href='http://localhost/prj2/project_user/2.join/login.jsp'</script>";
	out.print(msg);
}catch(SQLException se) {
	se.printStackTrace();
}//end catch


%>


<script type="text/javascript">
$(function(){
	
	$("#btnSearch").click(function(){
		$("#frm").submit();
	});//click
	
	
	
	
});//ready
</script>
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

<style>
.async-hide {
	opacity: 0 !important
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
	href="//i.jobkorea.kr/deploy/pc/dist/css/personal/layout/footer-sv-202301261521.css"
	rel="stylesheet" type="text/css" />
<link
	href="//i.jobkorea.kr/deploy/pc/dist/css/components/tooltip.css?v=202302281400"
	rel="stylesheet" type="text/css" />

<link
	href="//i.jobkorea.kr/content/css/ver_2/mtu/mtu_popup-sv-202212281122.css"
	rel="stylesheet" type="text/css" />





<style>
.user-table .table .apply-progress .offer {
	position: relative;
	display: inline-block;
	margin-top: 10px;
	font-size: 12px;
	color: #333;
	font-weight: bold;
	text-decoration: underline;
}
</style>

<style type="text/css">
th, tr {
	border: 1px solid #323743;
	border: none;
	height: 30px;
	border-bottom: 0.5px solid #CCC;
	text-align: center;
}

td {
	text-align: center;
	font-family: 맑은 고딕;
	font-size: 14px;
	border-bottom: 0.2px solid #CCC
}

.chart_table {
	border: 1.5px solid #CCC;
	border-spacing: 0px;
}

.top {
	background-color: #323743;
}

.delete {
	border: none;
	width: 40px;
	height: 25px;
	background-color: transparent;
	cursor: pointer
}

.chart {
	top: 320px;
	left: 50px;
	width: 900px;
	height: 300px;
	background-color: #E0E0E0;
}
</style>

</head>

<body id="secMtu">
	<hr />


	<!--// GNB 개편 시작 -->
	<div id="headerWrap" class="gnbTheme1200 devGnbContainer ">
		<div id="header" class="">
			<!--신입공채 메뉴일경우 클래스 start-sub 추가 -->
			<!-- // headInner -->
			<div class="headInner">
				<h1 class="jkLogo">
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
							<li id="gnbGi" class="navItem gi "><a
								href="https://www.jobkorea.co.kr/recruit/joblist?menucode=local&localorder=1"
								class="linkItem"><span
									class="spNav"><span class="txIr">채용정보</span></span></a> <!-- // 채용정보 레이어 -->
								<div class="lyNavArea"></div> <!-- 채용정보 레이어 // --></li>
						</ul>
					</div>

				</div>
			</div>
		</div>
	</div>

	<div class="jkNavDimm"></div>
	<!-- GNB 개편 끝 //-->

	
	<!-- wrap 이력서 현황부분 -->
	<div id="wrap">
		<section id="container">
			<h1 class="skip">개인회원 서비스</h1>

			<section class="content">

				<div class="contWrap applyCont">
					<div class="hdWrap">
						<h2 class="hd_1">입사지원 현황</h2>
					</div>

					<h2 class="skip">입사지원 현황</h2>
					<div id="devInterview" name="devInterview"
						style="position: absolute; left: 17%; z-index: 15000; display: none;">
						<iframe id="IfrmInterview" name="IfrmInterview" width="485"
							height="640" marginwidth="0" marginheight="0" frameborder="no"
							scrolling="no" title="인터뷰"></iframe>
					</div>
					<div class="applyStatus">
						<ul class="clear">
							<li>
								<p class="num">${ apply }</p>
								<p class="txt">지원완료</p>
							</li>
							<li>
								<p class="num">${ read }</p>
								<p class="txt">열람</p>
							</li>
							<li>
								<p class="num">${ unread }</p>
								<p class="txt">미열람</p>
							</li>
						</ul>
					</div>
					<h3 class="skip">지원완료</h3>
					<!-- [개발] 타이틀 추가 : 지원완료/지원취소/인재풀등록 -->

					<form name="frm" id="frm" method="get" action="">
						
						<div class="mtuSortArea schFillter">
							<div class="left">
								<div class="down">
									<label class="skip">키워드</label> <span class="formBx"> <!-- [개발] .ipGp/.placeholder 추가 -->
										<span class="ipGp"> 
										<input class="ipTxt ipSearch" type="text" name="searchText" id="searchText"
											title="검색어 입력" placeholder="기업명">
									</span>
									</span>
									<div class="mtcListFillter">
										<!-- 버튼 클릭했을경우 on 클래스 추가, 추가시 lyItems 레이어 영역 display:block 적용됩니다 -->
										<label>진행여부</label>
										<div class="lyTplArea">
											<select title="진행여부" name="progress" id="progress" 
												class="ipSelect ipSelect_1" onchange=""
												style="height: 40px;">
												<option value="all">전체</option>
												<option value="ing">진행중</option>
												<option value="end">마감</option>
											</select>
										</div>
									</div>
									<div class="mtcListFillter">
										<label>열람여부</label>
										<div class="lyTplArea">
											<select title="열람여부" name="readState" id="readState" 
												class="ipSelect ipSelect_1" onchange=""
												style="height: 40px;">
												<option value="all">전체</option>
												<option value="rd">열람</option>
												<option value="urd">미열람</option>
											</select>
										</div>
									</div>
									<div class="mtcListFillter status">
										<label>지원상태</label>
										<!-- 버튼 클릭했을경우 on 클래스 추가, 추가시 lyItems 레이어 영역 display:block 적용됩니다 -->
										<div class="lyTplArea">
											<select title="지원상태" name="cancel" id="cancel"
												class="ipSelect ipSelect_1" onchange=""
												style="height: 40px;">
												<option value="all">전체</option>
												<option value="nc">지원완료</option>
												<option value="c">지원취소</option>
											</select>
										</div>
									</div>
								</div>
							</div>
							<div class="right">
								<span class="formBx">
									<button type="button" class="btn btnSearch" id="btnSearch"
											>
										<span>검색</span>
									</button>
								</span>
							</div>
						</div>
					</form>



					<!-- 이거 스타일 복붙하시고 전체 스타일 다 적은거라 찾아보시고 삭제 해도 됩니다. -->


					<!-- 이게 표이긴 한데 이 표를 div로 감싸서 사용하시는게 편하실거에요 -->
					<div>
					
					<table class="chart_table">
						<colgroup>
							<col style="width: 2%">
							<col style="width: 6%">
							<col style="width: 8%">
							<col style="width: 6%">
							<col style="width: 6%">
							<col style="width: 6%">
						</colgroup>
						<thead>
							<tr class="top">
								<th scope="col"><font color="#FFF">번호</font></th>
								<th scope="col"><font color="#FFF">지업한 기업</font></th>
								<th scope="col"><font color="#FFF">채용제목</font></th>
								<th scope="col"><font color="#FFF">열람여부</font></th>
								<th scope="col"><font color="#FFF">지원상태</font></th>
								<th scope="col"><font color="#FFF">진행여부</font></th>
							</tr>
						</thead>

						<tbody>
						<c:forEach varStatus="i" var="applyList" items="${ applyList }" >
						<input type="hidden" id="jobNum" name="jobNum" value="${ applyList.jobNum }">
							<tr>
								<td name="num">${ i.count }</td>
								<td name="companyName">${ applyList.companyName }</td>
								<td name="title"><a href="http://localhost/prj2/project_user/7.apply/company.jsp?name=${ applyList.companyName }&jobNum=${ applyList.jobNum }" target="blank">${ applyList.title }</a></td>
								<td name="readState">${ applyList.readState eq "RD"? "열람":"미열람" }</td>
								<td name="applyState">${ applyList.applyState eq "NC"?"지원완료":"지원취소" }</td>
								<td name="progress">${ applyList.progress < 0 ?"진행중":"마감" }</td>
							</tr>
							</c:forEach>
						</tbody>

					</table>
					</div>
					<div class="mtuTip">
						<strong class="skip">이용 TIP</strong>
						<ul class="tipList">
							<li>입사지원을 한 후 해당 이력서를 수정해도 <em>이전에 지원한 이력서의 내용은 바뀌지
									않으므로</em> 회사마다 이력서 내용을 다르게 지원할 수 있습니다.
							</li>
							<li>입사지원 내역을 삭제한 경우 지원내역, 지원취소, 열람여부 확인이 불가능합니다.</li>
							<li>지원취소 시 지원한 회사에서 이력서를 열람할 수 없으며, 취업활동 증명서 조회도 불가능합니다.</li>
							<li>기업에 별도의 채용서류를 제출 했다면, 채용 여부 확정 후 서류 반환 요청을 할 수 있습니다.
							<li>지원이력서에 포함된 첨부파일은 채용공고 접수마감일로부터 90일간 확인 가능합니다.</li>
						</ul>
					</div>
				</div>


			</section>
			<hr />



			<!-- menubar시작 -->
			<section class="secLnb">
				<h1 class="skip">개인회원 서비스 메뉴</h1>
				<div class="lnbGroup">
					<h2 class="lnbTit">
						<a href="/User/MyPage">개인회원 홈</a>
					</h2>
				</div>
				<div class="lnbGroup">
					<h2 class="lnbTit">이력서 관리</h2>
					<ul>
						<li><a
							href="http://localhost/prj2/project_user/4.resume/resume_add.jsp"
							target="_blank">이력서 등록</a></li>
						<li><a
							href="http://localhost/prj2/project_user/4.resume/resume_present.jsp">이력서
								현황</a></li>
					</ul>
				</div>
				<div class="lnbGroup">
					<h2 class="lnbTit">입사지원 관리</h2>
					<ul>
						<li><a class=on
							href="http://localhost/prj2/project_user/4.resume/job_application.jsp">입사지원 현황</a></li>
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