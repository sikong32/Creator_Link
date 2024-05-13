package com.creator.link;

import java.util.ArrayList;

import com.creator.link.Member.Member_DTO;

public interface Home_Service {

	ArrayList<Search_DTO> search_item(String value);

	ArrayList<Member_DTO> search_creator(String value);

	ArrayList<String> search_seller(String value);

	ArrayList<BC_DTO> bc_select();

}
