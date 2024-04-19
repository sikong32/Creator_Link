package com.creator.link.Board;

public class Visit_history_DTO {
	String login_number;
	String mb_number;
	String mb_nick_name;
	public Visit_history_DTO() {
	}
	public Visit_history_DTO(String login_number, String mb_number, String mb_nick_name) {
		this.login_number = login_number;
		this.mb_number = mb_number;
		this.mb_nick_name = mb_nick_name;
	}
	public String getLogin_number() {
		return login_number;
	}
	public void setLogin_number(String login_number) {
		this.login_number = login_number;
	}
	public String getMb_number() {
		return mb_number;
	}
	public void setMb_number(String mb_number) {
		this.mb_number = mb_number;
	}
	public String getMb_nick_name() {
		return mb_nick_name;
	}
	public void setMb_nick_name(String mb_nick_name) {
		this.mb_nick_name = mb_nick_name;
	}
}
