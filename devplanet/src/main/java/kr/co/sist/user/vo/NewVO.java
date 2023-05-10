package kr.co.sist.user.vo;

import java.util.Date;

public class NewVO {
	
	private String name, userId, pass, email, tel, addr, detail_addr, terms;
	private int zipcode;
	private Date regDate;
	
	
	
	
	public NewVO() {
		super();
	}
	
	
	
	public NewVO(String name, String userId, String pass, String email, String tel, int zipcode, String addr,
			String detail_addr, String terms, Date regDate) {
		super();
		this.name = name;
		this.userId = userId;
		this.pass = pass;
		this.email = email;
		this.tel = tel;
		this.zipcode = zipcode;
		this.addr = addr;
		this.detail_addr = detail_addr;
		this.terms = terms;
		this.regDate = regDate;
	}



	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
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
	public int getZipcode() {
		return zipcode;
	}
	public void setZipcode(int zipcode) {
		this.zipcode = zipcode;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getDetail_addr() {
		return detail_addr;
	}
	public void setDetail_addr(String detail_addr) {
		this.detail_addr = detail_addr;
	}
	public String getTerms() {
		return terms;
	}
	public void setTerms(String terms) {
		this.terms = terms;
	}
	
	@Override
	public String toString() {
		return "NewVO [name=" + name + ", userId=" + userId + ", pass=" + pass + ", email=" + email + ", tel=" + tel
				+ ", zipcode=" + zipcode + ", addr=" + addr + ", detail_addr=" + detail_addr + ", terms=" + terms
				+ ", regDate=" + regDate + "]";
	}
	
	
	
}//class
