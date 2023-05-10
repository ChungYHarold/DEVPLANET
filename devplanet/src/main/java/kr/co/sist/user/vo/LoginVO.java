package kr.co.sist.user.vo;

public class LoginVO {
	
	private String userId, pass;
	
	

	public LoginVO() {
		super();
	}
	
	

	public LoginVO(String userId, String pass) {
		super();
		this.userId = userId;
		this.pass = pass;
	}



	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getPass() {
		return pass;
	}

	public void setPass(String pass) {
		this.pass = pass;
	}

	@Override
	public String toString() {
		return "LoginVO [userId=" + userId + ", pass=" + pass + "]";
	}
	
	
	

}//class
