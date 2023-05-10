<%@page import="kr.co.sist.util.cipher.DataDecrypt"%>
<%@page import="kr.co.sist.admin.vo.ResumeInfoVO"%>
<%@page import="kr.co.sist.admin.dao.ApplyDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="kr.co.sist.admin.vo.LanguageVO"%>
<%@page import="kr.co.sist.admin.vo.CertificateVO"%>
<%@page import="kr.co.sist.admin.vo.EducationVO"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ include file="check_login.jsp" %>
    
<html lang="ko">
<head>
<meta charset="utf-8">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge; chrome=1">
<title>이력서 보기</title>
<!-- jQuery CDN 시작 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<!-- jQuery CDN 끝 -->
<link rel="stylesheet"
	href="https://i.jobkorea.kr/content/css/ver_2/text_user/resume/view.event.css?ver=20171221122412">
<link
	href="//i.jobkorea.kr/deploy/pc/dist/css/event/2022/tvc/tvc2022_4-sv-202212141417.css"
	rel="stylesheet" type="text/css">

<link rel="stylesheet"
	href="https://i.jobkorea.kr/content/css/ver_2/common.css?ver=202302281400">
<link rel="stylesheet"
	href="https://i.jobkorea.kr/content/css/ver_2/text_user/resume/header.css?ver=201907181400">
<link rel="stylesheet"
	href="https://i.jobkorea.kr/content/css/ver_2/text_user/resume/view.css?ver=202302281400">


<script
	src="https://teralog.techhub.co.kr/trk?la_tp=pv&amp;la_gc=TR10148105490&amp;la_uid=58581512018013461.1677670616551&amp;la_fid=99da7dbc1de07ca245bd2ef1ed9b4c7d&amp;la_sid=58581670200001134.1677670616551&amp;la_infl=15.0.0.0.null.null.null.0&amp;la_pa1=3.460.693.0.336d5ebc5436534e61d16e63ddfca327.945ba1c409067ba8fd46069ef53273f0.null.58581481200001134&amp;la_pa2=3.460.693.0.336d5ebc5436534e61d16e63ddfca327.945ba1c409067ba8fd46069ef53273f0.null.58581481200001134&amp;la_dccs=UTF-8&amp;la_r=707488049&amp;la_crsd_gc=&amp;la_sv=59647be&amp;la_dcrf=INTNL_REF&amp;la_dcurl=https%3A%2F%2Fwww.jobkorea.co.kr%2FUser%2FResume%2FView%3FrNo%3D18271447&amp;la_dcttl=%EC%9D%B4%EB%A0%A5%EC%84%9C%20%EB%B3%B4%EA%B8%B0&amp;la_ib=&amp;la_is=&amp;la_callback=_LA.CB"></script>
<script src="https://teralog.techhub.co.kr/ckie"></script>
<script async="" src="https://www.google-analytics.com/analytics.js"></script>
<script
	src="https://connect.facebook.net/signals/config/1166416616740867?v=2.9.97&amp;r=stable"
	async=""></script>
<script async="" src="https://connect.facebook.net/en_US/fbevents.js"></script>
<script
	src="https://sas.nsm-corp.com/sa-w.js?gc=TR10148105490&amp;rd=1677670628154"></script>
<script
	src="https://partner.googleadservices.com/gampad/cookie.js?domain=www.jobkorea.co.kr&amp;callback=_gfp_s_&amp;client=ca-pub-2252464458280030&amp;cookie=ID%3Dbb40f476a84b2f57-22688f060dda0054%3AT%3D1676882027%3ART%3D1676882027%3AS%3DALNI_Mbh2pu8KM-AxEB-GWBJtxHzh8Bvpg&amp;gpic=UID%3D00000bc7763afa66%3AT%3D1676882027%3ART%3D1677670611%3AS%3DALNI_MabhmmT-imjVXY1rjGIZg4bU4KOVw"></script>
<script type="text/javascript" async=""
	src="https://www.googletagmanager.com/gtag/js?id=G-GQWHSF87P4&amp;l=dataLayer&amp;cx=c"></script>
<script type="text/javascript" async=""
	src="https://www.google-analytics.com/analytics.js"></script>
<script
	src="https://pagead2.googlesyndication.com/pagead/managed/js/adsense/m202302140101/show_ads_impl_fy2021.js"
	id="google_shimpl"></script>
