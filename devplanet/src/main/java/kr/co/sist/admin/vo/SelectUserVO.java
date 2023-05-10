package kr.co.sist.admin.vo;

import java.sql.Date;

public class SelectUserVO {
	
	private String id, name, addr, tel;
	private Date birthDate, regDate;
	
	// 생성자
	public SelectUserVO() {
	}
	
	public SelectUserVO(String id, String name, String addr, String tel, Date birthDate, Date regDate) {
		this.id = id;
		this.name = name;
		this.addr = addr;
		this.tel = tel;
		this.birthDate = birthDate;
		this.regDate = regDate;
	}
	
	// getter & setter
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public Date getBirthDate() {
		return birthDate;
	}
	public void setBirthDate(Date birthDate) {
		this.birthDate = birthDate;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	
	// toString
	@Override
	public String toString() {
		return "SelectUserVO [id=" + id + ", name=" + name + ", addr=" + addr + ", tel=" + tel
				+ ", birthDate=" + birthDate + ", regDate=" + regDate + "]";
	}
	
	
}
