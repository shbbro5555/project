package kr.koreait.vo;

import java.util.Date;

public class QnAVO {
	private int idx;
	private String title;
	private String content;
	private String writer;
	private Date regidate;
	private String userId;
	private int nov;
	private int commentNumber;
	private String kind;
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
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
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public Date getRegidate() {
		return regidate;
	}
	public void setRegidate(Date regidate) {
		this.regidate = regidate;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public int getNov() {
		return nov;
	}
	public void setNov(int nov) {
		this.nov = nov;
	}
	public int getCommentNumber() {
		return commentNumber;
	}
	public void setCommentNumber(int commentNumber) {
		this.commentNumber = commentNumber;
	}
	public String getKind() {
		return kind;
	}
	public void setKind(String kind) {
		this.kind = kind;
	}
	@Override
	public String toString() {
		return "QNAVO [idx=" + idx + ", title=" + title + ", content=" + content + ", writer=" + writer + ", regidate="
				+ regidate + ", userId=" + userId + ", nov=" + nov + ", commentNumber=" + commentNumber + ", kind="
				+ kind + "]";
	}
	
	
}
