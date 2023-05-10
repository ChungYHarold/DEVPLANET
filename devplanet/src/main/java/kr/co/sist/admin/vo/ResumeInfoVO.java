package kr.co.sist.admin.vo;

import java.sql.Date;

public class ResumeInfoVO {

	
	//회원 정보 - 이름, 이메일, 전화번호, 주소, 성별, 이미지
	private String name, email, tel, addr, img, gender;
	private Date birthDate;
	
	//이력서 정보 - 제목, 희망직무, 경력, 고용형태, 연봉, 지역
	private String title, job, career, empform, sal, area;

	public ResumeInfoVO() {
		super();
	}

	public ResumeInfoVO(String name, String email, String tel, String addr, String img, String gender, Date birthDate,
			String title, String job, String career, String empform, String sal, String area) {
		super();
		this.name = name;
		this.email = email;
		this.tel = tel;
		this.addr = addr;
		this.img = img;
		this.gender = gender;
		this.birthDate = birthDate;
		this.title = title;
		this.job = job;
		this.career = career;
		this.empform = empform;
		this.sal = sal;
		this.area = area;
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

	@Override
	public String toString() {
		return "ResumeDataVO [name=" + name + ", email=" + email + ", tel=" + tel + ", addr=" + addr + ", img=" + img
				+ ", gender=" + gender + ", birthDate=" + birthDate + ", title=" + title + ", job=" + job + ", career="
				+ career + ", empform=" + empform + ", sal=" + sal + ", area=" + area + ", getName()=" + getName()
				+ ", getEmail()=" + getEmail() + ", getTel()=" + getTel() + ", getAddr()=" + getAddr() + ", getImg()="
				+ getImg() + ", getGender()=" + getGender() + ", getBirthDate()=" + getBirthDate() + ", getTitle()="
				+ getTitle() + ", getJob()=" + getJob() + ", getCareer()=" + getCareer() + ", getEmpform()="
				+ getEmpform() + ", getSal()=" + getSal() + ", getArea()=" + getArea() + ", getClass()=" + getClass()
				+ ", hashCode()=" + hashCode() + ", toString()=" + super.toString() + "]";
	}
	
	
	
}//class
