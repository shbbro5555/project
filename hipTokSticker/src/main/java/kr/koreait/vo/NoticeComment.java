package kr.koreait.vo;

import java.util.Date;

public class NoticeComment {
	
	private int idx;
	private int main_idx;
	private String content;
	private String userId;
	private Date regidate;
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public int getMain_idx() {
		return main_idx;
	}
	public void setMain_idx(int main_idx) {
		this.main_idx = main_idx;
	}
	
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public Date getRegidate() {
		return regidate;
	}
	public void setRegidate(Date regidate) {
		this.regidate = regidate;
	}
	@Override
	public String toString() {
		return "NoticeComment [idx=" + idx + ", main_idx=" + main_idx + ", content=" + content + ", userId=" + userId
				+ ", regidate=" + regidate + "]";
	}
	
	
	
}
