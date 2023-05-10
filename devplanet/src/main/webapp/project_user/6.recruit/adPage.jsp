<%@page import="kr.co.sist.user.vo.LoginResultVO"%>
<%@page import="kr.co.sist.user.dao.JobDAO"%>
<%@page import="kr.co.sist.user.vo.SearchCorpVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html lang="ko">
<head>
    <meta charset="utf-8" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge; chrome=1" />
    <title>채용정보</title>



    <link href="//i.jobkorea.kr/content/css/ver_2/common-sv-202302221621.css" rel="stylesheet" type="text/css" />
    <link href="//i.jobkorea.kr/content/css/ver_2/gnb/gnb-sv-202302271621.css" rel="stylesheet" type="text/css" />
    <link href="//i.jobkorea.kr/content/css/ver_2/jobs/part-sv-202301171523.css" rel="stylesheet" type="text/css" />
    <link href="//i.jobkorea.kr/content/css/ver_2/rcr/rcr-sv-202301061053.css" rel="stylesheet" type="text/css" />
    <link href="//i.jobkorea.kr/content/css/ver_2/event/banner.promotion-sv-202211241151.css" rel="stylesheet" type="text/css" />
    
       
    <link href="//i.jobkorea.kr/deploy/pc/dist/css/personal/layout/footer-sv-202301261521.css" rel="stylesheet" type="text/css" />
    
    
    
    <style>
   
#header .search {
    float: left;
    box-sizing: border-box;
    width: 410px;
    height: 42px;
    border: 2px solid #39f;
    position: relative;
    margin-left: 0px;
}

    </style>
    
    
    
    

<!-- jQuery CDN -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<!-- jQuery CDN -->

<%

LoginResultVO lrVO=null;
if(session.getAttribute("sesVO")!=null) {
	
lrVO=(LoginResultVO)session.getAttribute("sesVO");
}//end if

String text="";
if(request.getMethod().equals("GET")) { // get방식으로 값이 넘어왔을 때만 reqest를 사용
text=request.getParameter("stext");
}//end if

List<SearchCorpVO> list=null;
JobDAO jDAO=new JobDAO();

if(!"".equals(text)) {
	
list=jDAO.selectSearchCorp(text);

}//end if


pageContext.setAttribute("lrVO", lrVO);
pageContext.setAttribute("list", list);
pageContext.setAttribute("stext", text);
%>



<script type="text/javascript">

$(function(){
	
	
	
	$("#stext").focus(function() {
		$(this).val('');
	});//focus
	
	$("#searchBtn").click(function() {
		if($("#stext").val() == "") {
			alert("검색어를 입력해 주세요.");
			return;
		}//end if
		$("#searchFrm").submit();
	});//click stext
	
	
	
	
});//ready



	function openPop(name,  jobNum, title) {
		
		var url="http://localhost/prj2/project_user/7.apply/apply.jsp?name="+name+"&title="+title+"&jobNum="+jobNum;
		window.open(url,"subWin","width=500, height=600,top="+(window.screenY+100)+", left="+(window.screenX+100));
		
	}//openPop



</script>
    
    
    
</head>

<body>


     
       <!-- 네비바 시작  -->
<div id="headerWrap" class="gnbTheme1260 devGnbContainer ">
    <div id="header" class="">
        <!--신입공채 메뉴일경우 클래스 start-sub 추가 -->
        <!-- // headInner -->
        <div class="headInner">
            <h1 class="jkLogo" >
                        <a href=" ${ lrVO.userId ne null?"http://localhost/prj2/project_user/1.main/main_page_loged.jsp":" http://localhost/prj2/project_user/1.main/main_page.jsp" }"><img id="jkLogo" src="http://localhost/prj2/project_admin/images/devplanet_logo.png" alt="데브플래닛"></a>
            </h1>
        </div>
        <!-- headInner // -->

        <div id="headNavBar" class="headNavBar">
            <div class="navInner">

<!-- 전체보기 버튼 클릭시 active 클래스 추가 -->
<div class="allArea">
    <h2 class="skip">전체서비스</h2>
    <button type="button" class="btnAllService" ><span class="spGnb"><span class="txIr">전체서비스 열기</span></span></button>
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



<div id="wrap">
     
<div id="container">
        
        
        <!-- 검색바 시작 -->
<div id="header" class=""> 

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
</div><br>
<!-- 검색바 끝 -->
        
        
<!-- 채용공고리스트 -->
<div id="dev-gi-list" >

<div class="tplJobListWrap devTplTabBx">
    <h2 class="bn_hd_2 blind">채용공고 리스트</h2>
    <input type="hidden" id="hdnGICnt" value=" 197,624" />
    
<hr/>
<h1 style="font-size: 22px">채용공고 상세검색</h1><br>


    <div class="tplList tplJobList">
        <table summary="전체 채용정보 목록으로 회사명, 채용제목, 미리보기, 등록일·마감일로 구성되어 있습니다.">
            <caption><span class="blind">전체 채용정보 목록</span></caption>
            <colgroup>
                <col width="50px">
                <col width="158px">
                <col width="*">
                <col width="120px">
            </colgroup>
            <tbody>
            	<c:forEach var="corps" items="${ list }">
                        <tr class="devloopArea" data-effectctgr-code="0" data-info=" 41240851|43929138|sungdopna|C|AM||190505">
                            <th scope="row">
                            </th>
                            <td class="tplCo">
                                <a href="#void" name="logo" id="logo" class="link normalLog" data-clickctgrcode="B01" target="_blank" ><img src="http://localhost/prj2/upload/${ corps.logo }" width="125" height="100"></a>
                            </td>
                            <td class="tplTit">
                                <div class="titBx">
	                                    <a href="http://localhost/prj2/project_user/7.apply/company.jsp?name=${ corps.cName }&jobNum=${ corps.jobNum }" id="cName" name="cName" title="기업 이름" target="_blank" >${ corps.cName }</a><br>
                                        <strong><a href="http://localhost/prj2/project_user/7.apply/company.jsp?name=${ corps.cName }&jobNum=${ corps.jobNum }" id="title" class="link normalLog" title="${ corps.title }"  target="_blank">${ corps.title }</a></strong><br><br>
                                        <span id="field" name="field">모집 분야 : #${ corps.field }</span>
                                </div>
                            </td>
                            <td class="odd">
                               <button type="button" id="applyBtn" name="applyBtn" class="tplBtn tplBtn_1 tplBtnOrg dev-btn-apply" onclick="openPop('${ corps.cName }','${ corps.jobNum }','${ corps.title }')"><span>즉시지원</span></button>
                            </td>
                        </tr>
                </c:forEach>
            </tbody>
        </table>
           
    </div>
    </div>


	</div>
	</div>
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
    
    
    
    