<script type="text/javascript"
	src="https://js.appboycdn.com/web-sdk/3.5/appboy.min.js" async=""></script>
<script async=""
	src="https://www.googletagmanager.com/gtm.js?id=GTM-WL56D3L"></script>
<script type="text/javascript"
	src="/resources/lib/datastory/dslog.js?ver=1.1" id="dslog_tag"></script>


<meta http-equiv="origin-trial"
	content="Az6AfRvI8mo7yiW5fLfj04W21t0ig6aMsGYpIqMTaX60H+b0DkO1uDr+7BrzMcimWzv/X7SXR8jI+uvbV0IJlwYAAACFeyJvcmlnaW4iOiJodHRwczovL2RvdWJsZWNsaWNrLm5ldDo0NDMiLCJmZWF0dXJlIjoiUHJpdmFjeVNhbmRib3hBZHNBUElzIiwiZXhwaXJ5IjoxNjgwNjUyNzk5LCJpc1N1YmRvbWFpbiI6dHJ1ZSwiaXNUaGlyZFBhcnR5Ijp0cnVlfQ==">
<meta http-equiv="origin-trial"
	content="A+USTya+tNvDPaxUgJooz+LaVk5hPoAxpLvSxjogX4Mk8awCTQ9iop6zJ9d5ldgU7WmHqBlnQB41LHHRFxoaBwoAAACLeyJvcmlnaW4iOiJodHRwczovL2dvb2dsZXN5bmRpY2F0aW9uLmNvbTo0NDMiLCJmZWF0dXJlIjoiUHJpdmFjeVNhbmRib3hBZHNBUElzIiwiZXhwaXJ5IjoxNjgwNjUyNzk5LCJpc1N1YmRvbWFpbiI6dHJ1ZSwiaXNUaGlyZFBhcnR5Ijp0cnVlfQ==">
<meta http-equiv="origin-trial"
	content="A7FovoGr67TUBYbnY+Z0IKoJbbmRmB8fCyirUGHavNDtD91CiGyHHSA2hDG9r9T3NjUKFi6egL3RbgTwhhcVDwUAAACLeyJvcmlnaW4iOiJodHRwczovL2dvb2dsZXRhZ3NlcnZpY2VzLmNvbTo0NDMiLCJmZWF0dXJlIjoiUHJpdmFjeVNhbmRib3hBZHNBUElzIiwiZXhwaXJ5IjoxNjgwNjUyNzk5LCJpc1N1YmRvbWFpbiI6dHJ1ZSwiaXNUaGlyZFBhcnR5Ijp0cnVlfQ==">
<link rel="stylesheet" href="https://use.fontawesome.com/7f85a56ba4.css">

<link rel="preload"
	href="https://adservice.google.co.kr/adsid/integrator.js?domain=www.jobkorea.co.kr"
	as="script">
<script type="text/javascript"
	src="https://adservice.google.co.kr/adsid/integrator.js?domain=www.jobkorea.co.kr"></script>
<link rel="preload"
	href="https://adservice.google.com/adsid/integrator.js?domain=www.jobkorea.co.kr"
	as="script">
<script type="text/javascript"
	src="https://adservice.google.com/adsid/integrator.js?domain=www.jobkorea.co.kr"></script>
<script type="text/javascript" src="//t1.daumcdn.net/adfit/static/kp.js"></script>
<script type="text/javascript"
	src="//dynamic.criteo.com/js/ld/ld.js?a=87221"></script>
<meta http-equiv="origin-trial"
	content="A9+ldib+sKhGj2FcIjq5GnvBZFuIiXID0+NkE6k7cEk71MhaHFGqo3wUlUFmZ6d9w0KPwx9UxGiCTYWtRnTGDQkAAACAeyJvcmlnaW4iOiJodHRwczovL2NyaXRlby5uZXQ6NDQzIiwiZmVhdHVyZSI6IlByaXZhY3lTYW5kYm94QWRzQVBJcyIsImV4cGlyeSI6MTY4MDY1Mjc5OSwiaXNTdWJkb21haW4iOnRydWUsImlzVGhpcmRQYXJ0eSI6dHJ1ZX0=">
