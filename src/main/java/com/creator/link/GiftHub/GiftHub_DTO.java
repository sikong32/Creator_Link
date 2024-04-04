package com.creator.link.GiftHub;

public class GiftHub_DTO {
	
	int gh_number;
	String gh_box_size;
	String gh_big_cls;
	String gh_mid_cls;
	String gh_dtcl;
	String gh_addr;
	String gh_mb_addr;
	int gh_table;
	int mb_number;
	
	public GiftHub_DTO() {	}
	
	public GiftHub_DTO(int gh_number, String gh_box_size, String gh_big_cls, String gh_mid_cls, String gh_dtcl,
			String gh_addr, String gh_mb_addr, int gh_table, int mb_number) {
		super();
		this.gh_number = gh_number;
		this.gh_box_size = gh_box_size;
		this.gh_big_cls = gh_big_cls;
		this.gh_mid_cls = gh_mid_cls;
		this.gh_dtcl = gh_dtcl;
		this.gh_addr = gh_addr;
		this.gh_mb_addr = gh_mb_addr;
		this.gh_table = gh_table;
		this.mb_number = mb_number;
	}
	
	public int getGh_number() {
		return gh_number;
	}
	public void setGh_number(int gh_number) {
		this.gh_number = gh_number;
	}
	public String getGh_box_size() {
		return gh_box_size;
	}
	public void setGh_box_size(String gh_box_size) {
		this.gh_box_size = gh_box_size;
	}
	public String getGh_big_cls() {
		return gh_big_cls;
	}
	public void setGh_big_cls(String gh_big_cls) {
		this.gh_big_cls = gh_big_cls;
	}
	public String getGh_mid_cls() {
		return gh_mid_cls;
	}
	public void setGh_mid_cls(String gh_mid_cls) {
		this.gh_mid_cls = gh_mid_cls;
	}
	public String getGh_dtcl() {
		return gh_dtcl;
	}
	public void setGh_dtcl(String gh_dtcl) {
		this.gh_dtcl = gh_dtcl;
	}
	public String getGh_addr() {
		return gh_addr;
	}
	public void setGh_addr(String gh_addr) {
		this.gh_addr = gh_addr;
	}
	public String getGh_mb_addr() {
		return gh_mb_addr;
	}
	public void setGh_mb_addr(String gh_mb_addr) {
		this.gh_mb_addr = gh_mb_addr;
	}
	public int getGh_table() {
		return gh_table;
	}
	public void setGh_table(int gh_table) {
		this.gh_table = gh_table;
	}
	public int getMb_number() {
		return mb_number;
	}
	public void setMb_number(int mb_number) {
		this.mb_number = mb_number;
	}

}
