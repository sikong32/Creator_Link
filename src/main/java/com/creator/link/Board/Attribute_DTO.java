package com.creator.link.Board;

public class Attribute_DTO {
	int bat_number;
	String bat_cls;
	int mb_number;
	public Attribute_DTO() {
	}
	public Attribute_DTO(int bat_number, String bat_cls, int mb_number) {
		this.bat_number = bat_number;
		this.bat_cls = bat_cls;
		this.mb_number = mb_number;
	}
	public int getBat_number() {
		return bat_number;
	}
	public void setBat_number(int bat_number) {
		this.bat_number = bat_number;
	}
	public String getBat_cls() {
		return bat_cls;
	}
	public void setBat_cls(String bat_cls) {
		this.bat_cls = bat_cls;
	}
	public int getMb_number() {
		return mb_number;
	}
	public void setMb_number(int mb_number) {
		this.mb_number = mb_number;
	}
}
