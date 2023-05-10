package kr.co.sist.user.vo;

public class EducationAllVO {
	
	private int num;
	private String schoolType, schoolName, period, major,gpa;
	
	public EducationAllVO() {
	}
	public EducationAllVO(int num, String schoolType, String schoolName, String period, String major, String gpa) {
		super();
		this.num = num;
		this.schoolType = schoolType;
		this.schoolName = schoolName;
		this.period = period;
		this.major = major;
		this.gpa = gpa;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getSchoolType() {
		return schoolType;
	}
	public void setSchoolType(String schoolType) {
		this.schoolType = schoolType;
	}
	public String getSchoolName() {
		return schoolName;
	}
	public void setSchoolName(String schoolName) {
		this.schoolName = schoolName;
	}
	public String getPeriod() {
		return period;
	}
	public void setPeriod(String period) {
		this.period = period;
	}
	public String getMajor() {
		return major;
	}
	public void setMajor(String major) {
		this.major = major;
	}
	public String getGpa() {
		return gpa;
	}
	public void setGpa(String gpa) {
		this.gpa = gpa;
	}
	@Override
	public String toString() {
		return "EducationAllVO [num=" + num + ", schoolType=" + schoolType + ", schoolName=" + schoolName + ", period="
				+ period + ", major=" + major + ", gpa=" + gpa + "]";
	}
	
	
	
	

}//class
