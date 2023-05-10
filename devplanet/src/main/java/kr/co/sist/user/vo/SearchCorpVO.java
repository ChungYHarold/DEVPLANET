package kr.co.sist.user.vo;

public class SearchCorpVO {

	private String logo,cName,title,field;
	private int jobNum;
	
	public SearchCorpVO() {
		
	}//持失切
	
	
	public SearchCorpVO(String logo, String cName, String title, String field, int jobNum) {
		this.logo = logo;
		this.cName = cName;
		this.title = title;
		this.jobNum = jobNum;
	}//昔切持失切

	
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
	

	public String getField() {
		return field;
	}


	public void setField(String field) {
		this.field = field;
	}


	@Override
	public String toString() {
		return "SearchCorpVO [logo=" + logo + ", cName=" + cName + ", title=" + title + ", jobNum=" + jobNum + "]";
	}
	
	
	
	
}//class
