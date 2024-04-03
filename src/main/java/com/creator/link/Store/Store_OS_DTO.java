package com.creator.link.Store;

public class Store_OS_DTO {
	int os_number;
	String os_1name;
	String os_2name;
	String os_3name;
	String os_price;
	String os_photo;
	String os_stock;
	public Store_OS_DTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Store_OS_DTO(int os_number, String os_1name, String os_2name, String os_3name, String os_price,
			String os_photo, String os_stock) {
		super();
		this.os_number = os_number;
		this.os_1name = os_1name;
		this.os_2name = os_2name;
		this.os_3name = os_3name;
		this.os_price = os_price;
		this.os_photo = os_photo;
		this.os_stock = os_stock;
	}
	public int getOs_number() {
		return os_number;
	}
	public void setOs_number(int os_number) {
		this.os_number = os_number;
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
