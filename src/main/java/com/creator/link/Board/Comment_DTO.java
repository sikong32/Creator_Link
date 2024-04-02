package com.creator.link.Board;

public class Comment_DTO {
	int cm_number;
	String cm_content;
	String cm_write_date;
	int bct_content_number;
	String mb_id;
	int cm_inheritance;
	String mb_nick_name;
	int cm_indent;
	public Comment_DTO() {
	}
	public Comment_DTO(int cm_number, String cm_content, String cm_write_date, int bct_content_number, String mb_id, int cm_inheritance, String mb_nick_name, int cm_indent) {
		this.cm_number = cm_number;
		this.cm_content = cm_content;
		this.cm_write_date = cm_write_date;
		this.bct_content_number = bct_content_number;
		this.mb_id = mb_id;
		this.cm_inheritance = cm_inheritance;
		this.mb_nick_name = mb_nick_name;
		this.cm_indent = cm_indent;
	}
	public int getCm_number() {
		return cm_number;
	}
	public void setCm_number(int cm_number) {
		this.cm_number = cm_number;
	}
	public String getCm_content() {
		return cm_content;
	}
	public void setCm_content(String cm_content) {
		this.cm_content = cm_content;
	}
	public String getCm_write_date() {
		return cm_write_date;
	}
	public void setCm_write_date(String cm_write_date) {
		this.cm_write_date = cm_write_date;
	}
	public int getBct_content_number() {
		return bct_content_number;
	}
	public void setBct_content_number(int bct_content_number) {
		this.bct_content_number = bct_content_number;
	}
	public int getCm_inheritance() {
		return cm_inheritance;
	}
	public void setCm_inheritance(int cm_inheritance) {
		this.cm_inheritance = cm_inheritance;
	}
	public String getMb_nick_name() {
		return mb_nick_name;
	}
	public void setMb_nick_name(String mb_nick_name) {
		this.mb_nick_name = mb_nick_name;
	}
	public int getCm_indent() {
		return cm_indent;
	}
	public void setCm_indent(int cm_indent) {
		this.cm_indent = cm_indent;
	}
	public String getMb_id() {
		return mb_id;
	}
	public void setMb_id(String mb_id) {
		this.mb_id = mb_id;
	}
}
