package com.creator.link.GiftHub;

import java.util.ArrayList;

public interface GiftHub_Service {

	ArrayList<GiftHub_Creator_DTO> creator_list();

	ArrayList<GiftHub_Creator_DTO> search_creator_list(String keyword);
	
	String getid(int mb_number);

	void gifthub_insert(String string, String string2, String string3, String string4, String creator_nick_name,
			String delivery_post, String delivery_road, String delivery_local, String delivery_detail, String fan_id,
			String pickup_post, String pickup_road, String pickup_local, String pickup_detail, int mb_number);


}
