package com.creator.link.Board;

import java.util.ArrayList;

public interface Board_Service {

	void board_save(String bct_writer, String bct_title, String bct_content, String bat_number, String mb_number);

	ArrayList<Board_DTO> board_list(String sql_mb_number);

	ArrayList<Board_DTO> board_atlist(String sql_mb_number, String bat_number);

	ArrayList<Attribute_DTO> attribute_list(String sql_mb_number);
	
	Board_DTO board_view(String bct_content_number);
	
	void board_view_cntup(String bct_content_number);

	int board_list_total();

}