<meta http-equiv="origin-trial"
	content="AzLNuh8GFzfIOcwvhEg7Ymr7YCzlYVTKeD7i2iETABbRf+sL2FAx+r+HlTtxSi1zgUFxBlJVoxgLjuhqiwTjAw4AAACAeyJvcmlnaW4iOiJodHRwczovL2NyaXRlby5jb206NDQzIiwiZmVhdHVyZSI6IlByaXZhY3lTYW5kYm94QWRzQVBJcyIsImV4cGlyeSI6MTY4MDY1Mjc5OSwiaXNTdWJkb21haW4iOnRydWUsImlzVGhpcmRQYXJ0eSI6dHJ1ZX0=">

<style>
.base{margin-bottom: 50px;}


.resumeHeader .container {
    position: relative;
    overflow: hidden;
    width: 980px;
    height: 34px;
    margin: 0 auto;
    text-align: left;
}

.list{
border-top: 1px solid #000;
}


.list div.item {
  
    border-top: 1px solid #edeef0;
  }
  
.profile .info-general {
    padding-top: 40px;
    margin-bottom: 13px;
    font-size: 0;
}


.table td {
    padding: 0 18px;
    border-bottom: 1px solid #edeef0;
    font-size: 16px;
    color: #000;
    text-align: left;
    -webkit-box-sizing: border-box;
    -moz-box-sizing: border-box;
    box-sizing: border-box;
}

.profile .info-detail .value {
    font-size: 16;
    color: #000;
    letter-spacing: 0;
}

.profile .info-detail .label .value{
    position: absolute;
    left: 0;
    top: 0;
    width: 68px;
    font-size: 16px;
    color: #888;
}

.profile .summary .description {
    margin-bottom: 5px;
    font-size: 16px;
    color: #000;
    line-height: 1.6;
}


.profile .info-detail .value {
    font-size: 16;
    color: #000;
    letter-spacing: 0;

}


.list.list-language .category { 
    display: inline-block;
    vertical-align: top;
    font-size: 16px;
    color: #000;
    font-weight: bold;
}


</style>

</head>

