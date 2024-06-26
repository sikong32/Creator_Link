package com.creator.link.Board;

import java.util.ArrayList;

import com.creator.link.Paging;

public interface Board_Service {

	void board_save(String bct_writer, String bct_title, String bct_content, String bat_number, String mb_number, String bct_writer_id);

	ArrayList<Attribute_DTO> attribute_list(String mb_number);
	
	int value_of_total(String mb_number, String bat_number, String search, String value);
	
	int record_post_total(String mb_number, String mb_id);

	ArrayList<Board_DTO> board_list(String mb_number, Paging paging, String bat_number, String search, String value);
	
	Board_DTO board_view(String bct_content_number);
	
	void board_view_cntup(String bct_content_number);
	
	void board_delete(String bct_content_number);
	
	void board_modify(String bct_title, String bct_content, String attribute, String bct_content_number);
	
	void comment_save(String cm_content, String bct_content_number, String mb_id, String cm_inheritance, String mb_nick_name, String cm_indent, String mb_number);
	
	ArrayList<Comment_DTO> comment_list(String bct_content_number);
	
	void comment_delete(String cm_number);
	
	ArrayList<Comment_number> comment_number();
	
	void board_comment_delete(String bct_content_number);
	
	void board_list_add(String mb_number);
	
	void board_list_del(String bat_number);
	
	void board_list_modi(String bat_cls, String bat_number);
	
	void board_set_noties(String noties, String bct_content_number);
	
	ArrayList<Board_DTO> board_noties_list(String mb_number);
	
	ArrayList<Integer> board_liked_list(String bct_content_number);
	
	void post_like_add(String mb_number, String bct_content_number);
	
	void post_like_del(String mb_number, String bct_content_number);
	
	void board_like_up(String bct_content_number);
	
	void board_like_down(String bct_content_number);
	
	ArrayList<Visit_history_DTO> visit_history_list(String mb_number);
	
	void visit_history_add(String login_number, String mb_number, String mb_nick_name);
	
	void history_delete(String mb_number, String login_number);
	
	String call_mb_nick_name(String mb_number);
	
	int write_post(String string, String mb_number);
	
	int write_comment(String string, String mb_number);
	
	ArrayList<Board_DTO> board_list_best(String mb_number, Paging paging, String bat_number, String search, String value);
	
	ArrayList<Board_DTO> record_list_post(String mb_number, String mb_id, Paging paging);

	int record_commnet_total(String mb_number, String mb_id);

	ArrayList<Comment_DTO> record_list_commnet(String mb_number, String mb_id, Paging paging);

	ArrayList<Board_DTO> board_list_all(String mb_number);
}
