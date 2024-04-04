package com.creator.link.GiftHub;

public class GiftHub_Creator_DTO {
	
	String mb_photo;
	String mb_nick_name;
	String mb_addr;
	
	public GiftHub_Creator_DTO() {	}

	public GiftHub_Creator_DTO(String mb_photo, String mb_nick_name, String mb_addr) {
		super();
		this.mb_photo = mb_photo;
		this.mb_nick_name = mb_nick_name;
		this.mb_addr = mb_addr;
	}

	public String getMb_photo() {
		return mb_photo;
	}

	public void setMb_photo(String mb_photo) {
		this.mb_photo = mb_photo;
	}

	public String getMb_nick_name() {
		return mb_nick_name;
	}

	public void setMb_nick_name(String mb_nick_name) {
		this.mb_nick_name = mb_nick_name;
	}

	public String getMb_addr() {
		return mb_addr;
	}

	public void setMb_addr(String mb_addr) {
		this.mb_addr = mb_addr;
	}
		
}
