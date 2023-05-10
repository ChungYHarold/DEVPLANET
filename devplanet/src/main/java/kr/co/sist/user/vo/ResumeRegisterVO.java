package kr.co.sist.user.vo;

/**
 * 
 * 2023-04-23 확인
 * 이력서 수정page에서 저장 버튼 누르면
 * 이력서 테이블에 update될 항목
 * @author 경태
 *
 */
public class ResumeRegisterVO {

	private int rNum;
	private String title, job, career, empform, sal, area; 

	public ResumeRegisterVO() {
		super();
	}

	public ResumeRegisterVO(int rNum, String title, String job, String career, String empform, String sal,
			String area) {
		super();
		this.rNum = rNum;
		this.title = title;
		this.job = job;
		this.career = career;
		this.empform = empform;
		this.sal = sal;
		this.area = area;
	}

	public int getrNum() {
		return rNum;
	}

	public void setrNum(int rNum) {
		this.rNum = rNum;
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
		return "ResumeRegisterVO [rNum=" + rNum + ", title=" + title + ", job=" + job + ", career=" + career
				+ ", empform=" + empform + ", sal=" + sal + ", area=" + area + ", getrNum()=" + getrNum()
				+ ", getTitle()=" + getTitle() + ", getJob()=" + getJob() + ", getCareer()=" + getCareer()
				+ ", getEmpform()=" + getEmpform() + ", getSal()=" + getSal() + ", getArea()=" + getArea()
				+ ", getClass()=" + getClass() + ", hashCode()=" + hashCode() + ", toString()=" + super.toString()
				+ "]";
	}

	
}//class
