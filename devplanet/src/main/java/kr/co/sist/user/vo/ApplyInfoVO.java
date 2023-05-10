package kr.co.sist.user.vo;

public class ApplyInfoVO {
	
	private String userId;
	private int jobNum, rNum;
	
	public ApplyInfoVO() {
		super();
	}

	public ApplyInfoVO(String userId, int jobNum, int rNum) {
		super();
		this.userId = userId;
		this.jobNum = jobNum;
		this.rNum = rNum;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public int getJobNum() {
		return jobNum;
	}

	public void setJobNum(int jobNum) {
		this.jobNum = jobNum;
	}

	public int getrNum() {
		return rNum;
	}

	public void setrNum(int rNum) {
		this.rNum = rNum;
	}
	
	
	

}//class
