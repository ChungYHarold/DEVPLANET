<%@page import="kr.co.sist.user.dao.ResumeModifyDAO"%>
<%@page import="kr.co.sist.user.dao.JobDAO"%>
<%@page import="kr.co.sist.user.vo.LoginResultVO"%>
<%@page import="kr.co.sist.util.cipher.DataEncrypt"%>
<%@page import="kr.co.sist.user.vo.ResumeInsertVO"%>
<%@page import="java.sql.SQLException"%>
<%@page import="kr.co.sist.user.vo.EducationVO"%>
<%@page import="kr.co.sist.user.vo.LanguageVO"%>
<%@page import="kr.co.sist.user.vo.CertificateVO"%>
<%@page import="kr.co.sist.user.vo.SkillVO"%>
<%@page import="kr.co.sist.user.dao.ResumeDAO"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="javax.swing.DefaultListModel"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    
    <title>이력서 작성완료</title>
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
		<%															//로그인 창으로 보내는 예시
	} else { // 세션의 값을 불렀는데 null이 아니다 (= 세션에 값이 있다 ) => 세션에 저장할 때는 로그인 할 때 밖에 없으니까 세션에 값이 있다는 것 자체가 정상적인 접근이다.
		LoginResultVO lrVO=(LoginResultVO)session.getAttribute("sesVO");  //세션의 값을 lrVO에 담아준다.
		userId=lrVO.getUserId(); //lrVO안의 이름을 꺼내서 보여준다.
	}//end else
	%>
<!-- session 끝 -->
<!-- jQuery CDN 시작 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<!-- jQuery CDN 끝 -->

<link href="//i.jobkorea.kr/content/css/ver_2/event/banner.promotion-sv-202211241151.css" rel="stylesheet" type="text/css" />

<link href="//i.jobkorea.kr/content/css/ver_2/common-sv-202302221621.css" rel="stylesheet" type="text/css" /><link href="//i.jobkorea.kr/content/css/ver_2/text_user/resume/header-sv-202005061649.css" rel="stylesheet" type="text/css" /><link href="//i.jobkorea.kr/content/css/ver_2/text_user/resume/layout-sv-202005061649.css" rel="stylesheet" type="text/css" /><link href="//i.jobkorea.kr/content/css/ver_2/mtu/mtu_popup-sv-202212281122.css" rel="stylesheet" type="text/css" /><link href="//i.jobkorea.kr/deploy/pc/dist/css/personal/layout/footer-sv-202301261521.css" rel="stylesheet" type="text/css" />
    
    <link rel="stylesheet" href="https://www.jobkorea.co.kr/include/css/ver_2/footer_sub.css?20170823" />
    <link href="//i.jobkorea.kr/content/css/ver_2/text_user/resume/complete-sv-202301041737.css" rel="stylesheet" type="text/css" />
    <link href="//i.jobkorea.kr/deploy/pc/dist/css/event/2022/tvc/tvc2022_4-sv-202212141417.css" rel="stylesheet" type="text/css" />

    <script type='text/javascript' src='/resources/lib/datastory/dslog.js?ver=1.1' id='dslog_tag'></script> 

<style>
    .async-hide {
        opacity: 0 !important
    }
</style>


 
</head>




<body class="" >

		
		
<div class="resumePage resumePageComplete">

    <div class="resumeHeader">
        <div class="container">
            <a href="https://www.jobkorea.co.kr/" class="logo"><img src="http://localhost/prj2/images/devplanet_logo.png" style="width: 100px; height: auto;" ></a>
            <div class="links">
                <a href="https://www.jobkorea.co.kr/User/Mypage" class="link linkHome">개인회원 홈</a>
                <a href="https://www.jobkorea.co.kr/User/ResumeMng" class="link linkManage">이력서 관리</a>
            </div>
        </div>
    </div>

    <div class="resumeWrapper">
    	<div class="resumeContainer resumeContainerComplete">
            <h1 class="header"><img src="//i.jobkorea.kr/content/images/text_user/resume/header-complete.gif" alt="이력서 작성 완료">완성도를 더 높여 더 많은 기회를 만나세요!</h1>
            <a href="http://localhost/prj2/project_user/4.resume/resume_present.jsp" class="button buttonViewWritten">작성한 이력서 보기</a>
<div class="asd">
</div>
 <!-- footer 시작 -->
<div id="footer" class="footer footer--main">
    <div class="footer__wrap">
        <h2 class="skip">잡코리아 기타 정보</h2>

         <div class="footer__notice">
                <p class="" style="margin-top: 20px;">
            © <strong><a href="http://sist.co.kr/" target="_blank">DEVPLANET</a></strong> LLC. All rights reserved.
        </p>
            
        </div> 

         <div class="footer__service">
            <h3 class="blind">잡코리아 서비스 링크</h3>
            <ul>
                <li><a href="" target="_blank">회사소개</a></li>
                <li><a href="https://www.jobkorea.co.kr/service_jk/provision/provision_gg.asp" target="_blank">이용약관</a></li>
                <li><a href="https://www.jobkorea.co.kr/service/PolicyPrivacy" target="_blank"><strong>개인정보처리방침</strong></a></li>
            </ul>
        </div>  
        
    </div>
</div>
<!-- footer 끝 -->        
    </div>
</div>


    <script type="text/javascript" src="https://i.jobkorea.kr/content/js/jk_uit.js?20161025"></script>

</body>
</html>