<!-- body시작 -->
<body class="resume resume-view vsc-initialized" style="">

 <%
   //아이디 - 세션??
    String id = request.getParameter("id");
   
    //공고번호
    int jobNum = Integer.parseInt(request.getParameter("jobNum"));
    
    //지원번호
    int applyNum = Integer.parseInt(request.getParameter("applyNum"));
    
   
    //변수 선언
    String skills = "";
    List<EducationVO> eduList = new ArrayList<EducationVO>();
    List<CertificateVO> certList = new ArrayList<CertificateVO>();
    List<LanguageVO> langList = new ArrayList<LanguageVO>();
    String schoolType="";
    String schoolName="";
    String major="";
    
    
    ApplyDAO aDAO = new ApplyDAO();
  
    
    try{ //복호화가 필요한 데이터: 회원정보(이름,전화번호,이메일,주소)
    
    	//회원 및 이력서 정보 셀렉
    	ResumeInfoVO rVO = aDAO.selectInfo(applyNum);
    
    
    
    	//복호화
		DataDecrypt dd=new DataDecrypt("FsRt4SfY4US0IWtK4JPJsw==");
	    
	    rVO.setName(dd.decryption( rVO.getName() ));
	    rVO.setTel(dd.decryption( rVO.getTel() ));
	    rVO.setEmail(dd.decryption( rVO.getEmail() ));
	    rVO.setAddr(dd.decryption( rVO.getAddr() ));
	    
	    
    	
    	//스킬 - csv로 합쳐서 출력하려고 VO말고 걍 String으로 받음
    	skills = aDAO.selectSkills(applyNum); //매개변수가 지원번호면 될거같은데
    	
    	
    	//자격증명
    	certList = aDAO.selectCertificates(applyNum);
    	
    	
    	//학력 - 조회결과 없으면 배열 길이가 0
    	eduList = aDAO.selectEudcations(applyNum);
    	
    	
    	
    	schoolType = eduList.get(0).getSchoolType();
    	schoolName = eduList.get(0).getSchoolName();
    	major = eduList.get(0).getMajor();
    	
    	
    	//어학
    	langList = aDAO.selectLanguages(applyNum);
    	System.out.println(langList.size());
    
        
    	
    	//업데이트 - 0 이상이면 성공!
    	int result = aDAO.updateReadState(applyNum);
      	
    
    	
    	
    	
    	
    	
    	
    	
    	
  	////////여기 전까지 모두 복화화된 상태여야함//////////////////////
    pageContext.setAttribute("rVO", rVO);
    pageContext.setAttribute("skills", skills);
    pageContext.setAttribute("eduList", eduList);
    pageContext.setAttribute("certList", certList);
    pageContext.setAttribute("langList", langList);
    pageContext.setAttribute("schoolType", schoolType);
    pageContext.setAttribute("schoolName", schoolName);
    pageContext.setAttribute("major", major);
    
    
    
    }catch(SQLException se){
    	se.printStackTrace();
    }//end catch
    
    
    %>


	<input type="hidden" name="M_ID" id="M_ID" value="">
	<input type="hidden" name="EventJoinYn" id="EventJoinYn" value="N">
	<input type="hidden" name="ResumeUpdateYn" id="ResumeUpdateYn"
		value="N">
	<input type="hidden" name="ResumeBtnClickYn" id="ResumeBtnClickYn"
		value="N">
	<div class="modal modal-spinner" role="dialog" aria-hidden="true"
		style="display: none;"></div>
	<div class="resume-view-page">
		<div class="resumeHeader">
			<div class="container">
				<a href="http://localhost/prj2/project_admin/1.mainAdmin/main.jsp" class="logo"><img
					src="http://localhost/prj2/images/devplanet_logo.png" style="width: 100px; height: auto;"
					alt="JOBKOREA"></a>
				<div class="links">
					<a href="#" onclick="location.href="
						class="link linkHome">지원자 현황</a>
				</div>
			</div>
		</div>
		<div class="resume-view-wrapper">
			<div class="resume-view-container">
				<div class="resume-subject"><strong><c:out value="${rVO.title}"/></strong></div><!--제목-->

				<div class="base profile image">
					<div class="container">
						<div class="photo">
						<!--이미지를 어떻게 가져와서 보여줄 것인가  -->
							<img name="user_photo"
								src="http://localhost/prj2/upload/${rVO.img}" alt="프로필"><!--이미지-->
						</div>
						<div class="info-container">
							<div class="info-general">
								<div class="item name"><c:out value="${rVO.name}"/></div><!--이름-->
								<div class="item sex"><c:out value="${rVO.gender == 'm' ? '남' : '여'}"/></div><!--성별-->
								<div class="item age"><c:out value="${rVO.birthDate}"/></div><!--생년월일-->
							</div>
							<div class="info-detail">
								<div class="item">
									<div class="label">Email</div>
									<div class="value">
										<c:out value="${rVO.email}"/><!--이메일-->
									</div>
								</div>
								<div class="item">
									<div class="label">전화번호</div>
									<div class="value"><c:out value="${rVO.tel}"/></div><!--전번-->
								</div>
								<div class="item item-full">
									<div class="label">주소</div>
									<div class="value"><c:out value="${rVO.addr}"/></div><!--주소-->
								</div>
							</div>
						</div>
					</div>


					<div class="summary col-4">

						<div class="item is-singleline newcomer">
							<div class="header">희망직무</div>
							<div class="description ellipsis">
							<c:out value="${rVO.job}"/>
							</div>
						</div>

						<div class="item is-singleline newcomer">
							<div class="header">경력</div>
							<div class="description"><c:out value="${rVO.career}"/></div><!--경력-->
						</div>

						<div class="item is-singleline newcomer">
							<div class="header">희망연봉</div>
							<div class="description"><c:out value="${rVO.sal}"/>만원</div><!--연봉-->
						</div>

						<div class="item is-singleline newcomer">
							<div class="header">희망근무지</div>
							<div class="description"><c:out value="${rVO.area}"/></div><!--지역-->
						</div>
					</div>
				</div>


				<div class="base skill">
				</div>

				<div class="base certificate">
					<c:if test="${not empty skills}">
					<h2 class="header">스킬</h2>
					<div class="list list-certificate" style="border-top: 1px solid #333; letter-spacing: 0px;">
						<div class="item pdf-page-break" style="padding-left:50px;">
							<div class="content">
								<div class="content-header">
									<div class="name" style="font-weight:normal"><strong><c:out value="${skills}"/></strong></div><!--스킬-->
								</div>
							</div>
						</div>
					</div>
					</c:if>
				</div>


				<div class="base education">
					<c:if test="${not empty eduList}">
					<h2 class="header">학력</h2>
					<div class="list list-education">
						<c:forEach var="eduVO" items="${eduList }">
						<div class="item">
							<div class="date">
								<div class="term"><c:out value="${eduVO.period}"/></div><!--재학기간-->
							</div>
							<div class="content">
								<div class="content-header">
									<div class="name"><c:out value="${eduVO.schoolName}"/></div><!--학교명-->
									<div class="line"><c:out value="${eduVO.major}"/>&nbsp;&nbsp;&nbsp;[<c:out value="${eduVO.schoolType}"/>]</div><!--전공 & 학교구분-->
								</div>
								<div class="content-body">
									<div class="info">
										<div class="item">
											<div class="label">학점</div>
											<div class="value"><c:out value="${eduVO.gpa}"/></div><!--학점-->
										</div>

									</div>
								</div>
							</div>
						</div>
						</c:forEach>
					</div>
					</c:if>
				</div>


				<div class="base certificate">
					<c:if test="${not empty certList}">
					<h2 class="header">자격증</h2>
					
					<div class="list list-certificate">
					<c:forEach var="cVO" items="${certList}">
						<div class="item pdf-page-break" style="padding-left:170px;">
							<div class="date"><c:out value="${cVO.getDate}"/></div><!--취득일-->
							<div class="content">
								<div class="content-header">
									<div class="name" style="font-weight:normal"><c:out value="${cVO.name}"/></div><!--자격증명-->
									<div class="agency"><c:out value="${cVO.issuer}"/></div><!--발행처-->
								</div>
							</div>
						</div>
					</c:forEach>
					</div>
					</c:if>
				</div>



				<div class="base language">
					<c:if test="${not empty langList}">
					<h2 class="header">어학</h2>
					<div class="list list-language">

					<c:forEach var="langVO" items="${langList}">
						<div class="item pdf-page-break">
							<div class="language"><c:out value="${langVO.name}"/></div><!--어학명-->
							<div class="content">
								<div class="content-header">
									<div class="category"><c:out value="${langVO.testName}"/> <c:out value="${langVO.score}"/></div><!--시험명/점수-->
									<div class="passdate">
										(취득일 : <span><c:out value="${langVO.getDate}"/></span>)<!--취득일-->
									</div>
								</div>
							</div>
						</div>
					</c:forEach>
					</div>
					</c:if>
				</div>



				<div class="base hopework" id="js-hopeworkAnchor" >
					<h2 class="header">희망근무조건</h2>
					<table class="table table-hopework" style="border-top: 1px solid #333;">
						<tbody>
							<tr>
								<th scope="row">고용형태</th>
								<td><c:out value="${rVO.empform}"/></td><!--고용형태-->
							</tr>
							<tr>
								<th scope="row">희망근무지</th>
								<td><c:out value="${rVO.area}"/></td><!--지역-->
							</tr>
							<tr>
								<th scope="row">희망연봉</th>
								<td><c:out value="${rVO.sal}"/></td><!--연봉-->
							</tr>
							<tr>
								<th scope="row">경력사항</th>
								<td><c:out value="${rVO.career}"/></td><!--경력-->
							</tr>
							<tr>
								<th scope="row">희망직무</th>
								<td><c:out value="${rVO.job}"/></td><!--희망직무-->
							</tr>
						</tbody>
					</table>
					<button type="button"
							onclick="history.back()" 							
							style="height: 80px; width: 200px; border: 1px solid #999999; margin-top: 20px; margin-bottom: 20px; background: #3399FF; border-radius: 10px; float: right;">
							<span style="font-size: 20px; color: #FFFFFF; font-weight: bold;">목록</span>
						</button>
				</div>


				<div class="sign">
					<div class="message">위의 모든 기재사항은 사실과 다름없음을 확인합니다.</div>

					<div class="writer">작성자: <c:out value="${rVO.name}"/></div>
					<div class="warning">
						<div class="description">
							위조된 문서를 등록하여
							취업활동에 이용 시 법적 책임을 지게 될 수 있습니다.<br>데브플래닛(유)은 구직자가 등록 한 문서에 대해
							보증하거나 별도의 책임을 지지 않으며<br>첨부된 문서를 신뢰하여 발생한 법적 분쟁에 책임을 지지 않습니다.<br>또한
							구인/구직 목적 외 다른 목적으로 이용시 이력서 삭제 혹은 비공개 조치가 될 수 있습니다.
						</div>
					</div>
				</div>
				
			</div>
		</div>
	</div>


</body>
</html>