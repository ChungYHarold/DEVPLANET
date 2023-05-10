package kr.co.sist.user.vo;

public class ApplyResumeVO {
	
	private String title, email, tel;
	private int rNum;

	public ApplyResumeVO() {
		super();
	}

	public ApplyResumeVO(String title, String email, String tel, int rNum) {
		super();
		this.title = title;
		this.email = email;
		this.tel = tel;
		this.rNum=rNum;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public int getrNum() {
		return rNum;
	}

	public void setrNum(int rNum) {
		this.rNum = rNum;
	}
	
	
	

}
