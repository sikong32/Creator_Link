package com.creator.link.GiftHub;

import java.util.ArrayList;

public interface GiftHub_Service {

	ArrayList<GiftHub_Creator_DTO> creator_list();

	void gifthub_insert(String box_size, String big_category, String mid_category, String detail_category, String delivery_address, String pickup_address);

	ArrayList<GiftHub_Creator_DTO> search_creator_list(String keyword);

}
