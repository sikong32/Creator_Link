package com.creator.link.Store;

public class Category_DTO {
	int prbt_number;
	String prbt_big_cls;
	String prdt_mid_cls;
	String prdt_small_cls;
	public Category_DTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Category_DTO(int prbt_number, String prbt_big_cls, String prdt_mid_cls, String prdt_small_cls) {
		super();
		this.prbt_number = prbt_number;
		this.prbt_big_cls = prbt_big_cls;
		this.prdt_mid_cls = prdt_mid_cls;
		this.prdt_small_cls = prdt_small_cls;
	}
	public int getPrbt_number() {
		return prbt_number;
	}
	public void setPrbt_number(int prbt_number) {
		this.prbt_number = prbt_number;
	}
	public String getPrbt_big_cls() {
		return prbt_big_cls;
	}
	public void setPrbt_big_cls(String prbt_big_cls) {
		this.prbt_big_cls = prbt_big_cls;
	}
	public String getPrdt_mid_cls() {
		return prdt_mid_cls;
	}
	public void setPrdt_mid_cls(String prdt_mid_cls) {
		this.prdt_mid_cls = prdt_mid_cls;
	}
	public String getPrdt_small_cls() {
		return prdt_small_cls;
	}
	public void setPrdt_small_cls(String prdt_small_cls) {
		this.prdt_small_cls = prdt_small_cls;
	}
	
}
