package kr.co.sist.admin.vo;

import java.sql.Date;

public class AdminUserVO {

	private int num, zipcode;
	private String name, id, tel, homepage, email, addr, detailAddr, img;
	private Date birthDate;
	
	// 생성자
	public AdminUserVO() {
	}
	
	public AdminUserVO(int num, String name, String id, String tel, String homepage, String email, int zipcode,
			String addr, String detailAddr, String img, Date birthDate) {
		this.num = num;
		this.name = name;
		this.id = id;
		this.tel = tel;
		this.homepage = homepage;
		this.email = email;
		this.zipcode = zipcode;
		this.addr = addr;
		this.detailAddr = detailAddr;
		this.img = img;
		this.birthDate = birthDate;
	}
	
	// getter & setter
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
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getHomepage() {
		return homepage;
	}
	public void setHomepage(String homepage) {
		this.homepage = homepage;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
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
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public Date getBirthDate() {
		return birthDate;
	}
	public void setBirthDate(Date birthDate) {
		this.birthDate = birthDate;
	}
	
	// toStirng
	@Override
	public String toString() {
		return "AdminUserDAO [num=" + num + ", name=" + name + ", id=" + id + ", tel=" + tel + ", homepage=" + homepage
				+ ", email=" + email + ", zipcode=" + zipcode + ", addr=" + addr + ", detailAddr=" + detailAddr
				+ ", img=" + img + ", birthDate=" + birthDate + "]";
	}
}
