package com.creator.link.Store;

public class Store_OS_DTO {
	String os_name;
	String os_price;
	String os_photo;
	String os_stock;
	public Store_OS_DTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Store_OS_DTO(String os_name, String os_price, String os_photo, String os_stock) {
		super();
		this.os_name = os_name;
		this.os_price = os_price;
		this.os_photo = os_photo;
		this.os_stock = os_stock;
	}
	public String getOs_name() {
		return os_name;
	}
	public void setOs_name(String os_name) {
		this.os_name = os_name;
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
