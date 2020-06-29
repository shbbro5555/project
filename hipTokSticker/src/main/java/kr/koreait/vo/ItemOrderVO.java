package kr.koreait.vo;

public class ItemOrderVO {
	private int idx;
	private String userId;
	private String userName;
	private String price;
	private String addressNum;
	private String address;
	private String phoneNum;
	private String email;
	private String request;
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getAddressNum() {
		return addressNum;
	}
	public void setAddressNum(String addressNum) {
		this.addressNum = addressNum;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getPhoneNum() {
		return phoneNum;
	}
	public void setPhoneNum(String phoneNum) {
		this.phoneNum = phoneNum;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getRequest() {
		return request;
	}
	public void setRequest(String request) {
		this.request = request;
	}
	@Override
	public String toString() {
		return "ItemOrderVO [idx=" + idx + ", userId=" + userId + ", userName=" + userName + ", price=" + price
				+ ", addressNum=" + addressNum + ", address=" + address + ", phoneNum=" + phoneNum + ", email=" + email
				+ ", request=" + request + "]";
	}
	
}
