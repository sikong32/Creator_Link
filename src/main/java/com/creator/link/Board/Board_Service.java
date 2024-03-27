package com.creator.link.Board;

import java.util.ArrayList;

import com.creator.link.Paging;

public interface Board_Service {

	void board_save(String bct_writer, String bct_title, String bct_content, String bat_number, String mb_number);

	ArrayList<Attribute_DTO> attribute_list(String mb_number);
	
	int value_of_total(String mb_number, String bat_number, String search, String value);
	
	ArrayList<Board_DTO> board_list(String mb_number, Paging paging, String bat_number, String search, String value);
	
	Board_DTO board_view(String bct_content_number);
	
	void board_view_cntup(String bct_content_number);

	void board_delete(String bct_content_number);

	void board_modify(String bct_title, String bct_content, String bct_content_number);

}
