package com.creator.link.Store;

import java.util.ArrayList;

public interface Store_Service {

	ArrayList<Store_DTO> store_mainout();

	void store_insert0(String pd_name, int pd_price, String pd_category, String pd_content, String pd_pohto,
			int pd_stock, int mb_number);

	Store_DTO store_detail(String pd_number);

	void os1_insert(String os_name, String os_price, String os_photo, String os_stock, int max_index);

	int store_max_index();


}
