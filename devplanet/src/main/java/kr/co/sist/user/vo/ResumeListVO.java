package kr.co.sist.user.vo;

/**
 * 2023-04-22 확인
 * 경태
 * 이력서현황판에서 이력서제목 list 보여주기
 * @author 경태
 */
public class ResumeListVO {

	private int rNum;
	private String title;
	
	
	
	public ResumeListVO() {
		super();
	}
	public ResumeListVO(int rNum, String title) {
		super();
		this.rNum = rNum;
		this.title = title;
	}
	public int getrNum() {
		return rNum;
	}
	public void setrNum(int rNum) {
		this.rNum = rNum;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	@Override
	public String toString() {
		return "ResumeListVO [rNum=" + rNum + ", title=" + title + "]";
	}
	
	
	
}//class
