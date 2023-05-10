package kr.co.sist.user.vo;

public class CertificateAllVO {
	
	private int num;
	private String nameC, issuer, getDateC;
	
	public CertificateAllVO() {
		super();
	}
	
	public CertificateAllVO(int num, String nameC, String issuer, String getDateC) {
		super();
		this.num = num;
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
	public String getNameC() {
		return nameC;
	}
	public void setNameC(String nameC) {
		this.nameC = nameC;
	}
	public String getIssuer() {
		return issuer;
	}
	public void setIssuer(String issuer) {
		this.issuer = issuer;
	}
	public String getGetDateC() {
		return getDateC;
	}
	public void setGetDateC(String getDateC) {
		this.getDateC = getDateC;
	}
	@Override
	public String toString() {
		return "CertificateAllVO [num=" + num + ", nameC=" + nameC + ", issuer=" + issuer + ", getDateC=" + getDateC
				+ "]";
	}
	
	

}
