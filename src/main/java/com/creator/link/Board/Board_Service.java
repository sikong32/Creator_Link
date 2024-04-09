package com.creator.link.Board;

import java.util.ArrayList;

import com.creator.link.Paging;

public interface Board_Service {

	void board_save(String bct_writer, String bct_title, String bct_content, String bat_number, String mb_number, String bct_writer_id);

	ArrayList<Attribute_DTO> attribute_list(String mb_number);
	
	int value_of_total(String mb_number, String bat_number, String search, String value);
	
	ArrayList<Board_DTO> board_list(String mb_number, Paging paging, String bat_number, String search, String value);
	
	Board_DTO board_view(String bct_content_number);
	
	void board_view_cntup(String bct_content_number);

	void board_delete(String bct_content_number);

	void board_modify(String bct_title, String bct_content, String attribute, String bct_content_number);

	void comment_save(String cm_content, String bct_content_number, String mb_id, String cm_inheritance, String mb_nick_name, String cm_indent);

	ArrayList<Comment_DTO> comment_list(String bct_content_number);

	void comment_delete(String cm_number);

	ArrayList<Comment_number> comment_number();

	void board_comment_delete(String bct_content_number);

}
