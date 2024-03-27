package com.creator.link.Store;

import java.util.ArrayList;

public interface Store_Service {

	ArrayList<Store_DTO> store_mainout();

	void store_insert0(String pd_name, int pd_price, String pd_category, String pd_content, String pd_pohto,
			int pd_stock, String member_number);


	Store_DTO store_detail(String pd_number);

	void store_insert1(String pd_name, int pd_price, String pd_category, String pd_content, String pd_pohto,
			int pd_stock, String os_1name, int os_1price, String os_1pohto, int os_1stock);

}
