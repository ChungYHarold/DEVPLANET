package kr.co.sist.admin.vo;

import java.sql.Date;

public class ApplyVO {

	private String cName, adTitle, resumeTitle, name, Major, career, readState, id;
	private int applyNum, rNum, jobNum;
	private Date applyDate;
	
	
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getJobNum() {
		return jobNum;
	}
	public void setJobNum(int jobNum) {
		this.jobNum = jobNum;
	}
	public String getcName() {
		return cName;
	}
	public void setcName(String cName) {
		this.cName = cName;
	}
	public String getAdTitle() {
		return adTitle;
	}
	public void setAdTitle(String adTitle) {
		this.adTitle = adTitle;
	}
	public String getResumeTitle() {
		return resumeTitle;
	}
	public void setResumeTitle(String resumeTitle) {
		this.resumeTitle = resumeTitle;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}

	
	public String getMajor() {
		return Major;
	}
	public void setMajor(String major) {
		Major = major;
	}
	public String getCareer() {
		return career;
	}
	public void setCareer(String career) {
		this.career = career;
	}
	public String getReadState() {
		return readState;
	}
	public void setReadState(String readState) {
		this.readState = readState;
	}
	public int getApplyNum() {
		return applyNum;
	}
	public void setApplyNum(int applyNum) {
		this.applyNum = applyNum;
	}
	public int getrNum() {
		return rNum;
	}
	public void setrNum(int rNum) {
		this.rNum = rNum;
	}
	public Date getApplyDate() {
		return applyDate;
	}
	public void setApplyDate(Date applyDate) {
		this.applyDate = applyDate;
	}
	
	

	
	
	
}//class
