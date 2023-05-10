package kr.co.sist.user.vo;

import java.sql.Date;


public class ModifiyInfoVO {
	
	private String userId, name, gender, email, tel, addr, detailAddr, terms;
	private int zipcode;
	private Date birthYear;
	
	

	public ModifiyInfoVO() {
		super();
	}
	
	

	public ModifiyInfoVO(String userId, String name, Date birthYear, String gender, String email, String tel,
			int zipcode, String addr, String detailAddr, String terms) {
		super();
		this.userId = userId;
		this.name = name;
		this.birthYear = birthYear;
		this.gender = gender;
		this.email = email;
		this.tel = tel;
		this.zipcode = zipcode;
		this.addr = addr;
		this.detailAddr = detailAddr;
		this.terms = terms;
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

	public Date getBirthYear() {
		return birthYear;
	}

	public void setBirthYear(Date birthYear) {
		this.birthYear = birthYear;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
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

	public String getDetailAddr() {
		return detailAddr;
	}

	public void setDetailAddr(String detailAddr) {
		this.detailAddr = detailAddr;
	}

	public String getTerms() {
		return terms;
	}

	public void setTerms(String terms) {
		this.terms = terms;
	}



	@Override
	public String toString() {
		return "ModifiyInfoVO [userId=" + userId + ", name=" + name + ", gender=" + gender + ", email=" + email
				+ ", tel=" + tel + ", addr=" + addr + ", detailAddr=" + detailAddr + ", terms=" + terms + ", zipcode="
				+ zipcode + ", birthYear=" + birthYear + "]";
	}
	

}//class
