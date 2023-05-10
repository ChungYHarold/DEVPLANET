package kr.co.sist.user.vo;

public class FindPassVO {
	
	private String userId, name, email;
	
	

	public FindPassVO() {
		super();
	}
	
	

	public FindPassVO(String userId, String name, String email) {
		super();
		this.userId = userId;
		this.name = name;
		this.email = email;
	}



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

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	@Override
	public String toString() {
		return "FindPassVO [userId=" + userId + ", name=" + name + ", email=" + email + "]";
	}
	
	

}//class
