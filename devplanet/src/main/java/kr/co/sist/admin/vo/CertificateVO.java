package kr.co.sist.admin.vo;

public class CertificateVO {

	private int num;
	private String name, issuer, getDate; //이름, 발행처, 취득일
	
	
	
	public CertificateVO() {

	}

	public CertificateVO(int num, String name, String issuer, String getDate) {
		this.num = num;
		this.name = name;
		this.issuer = issuer;
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
	public String getIssuer() {
		return issuer;
	}
	public void setIssuer(String issuer) {
		this.issuer = issuer;
	}
	public String getGetDate() {
		return getDate;
	}
	public void setGetDate(String getDate) {
		this.getDate = getDate;
	}

	@Override
	public String toString() {
		return "CertificateVO [num=" + num + ", name=" + name + ", issuer=" + issuer + ", getDate=" + getDate + "]";
	}
	
	
	
	
	
}
