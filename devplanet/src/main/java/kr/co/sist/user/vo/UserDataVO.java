package kr.co.sist.user.vo;

import java.sql.Date;

/**
 * 
 * 2023-04-21 확인
 * 경태
 * 이력서등록 page 회원테이블 select
 * @author 경태
 *
 */
public class UserDataVO {

	// 1. 회원가입 하면서 회원테이블에 
	//		(name, email, tel, addr, img, gender, birthDate) 값 select함

	// 	   	하지만 이력서 첫 등록이라면 img, gender, birthDate는 null 값임
	
	// 2. 첫 등록 완료하면 img, gender, birthDate는 회원테이블에 update 됨.
	
	// 3. 그 뒤로는 name, email, tel, addr, birthDate, gender, img 값들을 select해서 화면에 보여줌
	
	private String userId, name, email, tel, addr, gender, img;
	
	public UserDataVO() {
		super();
	}
	
	private Date birthDate;
	
	
	public UserDataVO(String userId, String name, String email, String tel, String addr, String gender, String img,
			Date birthDate) {
		super();
		this.userId = userId;
		this.name = name;
		this.email = email;
		this.tel = tel;
		this.addr = addr;
		this.gender = gender;
		this.img = img;
		this.birthDate = birthDate;
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

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public Date getBirthDate() {
		return birthDate;
	}

	public void setBirthDate(Date birthDate) {
		this.birthDate = birthDate;
	}

	@Override
	public String toString() {
		return "UserDataVO [userId=" + userId + ", name=" + name + ", email=" + email + ", tel=" + tel + ", addr="
				+ addr + ", gender=" + gender + ", img=" + img + ", birthDate=" + birthDate + ", getUserId()="
				+ getUserId() + ", getName()=" + getName() + ", getEmail()=" + getEmail() + ", getTel()=" + getTel()
				+ ", getAddr()=" + getAddr() + ", getGender()=" + getGender() + ", getImg()=" + getImg()
				+ ", getBirthDate()=" + getBirthDate() + ", getClass()=" + getClass() + ", hashCode()=" + hashCode()
				+ ", toString()=" + super.toString() + "]";
	}

	
	
	
}//class
