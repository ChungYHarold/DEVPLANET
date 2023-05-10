package kr.co.sist.user.vo;

public class ModifiyPassVO {
	
	private String userId, pass, newPass;
	
	

	public ModifiyPassVO() {
		super();
	}
	
	

	public ModifiyPassVO(String userId, String pass, String newPass) {
		super();
		this.userId = userId;
		this.pass = pass;
		this.newPass = newPass;
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

	public String getNewPass() {
		return newPass;
	}

	public void setNewPass(String newPass) {
		this.newPass = newPass;
	}

	@Override
	public String toString() {
		return "ModifiyPassVO [userId=" + userId + ", pass=" + pass + ", newPass=" + newPass + "]";
	}
	
	

}//class
