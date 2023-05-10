package kr.co.sist.user.vo;

/**
 * 2023-04-21 확인
 * 경태
 * 이력서등록 page 회원Table 
 * insert
 * @author 경태
 *
 */
public class ResumeInsertVO {

	private String userId, title, job, career, empform, sal, area;

	public ResumeInsertVO() {
		super();
	}

	public ResumeInsertVO(String userId, String title, String job, String career, String empform, String sal,
			String area) {
		super();
		this.userId = userId;
		this.title = title;
		this.job = job;
		this.career = career;
		this.empform = empform;
		this.sal = sal;
		this.area = area;
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

	@Override
	public String toString() {
		return "ResumeInsertVO [userId=" + userId + ", title=" + title + ", job=" + job + ", career=" + career
				+ ", empform=" + empform + ", sal=" + sal + ", area=" + area + "]";
	} 
	
}//ResumeInsertVO
