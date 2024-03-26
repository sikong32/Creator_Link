package com.creator.link.Board;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@Controller
public class Board_Controller {
	@Autowired
	SqlSession sqlSession;
	String path = "C:\\이젠디지탈12\\spring\\Creator_Link\\src\\main\\webapp\\resources\\board\\";
	
	@RequestMapping(value = "board_main")
	public String board_main(HttpServletRequest request, Model mo) {
		String now_page = request.getParameter("now_page");
		String view_per_page = request.getParameter("view_per_page");
		int value_of_total = 0;
		
		String mb_number = request.getParameter("mb_number");
		String bat_number = request.getParameter("bat_number");
		ArrayList<Board_DTO> board_list = new ArrayList<Board_DTO>();
		ArrayList<Attribute_DTO> attribute_list = new ArrayList<Attribute_DTO>();
		if (mb_number == null) mb_number = "1";
		String sql_mb_number = mb_number;
		
		Board_Service sv = sqlSession.getMapper(Board_Service.class);
		attribute_list = sv.attribute_list(sql_mb_number);
		if (bat_number == null) {
			board_list = sv.board_list(sql_mb_number);
		}
		else {
			board_list = sv.board_atlist(sql_mb_number, bat_number);
		}
		
		mo.addAttribute("board_list", board_list);
		mo.addAttribute("attribute_list", attribute_list);
		
		return "board_main";
	}
	@RequestMapping(value = "board_creator")
	public String board_creator() {
		return "board_creator";
	}
	@RequestMapping(value = "board_write")
	public String board_write(HttpServletRequest request, Model mo) {
		String mb_number = request.getParameter("mb_number");
		ArrayList<Attribute_DTO> attribute_list = new ArrayList<Attribute_DTO>();
		
		Board_Service sv = sqlSession.getMapper(Board_Service.class);
		if (mb_number == null) {
			mb_number = "1";
			attribute_list = sv.attribute_list(mb_number);
		}
		else {
			attribute_list = sv.attribute_list(mb_number);
		}
		
		mo.addAttribute("attribute_list", attribute_list);
		
		return "board_write";
	}
	@RequestMapping(value = "board_save")
	public String board_save(MultipartHttpServletRequest request) throws IllegalStateException, IOException {
		// 로그인되면 httpsession에 user DTO를 저장해서 작성자 꺼내오기
		String bct_writer = "사용자01";
		String bct_title = request.getParameter("title");
		String bct_content = request.getParameter("content");
		String bat_number = request.getParameter("attribute");
		String mb_number = "1";
		
		Board_Service sv = sqlSession.getMapper(Board_Service.class);
		sv.board_save(bct_writer, bct_title, bct_content, bat_number, mb_number);
		
		return "redirect:board_main";
	}
	@RequestMapping(value = "board_view")
	public String board_view(HttpServletRequest request, Model mo) {
		String bct_content_number = request.getParameter("bct_content_number");
		
		Board_Service sv = sqlSession.getMapper(Board_Service.class);
		sv.board_view_cntup(bct_content_number);
		Board_DTO post = sv.board_view(bct_content_number);
		
		mo.addAttribute("post", post);
		
		return "board_view";
	}
}