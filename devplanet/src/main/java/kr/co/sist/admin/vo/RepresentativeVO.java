package kr.co.sist.admin.vo;

import java.sql.Date;
import java.util.Arrays;

public class RepresentativeVO {
	
	private int num, cNum;
	private String name;
	
	// 생성자
	public RepresentativeVO() {
	}
	
	public RepresentativeVO(int num, int cNum, String name) {
		this.num = num;
		this.cNum = cNum;
		this.name = name;
	}
	
	// getter & setter
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public int getcNum() {
		return cNum;
	}
	public void setcNum(int cNum) {
		this.cNum = cNum;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	// toString
	@Override
	public String toString() {
		return "RepresentativeVO [num=" + num + ", cNum=" + cNum + ", name=" + name + "]";
	}
	
	
}
