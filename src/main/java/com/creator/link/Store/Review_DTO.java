package com.creator.link.Store;

public class Review_DTO {
	int review_number;
	int pd_number;
	String re_content;
	String re_day;
	String re_star;
	int mb_number;
	public Review_DTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Review_DTO(int review_number, int pd_number, String re_content, String re_day, String re_star,
			int mb_number) {
		super();
		this.review_number = review_number;
		this.pd_number = pd_number;
		this.re_content = re_content;
		this.re_day = re_day;
		this.re_star = re_star;
		this.mb_number = mb_number;
	}
	public int getReview_number() {
		return review_number;
	}
	public void setReview_number(int review_number) {
		this.review_number = review_number;
	}
	public int getPd_number() {
		return pd_number;
	}
	public void setPd_number(int pd_number) {
		this.pd_number = pd_number;
	}
	public String getRe_content() {
		return re_content;
	}
	public void setRe_content(String re_content) {
		this.re_content = re_content;
	}
	public String getRe_day() {
		return re_day;
	}
	public void setRe_day(String re_day) {
		this.re_day = re_day;
	}
	public String getRe_star() {
		return re_star;
	}
	public void setRe_star(String re_star) {
		this.re_star = re_star;
	}
	public int getMb_number() {
		return mb_number;
	}
	public void setMb_number(int mb_number) {
		this.mb_number = mb_number;
	}
	
}
