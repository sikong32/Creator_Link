package com.creator.link;

import com.creator.link.Member.Member_DTO;
import com.creator.link.Store.Store_DTO;

public class Search_DTO {
	String mb_id;
	String mb_nick_name;
	String pd_name;
	int pd_price;
	String pd_photo;
	int pd_stock;
	int pd_number;
	Store_DTO store_dto;
	Member_DTO member_dto;
	public String getMb_id() {
		return mb_id;
	}
	public void setMb_id(String mb_id) {
		this.mb_id = mb_id;
	}
	public String getMb_nick_name() {
		return mb_nick_name;
	}
	public void setMb_nick_name(String mb_nick_name) {
		this.mb_nick_name = mb_nick_name;
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
	public String getPd_photo() {
		return pd_photo;
	}
	public void setPd_photo(String pd_photo) {
		this.pd_photo = pd_photo;
	}
	public int getPd_stock() {
		return pd_stock;
	}
	public void setPd_stock(int pd_stock) {
		this.pd_stock = pd_stock;
	}
	public Store_DTO getStore_dto() {
		return store_dto;
	}
	public void setStore_dto(Store_DTO store_dto) {
		this.store_dto = store_dto;
	}
	public Member_DTO getMember_dto() {
		return member_dto;
	}
	public void setMember_dto(Member_DTO member_dto) {
		this.member_dto = member_dto;
	}
	public int getPd_number() {
		return pd_number;
	}
	public void setPd_number(int pd_number) {
		this.pd_number = pd_number;
	}
}
