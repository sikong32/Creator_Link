package com.creator.link.Store;

public class Store_OS_DTO {
	int os_number;
	int pd_number;
	String os_1name;
	String os_2name;
	String os_3name;
	String os_price;
	String os_photo;
	String os_stock;
	int os_buy_su;
	String pd_name;
	int ct_pd_qnt;
	public Store_OS_DTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Store_OS_DTO(int os_number, int pd_number, String os_1name, String os_2name, String os_3name,
			String os_price, String os_photo, String os_stock) {
		super();
		this.os_number = os_number;
		this.pd_number = pd_number;
		this.os_1name = os_1name;
		this.os_2name = os_2name;
		this.os_3name = os_3name;
		this.os_price = os_price;
		this.os_photo = os_photo;
		this.os_stock = os_stock;
	}
	
	public int getCt_pd_qnt() {
		return ct_pd_qnt;
	}
	public void setCt_pd_qnt(int ct_pd_qnt) {
		this.ct_pd_qnt = ct_pd_qnt;
	}
	public String getPd_name() {
		return pd_name;
	}
	public void setPd_name(String pd_name) {
		this.pd_name = pd_name;
	}
	public int getOs_buy_su() {
		return os_buy_su;
	}
	public void setOs_buy_su(int os_buy_su) {
		this.os_buy_su = os_buy_su;
	}
	public int getOs_number() {
		return os_number;
	}
	public void setOs_number(int os_number) {
		this.os_number = os_number;
	}
	public int getPd_number() {
		return pd_number;
	}
	public void setPd_number(int pd_number) {
		this.pd_number = pd_number;
	}
	public String getOs_1name() {
		return os_1name;
	}
	public void setOs_1name(String os_1name) {
		this.os_1name = os_1name;
	}
	public String getOs_2name() {
		return os_2name;
	}
	public void setOs_2name(String os_2name) {
		this.os_2name = os_2name;
	}
	public String getOs_3name() {
		return os_3name;
	}
	public void setOs_3name(String os_3name) {
		this.os_3name = os_3name;
	}
	public String getOs_price() {
		return os_price;
	}
	public void setOs_price(String os_price) {
		this.os_price = os_price;
	}
	public String getOs_photo() {
		return os_photo;
	}
	public void setOs_photo(String os_photo) {
		this.os_photo = os_photo;
	}
	public String getOs_stock() {
		return os_stock;
	}
	public void setOs_stock(String os_stock) {
		this.os_stock = os_stock;
	}
	
	
}
