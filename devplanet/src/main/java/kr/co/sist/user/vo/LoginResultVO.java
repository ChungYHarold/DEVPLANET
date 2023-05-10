package kr.co.sist.user.vo;

public class LoginResultVO {
	
	
	
	public LoginResultVO() {
		super();
	}
	
	

	public LoginResultVO(String userId, String name) {
		super();
		this.userId = userId;
		this.name = name;
	}



	private String userId, name;

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Override
	public String toString() {
		return "LoginResultVO [userId=" + userId + ", name=" + name + "]";
	}
	
	

}
