package kr.co.sist.admin.vo;

import java.sql.Date;
import java.util.Arrays;

public class SelectCorpVO {

	private int num, emp;
	private String name, type, field, addr;
	private String[] representativeName;
	private Date establishYear;
	
	// 생성자
	public SelectCorpVO() {
	}
	
	public SelectCorpVO(int num, int emp, String name, String type, String field, String addr,
			String[] representativeName, Date establishYear) {
		this.num = num;
		this.emp = emp;
		this.name = name;
		this.type = type;
		this.field = field;
		this.addr = addr;
		this.representativeName = representativeName;
		this.establishYear = establishYear;
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
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
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
	
	
	// toString
	@Override
	public String toString() {
		return "RepresentativeVO [num=" + num + ", emp=" + emp + ", name=" + name + ", type=" + type + ", field="
				+ field + ", addr=" + addr + ", representativeName=" + Arrays.toString(representativeName)
				+ ", establishYear=" + establishYear + "]";
	}
}
