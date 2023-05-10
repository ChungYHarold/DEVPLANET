package kr.co.sist.user.vo;

import java.util.Arrays;

/**
 * 충연 insert 기능 확인 0421ㄴ
 * @author user
 *
 */
public class LanguageVO {

	private int num, rNum;
	private String userId;
	private String[] nameL, testName, score, getDateL;
	
	public LanguageVO() {
		super();
	}
	public LanguageVO(int num, int rNum, String userId, String[] nameL, String[] testName, String[] score,
			String[] getDateL) {
		super();
		this.num = num;
		this.rNum = rNum;
		this.userId = userId;
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
	public String[] getNameL() {
		return nameL;
	}
	public void setNameL(String[] nameL) {
		this.nameL = nameL;
	}
	public String[] getTestName() {
		return testName;
	}
	public void setTestName(String[] testName) {
		this.testName = testName;
	}
	public String[] getScore() {
		return score;
	}
	public void setScore(String[] score) {
		this.score = score;
	}
	public String[] getGetDateL() {
		return getDateL;
	}
	public void setGetDateL(String[] getDateL) {
		this.getDateL = getDateL;
	}
	@Override
	public String toString() {
		return "LanguageVO [num=" + num + ", rNum=" + rNum + ", userId=" + userId + ", nameL=" + Arrays.toString(nameL)
				+ ", testName=" + Arrays.toString(testName) + ", score=" + Arrays.toString(score) + ", getDateL="
				+ Arrays.toString(getDateL) + "]";
	}
	
	

	
	
	
}
