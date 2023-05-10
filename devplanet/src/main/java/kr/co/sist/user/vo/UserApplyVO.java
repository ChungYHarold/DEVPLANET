package kr.co.sist.user.vo;

public class UserApplyVO {
	
	private String companyName, title, readState, applyState;
	private int progress, jobNum;

	public UserApplyVO() {
		super();
	}

	public UserApplyVO(String companyName, String title, String readState, String applyState, int progress, int jobNum) {
		super();
		this.companyName = companyName;
		this.title = title;
		this.readState = readState;
		this.applyState = applyState;
		this.progress = progress;
		this.jobNum=jobNum;
	}

	public String getCompanyName() {
		return companyName;
	}

	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getReadState() {
		return readState;
	}

	public void setReadState(String readState) {
		this.readState = readState;
	}

	public String getApplyState() {
		return applyState;
	}

	public void setApplyState(String applyState) {
		this.applyState = applyState;
	}

	public int getProgress() {
		return progress;
	}

	public void setProgress(int progress) {
		this.progress = progress;
	}
	
	

	public int getjobNum() {
		return jobNum;
	}

	public void setjobNum(int jobNum) {
		this.jobNum = jobNum;
	}

	@Override
	public String toString() {
		return "UserApplyVO [companyName=" + companyName + ", title=" + title + ", readState=" + readState
				+ ", applyState=" + applyState + ", progress=" + progress + "]";
	}
	
	

}//class
