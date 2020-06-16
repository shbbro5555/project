package kr.koreait.vo;

import java.util.Date;
                                                    
public class GoodsReviewVO {
	private int idx;
	private int main_idx;
	private String title;
	private String content;
	private Date regidate;
	private int rating;
	private String filename;
	private String userId;
	
	
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
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getRegidate() {
		return regidate;
	}
	public void setRegidate(Date regidate) {
		this.regidate = regidate;
	}
	public int getRating() {
		return rating;
	}
	public void setRating(int rating) {
		this.rating = rating;
	}
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	@Override
	public String toString() {
		return "GoodsReviewVO [idx=" + idx + ", main_idx=" + main_idx + ", title=" + title + ", content=" + content
				+ ", regidate=" + regidate + ", rating=" + rating + ", filename=" + filename + ", userId=" + userId
				+ "]";
	}
	
	
	
}
