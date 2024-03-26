package com.creator.link.Board;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.creator.link.Paging;
import com.creator.link.Member.Member_DTO;

@Controller
public class Board_Controller {
	@Autowired
	SqlSession sqlSession;
	String path = "C:\\이젠디지탈12\\spring\\Creator_Link\\src\\main\\webapp\\resources\\board\\";
	
	@RequestMapping(value = "board_main")
	public String board_main(HttpServletRequest request, Model mo) {
		String now_page = request.getParameter("now_page");
		if (now_page == null) now_page = "1";
		String view_per_page = request.getParameter("view_per_page");
		if (view_per_page == null) view_per_page = "5";
		String mb_number = request.getParameter("mb_number");
		if (mb_number == null) mb_number = "1";
		String bat_number = request.getParameter("bat_number");
		String search = request.getParameter("search");
		String value = request.getParameter("value");
		int value_of_total = 0;
		
		ArrayList<Attribute_DTO> attribute_list = new ArrayList<Attribute_DTO>();
		Board_Service sv = sqlSession.getMapper(Board_Service.class);
		attribute_list = sv.attribute_list(mb_number);
		value_of_total = sv.value_of_total(mb_number, bat_number, search, value);
		
		Paging paging = new Paging(Integer.parseInt(now_page), Integer.parseInt(view_per_page), value_of_total);
		
		mo.addAttribute("board_list", sv.board_list(mb_number, paging, bat_number, search, value));
		mo.addAttribute("attribute_list", attribute_list);
		mo.addAttribute("page", paging);
		mo.addAttribute("bat_number", bat_number);
		mo.addAttribute("search", search);
		mo.addAttribute("value", value);
		
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
	public String board_save(HttpServletRequest request) throws IllegalStateException, IOException {
		String bct_title = request.getParameter("title");
		String bct_content = request.getParameter("content");
		String bat_number = request.getParameter("attribute");
		String mb_number = "1";
		
		HttpSession hs = request.getSession();
		Member_DTO dto = (Member_DTO)hs.getAttribute("member");
		String bct_writer = dto.getMb_id();
		
		Board_Service sv = sqlSession.getMapper(Board_Service.class);
		sv.board_save(bct_writer, bct_title, bct_content, bat_number, mb_number);
		
		return "redirect:board_main";
	}
	@RequestMapping(value = "board_view")
	public String board_view(HttpServletRequest request, Model mo) {
		String bct_content_number = request.getParameter("bct_content_number");
		
		HttpSession hs = request.getSession();
		Member_DTO member = (Member_DTO)hs.getAttribute("member");
		
		Board_Service sv = sqlSession.getMapper(Board_Service.class);
		sv.board_view_cntup(bct_content_number);
		Board_DTO post = sv.board_view(bct_content_number);
		
		mo.addAttribute("post", post);
		mo.addAttribute("member", member);
		
		return "board_view";
	}
	@RequestMapping(value = "board_delete")
	public String board_delete(HttpServletRequest request) {
		String bct_content_number = request.getParameter("bct_content_number");
		
		Board_Service sv = sqlSession.getMapper(Board_Service.class);
		sv.board_delete(bct_content_number);
		
		return "redirect:board_main";
	}
	@RequestMapping(value = "board_modify")
	public String board_modify(HttpServletRequest request, Model mo) {
		String bct_content_number = request.getParameter("bct_content_number");
		
		Board_Service sv = sqlSession.getMapper(Board_Service.class);
		Board_DTO post = sv.board_view(bct_content_number);
		ArrayList<Attribute_DTO> attribute_list = sv.attribute_list(String.valueOf(post.mb_number));
		
		mo.addAttribute("post", post);
		mo.addAttribute("attribute_list", attribute_list);
		
		return "board_modify";
	}
	@RequestMapping(value = "board_modify_do")
	public String board_modify_do(HttpServletRequest request, Model mo) {
		
		Board_Service sv = sqlSession.getMapper(Board_Service.class);
		
		return "redirect:board_main";
	}
}