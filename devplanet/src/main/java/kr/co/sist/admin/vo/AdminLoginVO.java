package kr.co.sist.admin.vo;

public class AdminLoginVO {
	private String id, pw;
	
	// 생성자
	public AdminLoginVO() {
	}
	
	public AdminLoginVO(String id, String pw) {
		this.id = id;
		this.pw = pw;
	}

	// getter & setter
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	// toString
	@Override
	public String toString() {
		return "AdminLoginVO [id=" + id + ", pw=" + pw + "]";
	}
	
	
}// class
