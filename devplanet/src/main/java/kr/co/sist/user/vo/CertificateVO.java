package kr.co.sist.user.vo;

import java.util.Arrays;

/**
 * 충연 insert 기능 확인 0421
 * @author user
 *
 */
public class CertificateVO {
	
	private int num, rNum;
	private String userId;
	private String[] nameC, issuer, getDateC;
	public CertificateVO() {
		super();
	}
	public CertificateVO(int num, int rNum, String userId, String[] nameC, String[] issuer, String[] getDateC) {
		super();
		this.num = num;
		this.rNum = rNum;
		this.userId = userId;
		this.nameC = nameC;
		this.issuer = issuer;
		this.getDateC = getDateC;
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
	public String[] getNameC() {
		return nameC;
	}
	public void setNameC(String[] nameC) {
		this.nameC = nameC;
	}
	public String[] getIssuer() {
		return issuer;
	}
	public void setIssuer(String[] issuer) {
		this.issuer = issuer;
	}
	public String[] getGetDateC() {
		return getDateC;
	}
	public void setGetDateC(String[] getDateC) {
		this.getDateC = getDateC;
	}
	@Override
	public String toString() {
		return "CertificateVO [num=" + num + ", rNum=" + rNum + ", userId=" + userId + ", nameC="
				+ Arrays.toString(nameC) + ", issuer=" + Arrays.toString(issuer) + ", getDateC="
				+ Arrays.toString(getDateC) + "]";
	}
	
	
	

	

	
}
