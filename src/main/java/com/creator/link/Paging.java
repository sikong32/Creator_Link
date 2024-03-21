package com.creator.link;

public class Paging {
	int start_page;
	int end_page;
	int last_page;
	int now_page;
	int start_value;
	int end_value;
	int view_per_page;
	int number_of_page = 5;
	int value_of_total;
	public Paging() {
	}
	public Paging(int now_page, int view_per_page, int value_of_total) {
		setNow_page(now_page);
		setView_per_page(view_per_page);
		setValue_of_total(value_of_total);
		calcLastPage(getValue_of_total(), getView_per_page());
		calcStartEndPage(getNow_page(), getNumber_of_page());
		calcStartEndValue(getNow_page(), getView_per_page());
	}
	public void calcLastPage(int value_of_total, int view_per_page) {
		setLast_page((int)Math.ceil((double)value_of_total / view_per_page));
	}
	public void calcStartEndPage(int now_Page, int number_of_page) {
		if (getLast_page() <= number_of_page) {
			setStart_page(1);
			setEnd_page(getLast_page());
		}
		else {
			setStart_page(now_page - (int)(((double)number_of_page-1)/2));
			setEnd_page(now_page + (int)Math.ceil(((double)number_of_page-1)/2));
			if (getStart_page() < 1) {
				setEnd_page(getEnd_page() + (getStart_page()*-1) + 1);
				setStart_page(1);
			}
			if (getEnd_page() > getLast_page()) {
				setStart_page(getStart_page() - (getEnd_page() - getLast_page()));
				setEnd_page(getLast_page());
			}
		}
	}
	public void calcStartEndValue(int now_page, int view_per_page) {
		setEnd_value(now_page * view_per_page);
		setStart_value(getEnd_value() - view_per_page + 1);
	}
	public int getStart_page() {
		return start_page;
	}
	public void setStart_page(int start_page) {
		this.start_page = start_page;
	}
	public int getEnd_page() {
		return end_page;
	}
	public void setEnd_page(int end_page) {
		this.end_page = end_page;
	}
	public int getLast_page() {
		return last_page;
	}
	public void setLast_page(int last_page) {
		this.last_page = last_page;
	}
	public int getNow_page() {
		return now_page;
	}
	public void setNow_page(int now_page) {
		this.now_page = now_page;
	}
	public int getStart_value() {
		return start_value;
	}
	public void setStart_value(int start_value) {
		this.start_value = start_value;
	}
	public int getEnd_value() {
		return end_value;
	}
	public void setEnd_value(int end_value) {
		this.end_value = end_value;
	}
	public int getView_per_page() {
		return view_per_page;
	}
	public void setView_per_page(int view_per_page) {
		this.view_per_page = view_per_page;
	}
	public int getNumber_of_page() {
		return number_of_page;
	}
	public void setNumber_of_page(int number_of_page) {
		this.number_of_page = number_of_page;
	}
	public int getValue_of_total() {
		return value_of_total;
	}
	public void setValue_of_total(int value_of_total) {
		this.value_of_total = value_of_total;
	}
}
