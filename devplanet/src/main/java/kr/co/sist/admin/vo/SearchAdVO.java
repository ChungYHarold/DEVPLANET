package kr.co.sist.admin.vo;

import java.sql.Date;

public class SearchAdVO {

	private String cName, title; //기업명, 공고제목
	private int jobNum, totalApply; // 공고번호, 인재관리
	private Date inputDate, endDate; //등록일자, 마감일자
	
	
	public String getcName() {
		return cName;
	}
	public void setcName(String cName) {
		this.cName = cName;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public int getJobNum() {
		return jobNum;
	}
	public void setJobNum(int jobNum) {
		this.jobNum = jobNum;
	}
	public int getTotalApply() {
		return totalApply;
	}
	public void setTotalApply(int totalApply) {
		this.totalApply = totalApply;
	}
	public Date getInputDate() {
		return inputDate;
	}
	public void setInputDate(Date inputDate) {
		this.inputDate = inputDate;
	}
	public Date getEndDate() {
		return endDate;
	}
	
	@Override
	public String toString() {
		return "SearchAdVO [cName=" + cName + ", title=" + title + ", jobNum=" + jobNum + ", totalApply=" + totalApply
				+ ", inputDate=" + inputDate + ", endDate=" + endDate + "]";
	}
	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}
	
	
	
	
	
	
	
	
}//class
