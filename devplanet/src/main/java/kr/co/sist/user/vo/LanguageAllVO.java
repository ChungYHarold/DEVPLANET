package kr.co.sist.user.vo;

/**
 * 2023-04-24 작성
 * 수정 page에서 어학
 * @author user 충연
 */
public class LanguageAllVO {
	private int num;
	private String nameL, testName, score, getDateL;
	public LanguageAllVO() {
		super();
	}
	public LanguageAllVO(int num, String nameL, String testName, String score, String getDateL) {
		super();
		this.num = num;
		this.nameL = nameL;
		this.testName = testName;
		this.score = score;
		this.getDateL = getDateL;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getNameL() {
		return nameL;
	}
	public void setNameL(String nameL) {
		this.nameL = nameL;
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
	public String getGetDateL() {
		return getDateL;
	}
	public void setGetDateL(String getDateL) {
		this.getDateL = getDateL;
	}
	@Override
	public String toString() {
		return "LanguageAllVO [num=" + num + ", nameL=" + nameL + ", testName=" + testName + ", score=" + score
				+ ", getDateL=" + getDateL + "]";
	}
	
	
	
	
	
	
	
}//class
