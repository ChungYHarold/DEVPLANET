package kr.co.sist.user.vo;

public class OptionVO {
	
	private String progress, readState, cancel, corpName, userId;

	public OptionVO() {
		super();
	}

	public OptionVO(String progress, String readState, String cancel, String corpName, String userId) {
		super();
		this.progress = progress;
		this.readState = readState;
		this.cancel = cancel;
		this.corpName = corpName;
	}

	public String getProgress() {
		return progress;
	}

	public void setProgress(String progress) {
		this.progress = progress;
	}

	public String getReadState() {
		return readState;
	}

	public void setReadState(String readState) {
		this.readState = readState;
	}

	public String getCancel() {
		return cancel;
	}

	public void setCancel(String cancel) {
		this.cancel = cancel;
	}

	public String getCorpName() {
		return corpName;
	}

	public void setCorpName(String corpName) {
		this.corpName = corpName;
	}
	

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	@Override
	public String toString() {
		return "OptionVO [progress=" + progress + ", readState=" + readState + ", cancel=" + cancel + ", corpName="
				+ corpName + "]";
	}
	
	

}//class
