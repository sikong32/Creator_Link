package com.creator.link.Board;

public class Comment_number {
	String bct_content_number;
	int comment_number;
	public Comment_number() {
	}
	public Comment_number(String bct_content_number, int comment_number) {
		this.bct_content_number = bct_content_number;
		this.comment_number = comment_number;
	}
	public String getBct_content_number() {
		return bct_content_number;
	}
	public void setBct_content_number(String bct_content_number) {
		this.bct_content_number = bct_content_number;
	}
	public int getComment_number() {
		return comment_number;
	}
	public void setComment_number(int comment_number) {
		this.comment_number = comment_number;
	}
}
