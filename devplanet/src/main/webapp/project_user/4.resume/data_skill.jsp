<%@page import="kr.co.sist.user.vo.LanguageAllVO"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.SQLException"%>
<%@page import="kr.co.sist.user.vo.SkillAllVO"%>
<%@page import="kr.co.sist.user.dao.ResumeModifyDAO"%>
<%@page import="org.json.simple.JSONObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true"
    info="skillSelect"
    %><%
    //0. 데이터의 부가적인 정보를 가질 JSONObject 생성
    JSONObject jsonData = new JSONObject();
    
    //부가적인 정보 할당
	ResumeModifyDAO rmDAO = new ResumeModifyDAO();
    String rNumStr = request.getParameter("rNum");
    int rNum = 0;
	System.out.println(rNumStr != null && !rNumStr.isEmpty());
    	if(rNumStr != null && !rNumStr.isEmpty()){
    	
    	try{
    		rNum = Integer.parseInt(rNumStr);
    		System.out.println("=============");
    	}catch(NumberFormatException e){
    		e.printStackTrace(); //정수로 변환 실패 시 예외 처리
    	}
    }
    
    
	try{
		List<SkillAllVO> list = rmDAO.selectSkill(rNum); 
	    
		jsonData.put("dataSize",list.size());
    	jsonData.put("resultFlag",!list.isEmpty());
		
		//부가적인 정보 할당
		
	//1. JSONArray 생성
	JSONArray jsonSkillArr = new JSONArray();
	
	
	//2. 데이터베이스에서 조회한 결과로 JSONObject 생성하고, JSONArray에 추가
	JSONObject jsonSkillTemp = null;
	
	if(!list.isEmpty()){
		
	
		for(SkillAllVO saVO : list){
			//JSONObject 생성
			jsonSkillTemp = new JSONObject();
			
			//생성된 JSONObject에 속성값을 넣는다.
			jsonSkillTemp.put("name",saVO.getName());
			jsonSkillTemp.put("num",saVO.getNum());
			
			//값을 가진 JSONObject을 JSONArray에 할당
			jsonSkillArr.add(jsonSkillTemp);
			
		}//end for
	
	//3. JSONArray 출력
	out.print(jsonSkillArr.toJSONString());
	 }//end if
	
	}catch(SQLException se){
		se.printStackTrace();
	}//end catch
		
    %>
