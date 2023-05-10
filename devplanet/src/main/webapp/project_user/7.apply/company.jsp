<%@page import="kr.co.sist.user.vo.LoginResultVO"%>
<%@page import="kr.co.sist.user.vo.JobPostVO"%>
<%@page import="kr.co.sist.user.dao.JobDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
<title>회사 공고</title>
<style type="text/css">
#whole{ width:1000px; height:1600px;  margin: 0px auto; }
#detailText{ position:relative; top:70px;  left:20px; width:100px; height:50px; background-color: #FFF }
#detail{ position: relative; top: 70px; left: 20px; width:960px; min-height:600px; margin-left : 100px;  }
#end{ position:relative; top:150px; left:0px; }
.devApplyBtn{ position:absolute; left:220px }
.homepage1{ position:absolute; top:0px; left:420px; border: none; background-color:#FF7E00; width:150px; height:55px; color:#FFF; font-size: 16px; font-family: "맑은 고딕" }
.cancel1{ position:absolute; top:0px; left:580px; border: none; background-color:#5E5E5E; width:150px; height:55px; color:#FFF; font-size: 16px; font-family: "맑은 고딕" }
.detailText{ position:relative; top:70px }
.leftRtio{ left:20px;}
.btns{ position:relative; top:0px; left:0px; }

</style>
<!-- <link href="//i.jobkorea.kr/content/css/ver_2/common-sv-202302221621.css" rel="stylesheet" type="text/css" /> 
<link href="//i.jobkorea.kr/deploy/pc/dist/css/personal/pages/recruit/view/view-sv-202302221621.css" rel="stylesheet" type="text/css" />  -->

<link href="//i.jobkorea.kr/content/css/ver_2/event/banner.promotion-sv-202211241151.css" rel="stylesheet" type="text/css" />


<link href="//i.jobkorea.kr/content/css/ver_2/common-sv-202302221621.css" rel="stylesheet" type="text/css" />
<link href="//i.jobkorea.kr/content/css/ver_2/gnb/gnb-sv-202302271621.css" rel="stylesheet" type="text/css" />
<link href="//i.jobkorea.kr/content/css/ver_2/jobs/part-sv-202301171523.css" rel="stylesheet" type="text/css" />
<link href="//i.jobkorea.kr/deploy/pc/dist/css/personal/pages/recruit/view/view-sv-202302221621.css" rel="stylesheet" type="text/css" />
<link href="//i.jobkorea.kr/deploy/pc/dist/css/personal/layout/footer-sv-202301261521.css" rel="stylesheet" type="text/css" />

<!-- CDN 시작 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<!-- CDN 끝 -->

<%
LoginResultVO lrVO=null;
String userId="";
if(session.getAttribute("sesVO") != null){
	lrVO=(LoginResultVO)session.getAttribute("sesVO");
	userId=lrVO.getUserId();
}//end if
JobDAO jDAO=new JobDAO();
String cName=request.getParameter("name");
int jobNum=Integer.parseInt(request.getParameter("jobNum"));

JobPostVO jpVO=jDAO.selectJobPost(cName, jobNum);
String homePage=jpVO.getHomepage();

pageContext.setAttribute("job", jpVO);
//int jobNum=jpVO.getJobNum();
%>


<script type="text/javascript">


$(function() {
	$("#cancel").click(function() {
		if( confirm("지원을 취소하시겠습니까?")) {
			location.href="company_cancel.jsp?jobNum=<%= jobNum%>&userId=<%= userId %>";
		}//end if
			
	});//click
	
	$("#homepage").click(function() {
		if("<%=homePage%>"==null) {
			alert("해당 기업은 홈페이지 지원을 받지 않습니다.");
			return;
		}//end if
		location.href="http://<%=homePage%>";
	})//homepage
	
});//ready 



function openPop(name, title, jobNum) {
	
	var nowDate = new Date();
	var endDate = new Date($("#end_date").text());
	
	if(nowDate > endDate) {
		alert("해당공고는 마감되었습니다.");
		return;
	}//end if
	
	var url="http://localhost/prj2/project_user/7.apply/apply.jsp?name="+name+"&title="+title+"&jobNum="+jobNum;
	window.open(url,"subWin","width=500, height=600,top="+(window.screenY+100)+", left="+(window.screenX+100));
}//openPop

</script>



</head>



<body id="secLgi" class="lgiSubRead lgiSubReadBooth   " oncontextmenu="return false" ondragstart="return false" onselectstart="return false">
<div id="whole">
    <hr>
    <div id=wrap>
    
<section id="container">

<h1 class="tpl_hd_1"><span class="blind">${ job.cName }</span> 채용정보</h1>
<input type="hidden" id="parent_name" value="${ job.cName }"/>
<input type="hidden" id="parent_title" value="${ job.title }"/>
<section class="secReadSummary">
    <h2 class="hd_2 blind">요약정보</h2>
    <div class="readSumWrap clear">
        <article class="artReadJobSum">
            <div class="sumTit">
                <h3 class="hd_3">
                    <div class="header">
                        <span class="coName">
                            ${ job.cName }<!-- /////////////////////////기업이름////////////////////////// -->
                        </span>
                    </div>
                    ${ job.title }
                </h3>
            </div>
            <div class="tbRow clear">
                <div class="tbCol ">
                    <h4 class="hd_4">지원자격</h4>
                    <dl class="tbList">
                        <dt>경력</dt>
                        <dd><strong class="col_1">${ job.career }</strong></dd>
                        
                        <dt>학력</dt>
                        <dd><strong class="col_1">${ job.education }</strong></dd>
                        
                    </dl>
                </div>
                
                <div class="tbCol ">
                    <h4 class="hd_4">근무조건</h4>
                    <dl class="tbList">
                        <dt>고용형태</dt>
                        <dd>
                        <ul class="addList">
                           <li><strong class="col_1">${ job.empform }</strong></li>
                        </ul>
                        </dd>

                        <dt>급여</dt>
                        <dd><em class="dotum"></em> ${ job.sal }</dd>
                        
                        <dt>지역</dt>
                        <dd><text>${ job.area }</text></dd>

                        <dt>시간</dt>
                        <!-- <dd>주<span class="tahoma">5</span>일(월~금)<span class="dvs"></span> <span class="tahoma">10:00~19:00</span></dd> -->
                        <dd>${ job.workHours }</dd>
                    </dl>
            </div>
            
            <div class="tbCol tbCoInfo">
            <br/><br/>
                    <h4 class="hd_4">기업정보</h4>
                    <div class="tbLogo">
                        <div class="logo">
                            <p>
                                <img src="http://localhost/prj2/upload/${ job.logo }" id="cologo" name="cologo" alt="${ job.cName }" onload="go_logo_size(this, 100, 40);" />
                            </p>
                        </div>
                    </div>

                <dl class="tbList">
                        <dt>산업(업종)</dt>
                        <dd><text>${ job.field }</text></dd>
                        
                        <dt>사원수</dt>
                        <dd><span class="tahoma">${ job.emp }</span>명</dd>
                            
                        <dt>설립년도</dt>
                        <dd><text><span class="tahoma">${ job.establishYear }</span></text></dd>
                            
                        <dt>기업형태</dt>
                        <dd>${ job.type }</dd>
                </dl>
            </div>
        </div>
    </article>
</div>
</section>
</section>


</div>
<!-- 지원하기 버튼 -->
<div class="btns">
<p class="sumBtn">
<button type="button" class="girBtn tplBtn_1 tplBtnOrg girBtnOrg devOnlineApplyBtn devApplyBtn"  id="devApplyBtn" onclick="openPop('${job.cName}', '${job.title}','${ job.jobNum }')"><span>즉시지원</span></button>
</p>
<button type="button" class="homepage1"  id="homepage"><span>홈페이지 지원</span></button>
<button type="button" class="cancel1"  id="cancel"><span>지원취소</span></button>
</div>
<!-- 지원하기 버튼 끝 -->

<!-- 상세요강 -->
 <div class="detailText">
   <div id="menuContainer" class="devTplTabBx ">
        <div id="topMenu" class="tplTabBx readTabBx leftRtio">
            <ul class="tplTab clear ">
                <li data-target="tab01" class="on"><button type="button" onclick=""><span>상세요강</span></button></li>
            </ul>
        </div>
   </div>
</div>

<div id="detail">
<img src="http://localhost/prj2/upload/${ job.description }"/>
</div>
<!-- 상세요강 끝 -->
<!-- 마감 -->
<div id="end">
 <div class="divReadBx clear devMakeSameHeight">
    <article class="artReadPeriod">
        
        <h3 class="hd_3 blind">접수기간</h3>
        <div >
              <dl class="time">
                   <dt class="girIcn icnTime">접수기간</dt>
              </dl>
              <dl class="date">
                   <dt>시작일</dt>
                   <dd><span class="tahoma">${ job.startDate }</span></dd>
                   
                   <dt>마감일</dt>
                   <dd><span class="tahoma" id="end_date" >${ job.endDate }</span></dd>
              </dl>
                        <p class="deadline">
                        </p>
        </div>
    </article>
    
    <article class="artReadHow">
    <br/>
    <div class="tbRow">
         <dl>
             <dt>모집분야</dt>
             <dd><span class="tahoma">${ job.recruitField }</span></dd>
                                               
             <dt>모집인원</dt>
             <dd><span class="tahoma">${ job.recruitPeople }</span>명</dd>
         </dl>
    </div>
    </article>
 </div>
</div>
<!-- 마감 끝 -->
</div><!-- whole -->
</body>
</html>
