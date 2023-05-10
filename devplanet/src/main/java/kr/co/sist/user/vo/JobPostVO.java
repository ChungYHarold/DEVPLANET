package kr.co.sist.user.vo;

import java.util.Date;

public class JobPostVO {
	
	private String cName,title,career,education,
					empform,sal,area,description,recruitField,
					logo,field,type,homepage,workHours;
	
	private int recruitPeople, emp, jobNum;
	private Date startDate,endDate,establishYear;
	
	public JobPostVO() {
		super();
	}

	public JobPostVO(String cName, String title, String career, String education, String empform, String sal,
			String area, String description, String recruitField, String logo, String field, String type,
			String homepage, String workHours, int recruitPeople, int emp, Date startDate, Date endDate,
			Date establishYear, int jobNum) {
		super();
		this.cName = cName;
		this.title = title;
		this.career = career;
		this.education = education;
		this.empform = empform;
		this.sal = sal;
		this.area = area;
		this.description = description;
		this.recruitField = recruitField;
		this.logo = logo;
		this.field = field;
		this.type = type;
		this.homepage = homepage;
		this.workHours = workHours;
		this.recruitPeople = recruitPeople;
		this.emp = emp;
		this.startDate = startDate;
		this.endDate = endDate;
		this.establishYear = establishYear;
		this.jobNum = jobNum;
	}

	public String getcName() {
		return cName;
	}

	public void setcName(String cName) {
		this.cName = cName;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getCareer() {
		return career;
	}

	public void setCareer(String career) {
		this.career = career;
	}

	public String getEducation() {
		return education;
	}

	public void setEducation(String education) {
		this.education = education;
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

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getRecruitField() {
		return recruitField;
	}

	public void setRecruitField(String recruitField) {
		this.recruitField = recruitField;
	}

	public String getLogo() {
		return logo;
	}

	public void setLogo(String logo) {
		this.logo = logo;
	}

	public String getField() {
		return field;
	}

	public void setField(String field) {
		this.field = field;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getHomepage() {
		return homepage;
	}

	public void setHomepage(String homepage) {
		this.homepage = homepage;
	}

	public String getWorkHours() {
		return workHours;
	}

	public void setWorkHours(String workHours) {
		this.workHours = workHours;
	}

	public int getRecruitPeople() {
		return recruitPeople;
	}

	public void setRecruitPeople(int recruitPeople) {
		this.recruitPeople = recruitPeople;
	}

	public int getEmp() {
		return emp;
	}

	public void setEmp(int emp) {
		this.emp = emp;
	}

	public Date getStartDate() {
		return startDate;
	}

	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}

	public Date getEndDate() {
		return endDate;
	}

	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}

	public Date getEstablishYear() {
		return establishYear;
	}

	public void setEstablishYear(Date establishYear) {
		this.establishYear = establishYear;
	}

	public int getJobNum() {
		return jobNum;
	}

	public void setJobNum(int jobNum) {
		this.jobNum = jobNum;
	}

	
	
	
	
	
	
	

}//class
