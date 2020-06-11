package kr.koreait.vo;

import java.util.Date;

public class GoodsVO {
	
	private int idx;
	private String name;
	private int price;
	private int stock;
	private Date regidate;
	private String value1;
	private String value2;
	private String content;
	private String img;
	private String tumbimg;
	
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getStock() {
		return stock;
	}
	public void setStock(int stock) {
		this.stock = stock;
	}
	public Date getRegidate() {
		return regidate;
	}
	public void setRegidate(Date regidate) {
		this.regidate = regidate;
	}
	public String getValue1() {
		return value1;
	}
	public void setValue1(String value1) {
		this.value1 = value1;
	}
	public String getValue2() {
		return value2;
	}
	public void setValue2(String value2) {
		this.value2 = value2;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public String getTumbimg() {
		return tumbimg;
	}
	public void setTumbimg(String tumbimg) {
		this.tumbimg = tumbimg;
	}
	
	@Override
	public String toString() {
		return "GoodsVO [idx=" + idx + ", name=" + name + ", price=" + price + ", stock=" + stock + ", regidate="
				+ regidate + ", value1=" + value1 + ", value2=" + value2 + ", content=" + content + ", img=" + img
				+ ", tumbimg=" + tumbimg + "]";
	}

}