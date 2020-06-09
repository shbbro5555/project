package kr.koreait.vo;

import java.sql.Date;

public class GoodsVO {
	private int idx;
	private String gdsName;
	private String gdsPrice;
	private String gdsStock;
	private String gdsDes;
	private Date register_date;
	private String goods_value;
	바꿧다.
	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
	}

	public String getGdsName() {
		return gdsName;
	}

	public void setGdsName(String gdsName) {
		this.gdsName = gdsName;
	}

	public String getGdsPrice() {
		return gdsPrice;
	}

	public void setGdsPrice(String gdsPrice) {
		this.gdsPrice = gdsPrice;
	}

	public String getGdsStock() {
		return gdsStock;
	}

	public void setGdsStock(String gdsStock) {
		this.gdsStock = gdsStock;
	}

	public String getGdsDes() {
		return gdsDes;
	}

	public void setGdsDes(String gdsDes) {
		this.gdsDes = gdsDes;
	}

	public Date getRegister_date() {
		return register_date;
	}

	public void setRegister_date(Date register_date) {
		this.register_date = register_date;
	}

	public String getGoods_value() {
		return goods_value;
	}

	public void setGoods_value(String goods_value) {
		this.goods_value = goods_value;
	}

	@Override
	public String toString() {
		return "GoodsVO [idx=" + idx + ", gdsName=" + gdsName + ", gdsPrice=" + gdsPrice + ", gdsStock=" + gdsStock
				+ ", gdsDes=" + gdsDes + ", goods_value=" + goods_value + "]";
	}

}
