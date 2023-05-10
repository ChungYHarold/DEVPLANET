package kr.co.sist.user.vo;

import java.util.Arrays;

/**
 * 충연 insert 기능 확인 0421
 * @author user
 *
 */
public class EducationVO {

	private int num, rNum;
	private String userId;
	private String[] schoolType, schoolName, period, major,gpa;
	
	
	public EducationVO() {
		
	}
	public EducationVO(int num, int rNum, String userId, String[] schoolType, String[] schoolName, String[] period,
			String[] major, String[] gpa) {
		this.num = num;
		this.rNum = rNum;
		this.userId = userId;
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
	public String[] getSchoolType() {
		return schoolType;
	}
	public void setSchoolType(String[] schoolType) {
		this.schoolType = schoolType;
	}
	public String[] getSchoolName() {
		return schoolName;
	}
	public void setSchoolName(String[] schoolName) {
		this.schoolName = schoolName;
	}
	public String[] getPeriod() {
		return period;
	}
	public void setPeriod(String[] period) {
		this.period = period;
	}
	public String[] getMajor() {
		return major;
	}
	public void setMajor(String[] major) {
		this.major = major;
	}
	public String[] getGpa() {
		return gpa;
	}
	public void setGpa(String[] gpa) {
		this.gpa = gpa;
	}
	@Override
	public String toString() {
		return "EducationVO [num=" + num + ", rNum=" + rNum + ", userId=" + userId + ", schoolType="
				+ Arrays.toString(schoolType) + ", schoolName=" + Arrays.toString(schoolName) + ", period="
				+ Arrays.toString(period) + ", major=" + Arrays.toString(major) + ", gpa=" + Arrays.toString(gpa) + "]";
	}
	
	
	
	
	
	
	
}
