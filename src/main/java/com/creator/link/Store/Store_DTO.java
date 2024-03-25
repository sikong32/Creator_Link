package com.creator.link.Store;

public class Store_DTO {
	int pd_number;
	String pd_name;
	int pd_price;
	String pd_category;
	String pd_content;
	String pd_photo;
	String pd_size;
	int pd_stock;
	int pd_table;
	int mb_number;
	int pc_number;
	String mf_name;
	
	public Store_DTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public Store_DTO(int pd_number, String pd_name, int pd_price, String pd_category, String pd_content,
			String pd_photo, String pd_size, int pd_stock, int pd_table, int mb_number, int pc_number, String mf_name) {
		super();
		this.pd_number = pd_number;
		this.pd_name = pd_name;
		this.pd_price = pd_price;
		this.pd_category = pd_category;
		this.pd_content = pd_content;
		this.pd_photo = pd_photo;
		this.pd_size = pd_size;
		this.pd_stock = pd_stock;
		this.pd_table = pd_table;
		this.mb_number = mb_number;
		this.pc_number = pc_number;
		this.mf_name = mf_name;
	}
	public int getPd_number() {
		return pd_number;
	}
	public void setPd_number(int pd_number) {
		this.pd_number = pd_number;
	}
	public String getPd_name() {
		return pd_name;
	}
	public void setPd_name(String pd_name) {
		this.pd_name = pd_name;
	}
	public int getPd_price() {
		return pd_price;
	}
	public void setPd_price(int pd_price) {
		this.pd_price = pd_price;
	}
	public String getPd_category() {
		return pd_category;
	}
	public void setPd_category(String pd_category) {
		this.pd_category = pd_category;
	}
	public String getPd_content() {
		return pd_content;
	}
	public void setPd_content(String pd_content) {
		this.pd_content = pd_content;
	}
	public String getPd_photo() {
		return pd_photo;
	}
	public void setPd_photo(String pd_photo) {
		this.pd_photo = pd_photo;
	}
	public String getPd_size() {
		return pd_size;
	}
	public void setPd_size(String pd_size) {
		this.pd_size = pd_size;
	}
	public int getPd_stock() {
		return pd_stock;
	}
	public void setPd_stock(int pd_stock) {
		this.pd_stock = pd_stock;
	}
	public int getPd_table() {
		return pd_table;
	}
	public void setPd_table(int pd_table) {
		this.pd_table = pd_table;
	}
	public int getMb_number() {
		return mb_number;
	}
	public void setMb_number(int mb_number) {
		this.mb_number = mb_number;
	}
	public int getPc_number() {
		return pc_number;
	}
	public void setPc_number(int pc_number) {
		this.pc_number = pc_number;
	}
	public String getMf_name() {
		return mf_name;
	}
	public void setMf_name(String mf_name) {
		this.mf_name = mf_name;
	}
	
}
