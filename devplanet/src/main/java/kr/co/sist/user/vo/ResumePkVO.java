package kr.co.sist.user.vo;


//?´? ¥?„œì¡°íšŒVO
public class ResumePkVO {
	
	//?´? ¥?„œ ë²ˆí˜¸ / ?•„?´?”” 
	private int rNum;
	private String userId;
	
	public ResumePkVO() {
		super();
	}
	
	public ResumePkVO(int rNum, String userId) {
		super();
		this.rNum = rNum;
		this.userId = userId;
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
	@Override
	public String toString() {
		return "UserTableVO [rNum=" + rNum + ", userId=" + userId + "]";
	}
	
	
	
	
	
}//class
	
