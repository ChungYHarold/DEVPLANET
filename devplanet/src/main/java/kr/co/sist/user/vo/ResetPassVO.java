package kr.co.sist.user.vo;

public class ResetPassVO {
	
	private String userId, newPass;
	
	

	public ResetPassVO() {
		super();
	}
	
	

	public ResetPassVO(String userId, String newPass) {
		super();
		this.userId = userId;
		this.newPass = newPass;
	}



	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getNewPass() {
		return newPass;
	}

	public void setNewPass(String newPass) {
		this.newPass = newPass;
	}

	@Override
	public String toString() {
		return "ResetPassVO [userId=" + userId + ", newPass=" + newPass + "]";
	}
	
	

}//class
