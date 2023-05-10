package kr.co.sist.user.vo;

import java.util.Arrays;

/**
 * 충연 insert 기능 확인 0421
 * @author user
 *
 */
public class SkillVO {
	
	private int num,rNum;
	private String userId;
	private String[] nameS;
	
	
	public SkillVO() {
		
	}


	public SkillVO(int num, int rNum, String userId, String[] nameS) {
		this.num = num;
		this.rNum = rNum;
		this.userId = userId;
		this.nameS = nameS;
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


	public String[] getNameS() {
		return nameS;
	}


	public void setNameS(String[] nameS) {
		this.nameS = nameS;
	}


	@Override
	public String toString() {
		return "SkillVO [num=" + num + ", rNum=" + rNum + ", userId=" + userId + ", nameS=" + Arrays.toString(nameS)
				+ "]";
	}


	
	
	
	
	
}
