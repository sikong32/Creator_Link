package com.creator.link.Board;

public class Board_DTO {
	int bct_content_number;
	String bct_writer;
	String bct_title;
	String bct_content;
	String bct_write_date;
	int bct_view_cnt;
	int bct_like_cnt;
	int bat_number;
	int mb_number;
	String bct_writer_id;
	public Board_DTO() {
	}
	public Board_DTO(int bct_content_number, String bct_writer, String bct_title, String bct_content, String bct_write_date, int bct_view_cnt, int bct_like_cnt, int bat_number, int mb_number, String bct_writer_id) {
		this.bct_content_number = bct_content_number;
		this.bct_writer = bct_writer;
		this.bct_title = bct_title;
		this.bct_content = bct_content;
		this.bct_write_date = bct_write_date;
		this.bct_view_cnt = bct_view_cnt;
		this.bct_like_cnt = bct_like_cnt;
		this.bat_number = bat_number;
		this.mb_number = mb_number;
		this.bct_writer_id = bct_writer_id;
	}
	public int getBct_content_number() {
		return bct_content_number;
	}
	public void setBct_content_number(int bct_content_number) {
		this.bct_content_number = bct_content_number;
	}
	public String getBct_writer() {
		return bct_writer;
	}
	public void setBct_writer(String bct_writer) {
		this.bct_writer = bct_writer;
	}
	public String getBct_title() {
		return bct_title;
	}
	public void setBct_title(String bct_title) {
		this.bct_title = bct_title;
	}
	public String getBct_content() {
		return bct_content;
	}
	public void setBct_content(String bct_content) {
		this.bct_content = bct_content;
	}
	public String getBct_write_date() {
		return bct_write_date;
	}
	public void setBct_write_date(String bct_write_date) {
		this.bct_write_date = bct_write_date;
	}
	public int getBct_view_cnt() {
		return bct_view_cnt;
	}
	public void setBct_view_cnt(int bct_view_cnt) {
		this.bct_view_cnt = bct_view_cnt;
	}
	public int getBct_like_cnt() {
		return bct_like_cnt;
	}
	public void setBct_like_cnt(int bct_like_cnt) {
		this.bct_like_cnt = bct_like_cnt;
	}
	public int getBat_number() {
		return bat_number;
	}
	public void setBat_number(int bat_number) {
		this.bat_number = bat_number;
	}
	public int getMb_number() {
		return mb_number;
	}
	public void setMb_number(int mb_number) {
		this.mb_number = mb_number;
	}
	public String getBct_writer_id() {
		return bct_writer_id;
	}
	public void setBct_writer_id(String bct_writer_id) {
		this.bct_writer_id = bct_writer_id;
	}
}
