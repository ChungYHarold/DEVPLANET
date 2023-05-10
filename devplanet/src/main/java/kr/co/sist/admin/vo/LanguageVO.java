package kr.co.sist.admin.vo;

public class LanguageVO {

	 private int num; //번호
	private String name, testName, score, getDate; //어학명,시험명,점수,취득일
	
	
	
	
	public LanguageVO() {
		super();
	}
	public LanguageVO(int num, String name, String testName, String score, String getDate) {
		super();
		this.num = num;
		this.name = name;
		this.testName = testName;
		this.score = score;
		this.getDate = getDate;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getTestName() {
		return testName;
	}
	public void setTestName(String testName) {
		this.testName = testName;
	}
	public String getScore() {
		return score;
	}
	public void setScore(String score) {
		this.score = score;
	}
	public String getGetDate() {
		return getDate;
	}
	public void setGetDate(String getDate) {
		this.getDate = getDate;
	}
	@Override
	public String toString() {
		return "LanguageVO [num=" + num + ", name=" + name + ", testName=" + testName + ", score=" + score
				+ ", getDate=" + getDate + "]";
	}
	
	
	
}
