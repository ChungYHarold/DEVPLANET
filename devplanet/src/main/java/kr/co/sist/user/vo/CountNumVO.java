package kr.co.sist.user.vo;

public class CountNumVO {
	
	private int unread, read;

	public CountNumVO() {
		super();
	}

	public CountNumVO(int unread, int read) {
		super();
		this.unread = unread;
		this.read = read;
	}

	public int getApplyState() {
		return unread;
	}

	public void setApplyState(int unread) {
		this.unread = unread;
	}

	public int getRead() {
		return read;
	}

	public void setRead(int read) {
		this.read = read;
	}

	@Override
	public String toString() {
		return "CountNumVO [unread=" + unread + ", read=" + read + "]";
	}
	
	

}//class
