package kr.co.sist.admin.vo;

public class AdminResultVO {
	private String id, pass;

	
	public AdminResultVO() {
	}

	public AdminResultVO(String id, String pass) {
		this.id = id;
		this.pass = pass;
	}


	public String getId() {
		return id;
	}


	public void setId(String id) {
		this.id = id;
	}


	public String getPass() {
		return pass;
	}


	public void setPass(String pass) {
		this.pass = pass;
	}


	@Override
	public String toString() {
		return "AdminResultVO [id=" + id + ", pass=" + pass + "]";
	}
	
	
}
