package kr.co.sist.user.vo;

public class SearchResultVO {
	
	private String corpName, title, readState, progress, cancel;

	public SearchResultVO() {
		super();
	}

	public SearchResultVO(String corpName, String title, String readState, String progress, String cancel) {
		super();
		this.corpName = corpName;
		this.title = title;
		this.readState = readState;
		this.progress = progress;
		this.cancel = cancel;
	}

	public String getCorpName() {
		return corpName;
	}

	public void setCorpName(String corpName) {
		this.corpName = corpName;
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

	public String getProgress() {
		return progress;
	}

	public void setProgress(String progress) {
		this.progress = progress;
	}

	public String getCancel() {
		return cancel;
	}

	public void setCancel(String cancel) {
		this.cancel = cancel;
	}
	
	

}//class
