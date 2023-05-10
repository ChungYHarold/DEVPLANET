package kr.co.sist.admin.vo;

import java.sql.Date;
import java.util.Arrays;

public class AdminCorpVO {
	private int num, emp, zipcode;
	private String name, businessNum, homepage, type, field, addr, detailAddr, logo;
	private String[] representativeName;
	private Date establishYear, inputDate;
	
	// 생성자
	public AdminCorpVO() {
	}
	
	public AdminCorpVO(int num, int emp, String name, String businessNum, String homepage, String type, String field,
			int zipcode, String addr, String detailAddr, String logo, String[] representativeName,
			Date establishYear, Date inputDate) {
		this.num = num;
		this.emp = emp;
		this.name = name;
		this.businessNum = businessNum;
		this.homepage = homepage;
		this.type = type;
		this.field = field;
		this.zipcode = zipcode;
		this.addr = addr;
		this.detailAddr = detailAddr;
		this.logo = logo;
		this.representativeName = representativeName;
		this.establishYear = establishYear;
		this.inputDate = inputDate;
	}
	
	// getter & setter
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public int getEmp() {
		return emp;
	}
	public void setEmp(int emp) {
		this.emp = emp;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getBusinessNum() {
		return businessNum;
	}
	public void setBusinessNum(String businessNum) {
		this.businessNum = businessNum;
	}
	public String getHomepage() {
		return homepage;
	}
	public void setHomepage(String homepage) {
		this.homepage = homepage;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getField() {
		return field;
	}
	public void setField(String field) {
		this.field = field;
	}
	public int getZipcode() {
		return zipcode;
	}
	public void setZipcode(int zipcode) {
		this.zipcode = zipcode;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getDetailAddr() {
		return detailAddr;
	}
	public void setDetailAddr(String detailAddr) {
		this.detailAddr = detailAddr;
	}
	public String getLogo() {
		return logo;
	}
	public void setLogo(String logo) {
		this.logo = logo;
	}
	public String[] getRepresentativeName() {
		return representativeName;
	}
	public void setRepresentativeName(String[] representativeName) {
		this.representativeName = representativeName;
	}
	public Date getEstablishYear() {
		return establishYear;
	}
	public void setEstablishYear(Date establishYear) {
		this.establishYear = establishYear;
	}
	public Date getInputDate() {
		return inputDate;
	}
	public void setInputDate(Date inputDate) {
		this.inputDate = inputDate;
	}
	
	// toString
	@Override
	public String toString() {
		return "AdminCorpVO [num=" + num + ", emp=" + emp + ", name=" + name + ", businessNum=" + businessNum
				+ ", homepage=" + homepage + ", type=" + type + ", field=" + field + ", zipcode=" + zipcode + ", addr="
				+ addr + ", detailAddr=" + detailAddr + ", logo=" + logo + ", representativeName="
				+ Arrays.toString(representativeName) + ", establishYear=" + establishYear + ", inputDate="
				+ inputDate + "]";
	} 
	
}
