package kr.co.sist.user.vo;

import java.util.Date;

public class OtherResumeVO {
	
	private String title;
	private Date inputDate;
	
	public OtherResumeVO() {
		super();
	}
	public OtherResumeVO(String title, Date inputDate) {
		super();
		this.title = title;
		this.inputDate = inputDate;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public Date getInputDate() {
		return inputDate;
	}
	public void setInputDate(Date inputDate) {
		this.inputDate = inputDate;
	}
	@Override
	public String toString() {
		return "OtherResumeVO [title=" + title + ", inputDate=" + inputDate + "]";
	}
	
	

}//class
