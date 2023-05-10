package kr.co.sist.admin.vo;

import java.sql.Date;

public class JobAdNewVO {

	private String cName, title, career, education, empform, sal, area, workHours, recruitField, description;
	private int num, recruitPeople;
	private Date startDate, endDate, inputDate;
	
	
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
	public String getWorkHours() {
		return workHours;
	}
	public void setWorkHours(String workHours) {
		this.workHours = workHours;
	}
	public String getRecruitField() {
		return recruitField;
	}
	public void setRecruitField(String recruitField) {
		this.recruitField = recruitField;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public int getRecruitPeople() {
		return recruitPeople;
	}
	public void setRecruitPeople(int recruitPeople) {
		this.recruitPeople = recruitPeople;
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
	public Date getInputDate() {
		return inputDate;
	}
	public void setInputDate(Date inputDate) {
		this.inputDate = inputDate;
	}
	
	
	@Override
	public String toString() {
		return "JobAdNewVO [cName=" + cName + ", title=" + title + ", career=" + career + ", education=" + education
				+ ", empform=" + empform + ", sal=" + sal + ", area=" + area + ", workHours=" + workHours
				+ ", recruitField=" + recruitField + ", description=" + description + ", num=" + num
				+ ", recruitPeople=" + recruitPeople + ", startDate=" + startDate + ", endDate=" + endDate
				+ ", inputDate=" + inputDate + "]";
	}
	
	
	
}//class
