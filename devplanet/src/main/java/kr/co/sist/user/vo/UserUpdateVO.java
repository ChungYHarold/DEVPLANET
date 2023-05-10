package kr.co.sist.user.vo;

import java.sql.Date;

/**
 * 2023-04-21 확인
 * 경태
 * 이력서등록 page 에서 회원 성별,이미지,생년월일 
 * update
 * @author 경태
 *
 */
public class UserUpdateVO {

	private String userId ,gender, img;
	private Date birthDate;
	public UserUpdateVO() {
		super();
	}
	public UserUpdateVO(String userId, String gender, String img, Date birthDate) {
		super();
		this.userId = userId;
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
		return "UserUpdateVO [userId=" + userId + ", gender=" + gender + ", img=" + img + ", birthDate=" + birthDate
				+ "]";
	}
	
	
	
}//class
