package kr.koreait.vo;

import java.util.Date;
/**
 * 회원에 관한 정보들의 getter setter을 만든 VO클래스 입니다.
 * @author 이민형
 * @version	1.0
 */
public class MemberVO {
	private int userIdx;				// 번호
	private String userId;				// 아이디
	private String userPassword;		// 비밀번호
	private String userEmail;			// 이메일
	private String userName;			// 이름
	private String userPhoneNumber;		// 휴대폰 번호
	private String userAddress;			// 주소
	private Date regiDate;				// 가입일
	private String kind;
	
	
	public int getUserIdx() {
		return userIdx;
	}
	public void setUserIdx(int userIdx) {
		this.userIdx = userIdx;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserPassword() {
		return userPassword;
	}
	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}
	public String getUserEmail() {
		return userEmail;
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserPhoneNumber() {
		return userPhoneNumber;
	}
	public void setUserPhoneNumber(String userPhoneNumber) {
		this.userPhoneNumber = userPhoneNumber;
	}
	public String getUserAddress() {
		return userAddress;
	}
	public void setUserAddress(String userAddress) {
		this.userAddress = userAddress;
	}
	public Date getRegiDate() {
		return regiDate;
	}
	public void setRegiDate(Date regiDate) {
		this.regiDate = regiDate;
	}
	public String getKind() {
		return kind;
	}
	public void setKind(String kind) {
		this.kind = kind;
	}
	
	@Override
	public String toString() {
		return "MemberVO [userIdx=" + userIdx + ", userId=" + userId + ", userPassword=" + userPassword + ", userEmail="
				+ userEmail + ", userName=" + userName + ", userPhoneNumber=" + userPhoneNumber + ", userAddress="
				+ userAddress + ", regiDate=" + regiDate + ", kind=" + kind + "]";
	}

	
	
	
	
}
