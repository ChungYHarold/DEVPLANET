package kr.co.sist.user.vo;

import java.util.Date;

//?ù¥?†•?Ñú?òÑ?ô©?åê ?ù¥?†•?ÑúÏ°∞ÌöåVO
public class UserTableInfoVO {
	//?ù¥?†•?Ñú?Öå?ù¥Î∏?
	private String title,job,career,empform,sal,area;
	
	//?öå?õê?Öå?ù¥Î∏?
	private String name,email,tel,addr,img,gender;
	private Date birthDate;
	

	public UserTableInfoVO() {
		
	}//?Éù?Ñ±?ûê



	public UserTableInfoVO(String title, String job, String career, String empform, String sal, String area,
			String name, String email, String tel, String addr, String img, String gender, Date birthDate) {
		super();
		this.title = title;
		this.job = job;
		this.career = career;
		this.empform = empform;
		this.sal = sal;
		this.area = area;
		this.name = name;
		this.email = email;
		this.tel = tel;
		this.addr = addr;
		this.img = img;
		this.gender = gender;
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



	@Override
	public String toString() {
		return "UserTableInfoVO [title=" + title + ", job=" + job + ", career=" + career + ", empform=" + empform
				+ ", sal=" + sal + ", area=" + area + ", name=" + name + ", email=" + email + ", tel=" + tel + ", addr="
				+ addr + ", img=" + img + ", gender=" + gender + ", birthDate=" + birthDate + ", getTitle()="
				+ getTitle() + ", getJob()=" + getJob() + ", getCareer()=" + getCareer() + ", getEmpform()="
				+ getEmpform() + ", getSal()=" + getSal() + ", getArea()=" + getArea() + ", getName()=" + getName()
				+ ", getEmail()=" + getEmail() + ", getTel()=" + getTel() + ", getAddr()=" + getAddr() + ", getImg()="
				+ getImg() + ", getGender()=" + getGender() + ", getBirthDate()=" + getBirthDate() + ", getClass()="
				+ getClass() + ", hashCode()=" + hashCode() + ", toString()=" + super.toString() + "]";
	}
	
	
	
	
}//class
