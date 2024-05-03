package com.creator.link.GiftHub;

import java.util.ArrayList;

import com.creator.link.Member.Member_DTO;

public interface GiftHub_Service {
	
	ArrayList<Member_DTO> basic_creator_list();

	ArrayList<GiftHub_Creator_DTO> search_creator_list(String keyword);
	
	String getid(int mb_number);

	void gifthub_insert(String box_size, String big_category, String mid_category, String detail_category, String creator_nick_name,
			String delivery_post, String delivery_road, String delivery_local, String delivery_detail, String fan_id,
			String pickup_post, String pickup_road, String pickup_local, String pickup_detail, int gift_price, int mb_number);

}
