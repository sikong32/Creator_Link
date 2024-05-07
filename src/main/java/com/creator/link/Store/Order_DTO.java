package com.creator.link.Store;

public class Order_DTO {
	int od_number;
	String od_id;
	String od_date;
	String od_pd_name;
	int od_pd_qnt;
	int od_price;
	String od_cp_code;
	int mb_number;
	int os_number;
	int zip_code;
	String dlvy_address;
	String dlvy_address_dong;
	String dlvy_detail;
	String dlvy_comment;
	String os_name;
	String image;
	int od_pd_number;
	String od_invoice;
	String od_cancel_text;
	
	public Order_DTO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Order_DTO(int od_number, String od_id, String od_date, String od_pd_name, int od_pd_qnt, int od_price,
			String od_cp_code, int mb_number, int os_number, int zip_code, String dlvy_address,
			String dlvy_address_dong, String dlvy_detail, String dlvy_comment, String os_name, String image,
			int od_pd_number, String od_invoice, String od_cancel_text) {
		super();
		this.od_number = od_number;
		this.od_id = od_id;
		this.od_date = od_date;
		this.od_pd_name = od_pd_name;
		this.od_pd_qnt = od_pd_qnt;
		this.od_price = od_price;
		this.od_cp_code = od_cp_code;
		this.mb_number = mb_number;
		this.os_number = os_number;
		this.zip_code = zip_code;
		this.dlvy_address = dlvy_address;
		this.dlvy_address_dong = dlvy_address_dong;
		this.dlvy_detail = dlvy_detail;
		this.dlvy_comment = dlvy_comment;
		this.os_name = os_name;
		this.image = image;
		this.od_pd_number = od_pd_number;
		this.od_invoice = od_invoice;
		this.od_cancel_text = od_cancel_text;
	}

	public int getOd_number() {
		return od_number;
	}

	public void setOd_number(int od_number) {
		this.od_number = od_number;
	}

	public String getOd_id() {
		return od_id;
	}

	public void setOd_id(String od_id) {
		this.od_id = od_id;
	}

	public String getOd_date() {
		return od_date;
	}

	public void setOd_date(String od_date) {
		this.od_date = od_date;
	}

	public String getOd_pd_name() {
		return od_pd_name;
	}

	public void setOd_pd_name(String od_pd_name) {
		this.od_pd_name = od_pd_name;
	}

	public int getOd_pd_qnt() {
		return od_pd_qnt;
	}

	public void setOd_pd_qnt(int od_pd_qnt) {
		this.od_pd_qnt = od_pd_qnt;
	}

	public int getOd_price() {
		return od_price;
	}

	public void setOd_price(int od_price) {
		this.od_price = od_price;
	}

	public String getOd_cp_code() {
		return od_cp_code;
	}

	public void setOd_cp_code(String od_cp_code) {
		this.od_cp_code = od_cp_code;
	}

	public int getMb_number() {
		return mb_number;
	}

	public void setMb_number(int mb_number) {
		this.mb_number = mb_number;
	}

	public int getOs_number() {
		return os_number;
	}

	public void setOs_number(int os_number) {
		this.os_number = os_number;
	}

	public int getZip_code() {
		return zip_code;
	}

	public void setZip_code(int zip_code) {
		this.zip_code = zip_code;
	}

	public String getDlvy_address() {
		return dlvy_address;
	}

	public void setDlvy_address(String dlvy_address) {
		this.dlvy_address = dlvy_address;
	}

	public String getDlvy_address_dong() {
		return dlvy_address_dong;
	}

	public void setDlvy_address_dong(String dlvy_address_dong) {
		this.dlvy_address_dong = dlvy_address_dong;
	}

	public String getDlvy_detail() {
		return dlvy_detail;
	}

	public void setDlvy_detail(String dlvy_detail) {
		this.dlvy_detail = dlvy_detail;
	}

	public String getDlvy_comment() {
		return dlvy_comment;
	}

	public void setDlvy_comment(String dlvy_comment) {
		this.dlvy_comment = dlvy_comment;
	}

	public String getOs_name() {
		return os_name;
	}

	public void setOs_name(String os_name) {
		this.os_name = os_name;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public int getOd_pd_number() {
		return od_pd_number;
	}

	public void setOd_pd_number(int od_pd_number) {
		this.od_pd_number = od_pd_number;
	}

	public String getOd_invoice() {
		return od_invoice;
	}

	public void setOd_invoice(String od_invoice) {
		this.od_invoice = od_invoice;
	}

	public String getOd_cancel_text() {
		return od_cancel_text;
	}

	public void setOd_cancel_text(String od_cancel_text) {
		this.od_cancel_text = od_cancel_text;
	}
	
	
}
