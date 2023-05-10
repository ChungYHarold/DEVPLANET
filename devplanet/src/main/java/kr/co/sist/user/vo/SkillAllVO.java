package kr.co.sist.user.vo;

/**
 * 2023-04-24 확인
 * 수정 page에서 스킬
 * select, delete 
 * @author 경태
 *
 */
public class SkillAllVO {

	private String name;
	private int num;
	public SkillAllVO() {
		super();
	}
	public SkillAllVO(String name, int num) {
		super();
		this.name = name;
		this.num = num;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	@Override
	public String toString() {
		return "SkillAllVO [name=" + name + ", num=" + num + "]";
	}

	
	
}//class
