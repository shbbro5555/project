package kr.koreait.vo;

public class ShoppingCartVO {
	
	private int idx;
	private String userId;
	private int goodsIdx;
	private String count;
				
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

	public int getGoodsIdx() {
		return goodsIdx;
	}
	public void setGoodsIdx(int goodsIdx) {
		this.goodsIdx = goodsIdx;
	}
	public String getCount() {
		return count;
	}
	public void setCount(String count) {
		this.count = count;
	}
	@Override
	public String toString() {
		return "ShoppingCartVO [idx=" + idx + ", userId=" + userId + ", goodsIdx=" + goodsIdx + ", count=" + count
				+ "]";
	}
}
