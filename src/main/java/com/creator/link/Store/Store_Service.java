package com.creator.link.Store;

import java.util.ArrayList;

public interface Store_Service {

	ArrayList<Store_DTO> store_mainout();

	void store_insert0(String pd_name, int pd_price, String pd_category, String pd_content, String pd_pohto,
			int pd_stock, int mb_number);

	Store_DTO store_detail(int pd_number);

	int store_max_index();

	void os3_insert(int max_index, String os_1name, String os_2name, String os_3name, int os_price, String os_photo,
			int os_stock);

	void os2_insert(int max_index, String os_1name, String os_2name, int os_price, String os_photo, int os_stock);

	void os1_insert(int max_index, String os_1name, int os_price, String os_photo, int os_stock);

	ArrayList<Store_OS_DTO> store_os_detail(int pd_number);

	ArrayList<String> os_1name_search(int pd_number);

	ArrayList<String> os_2name_search(int pd_number);

	ArrayList<String> os_3name_search(int pd_number);

	int select_os_1number(int pd_number, String os_1, String os_2, String os_3);

	int select_os_2number(int pd_number, String os_1, String os_2);

	int select_os_3number(int pd_number, String os_1);

	Store_OS_DTO select_os(int os_number);

}
