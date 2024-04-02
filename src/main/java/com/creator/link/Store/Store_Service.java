package com.creator.link.Store;

import java.util.ArrayList;

public interface Store_Service {

	ArrayList<Store_DTO> store_mainout();

	void store_insert0(String pd_name, int pd_price, String pd_category, String pd_content, String pd_pohto,
			int pd_stock, int mb_number);

	Store_DTO store_detail(String pd_number);

	int store_max_index();

	void os3_insert(int max_index, String os_1name, String os_2name, String os_3name, int os_price, String os_photo,
			int os_stock);

	void os2_insert(int max_index, String os_1name, String os_2name, int os_price, String os_photo, int os_stock);

	void os1_insert(int max_index, String os_1name, int os_price, String os_photo, int os_stock);



}
