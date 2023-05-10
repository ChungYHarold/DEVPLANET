package kr.co.sist.user.vo;

import java.util.Date;

public class ResultIdVO {
	
	private String userId;
	Date regDate;
	
	
	
	public ResultIdVO() {
		super();
	}
	
	
	public ResultIdVO(String userId, Date regDate) {
		super();
		this.userId = userId;
		this.regDate = regDate;
	}


	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	@Override
	public String toString() {
		return "ResultIdVO [userId=" + userId + ", regDate=" + regDate + "]";
	}
	
	

}//class
