package kr.co.sist.user.vo;

public class CompanyVO {
	
	private String logo,cName,title;
	private int jobNum;
	
	
	public CompanyVO() {
		
	}
	
	
	public CompanyVO(String logo, String cName, String title, int jobNum) {
		this.logo = logo;
		this.cName = cName;
		this.title = title;
		this.jobNum = jobNum;
	}

	
	public String getLogo() {
		return logo;
	}
	
	public void setLogo(String logo) {
		this.logo = logo;
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
	
	public int getjobNum() {
		return jobNum;
	}
	
	public void setjobNum(int jobNum) {
		this.jobNum = jobNum;
	}

	
	@Override
	public String toString() {
		return "CompanyVO [logo=" + logo + ", cName=" + cName + ", title=" + title + ", jobNum=" + jobNum + "]";
	}

	
	
	
	
}//class
