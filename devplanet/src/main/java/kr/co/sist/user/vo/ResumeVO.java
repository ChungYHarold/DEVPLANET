package kr.co.sist.user.vo;

import java.sql.Date;

/**
 * 이력서 수정page에서 저장버튼 눌렀을 때 update될 항목들
 * @author 경태
 *
 */
public class ResumeVO {

	//이력서 테이블
	private int rNum;
	private String title, job, career, empform, sal, area; 
	
	//  생년월일이랑 성별을 바꿀 수 있나? 잘못 넣었듯ㅈㅈ
	//  이메일, 이미지만 바꾸기 가능 할 듯?
	
	//회원 테이블
	private String userId, img, gender;
	private Date birthDate;
	
	
	
	public ResumeVO() {
		super();
	}
	public ResumeVO(int rNum, String userId, String title, String job, String career, String empform, String sal,
			String area, String img, String gender, Date birthDate) {
		super();
		this.rNum = rNum;
		this.userId = userId;
		this.title = title;
		this.job = job;
		this.career = career;
		this.empform = empform;
		this.sal = sal;
		this.area = area;
		this.img = img;
		this.gender = gender;
		this.birthDate = birthDate;
	}
	public int getrNum() {
		return rNum;
	}
	public void setrNum(int rNum) {
		this.rNum = rNum;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getJob() {
		return job;
	}
	public void setJob(String job) {
		this.job = job;
	}
	public String getCareer() {
		return career;
	}
	public void setCareer(String career) {
		this.career = career;
	}
	public String getEmpform() {
		return empform;
	}
	public void setEmpform(String empform) {
		this.empform = empform;
	}
	public String getSal() {
		return sal;
	}
	public void setSal(String sal) {
		this.sal = sal;
	}
	public String getArea() {
		return area;
	}
	public void setArea(String area) {
		this.area = area;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public Date getBirthDate() {
		return birthDate;
	}
	public void setBirthDate(Date birthDate) {
		this.birthDate = birthDate;
	}
	@Override
	public String toString() {
		return "ResumeVO [rNum=" + rNum + ", userId=" + userId + ", title=" + title + ", job=" + job + ", career="
				+ career + ", empform=" + empform + ", sal=" + sal + ", area=" + area + ", img=" + img + ", gender="
				+ gender + ", birthDate=" + birthDate + "]";
	}
	
	
	
}//class
