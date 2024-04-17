package com.creator.link.Board;

import java.io.IOException;
import java.time.LocalDateTime;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.creator.link.Paging;
import com.creator.link.Member.Member_DTO;

@Controller
public class Board_Controller {
	@Autowired
	SqlSession sqlSession;
	
	@RequestMapping(value = "board_main")
	public String board_main(HttpServletRequest request, Model mo) {
		String now_page = request.getParameter("now_page");
		if (now_page == null) now_page = "1";
		String view_per_page = request.getParameter("view_per_page");
		if (view_per_page == null) view_per_page = "30";
		String mb_number = request.getParameter("mb_number");
		if (mb_number == null) mb_number = "1";
		String bat_number = request.getParameter("bat_number");
		String search = request.getParameter("search");
		String value = request.getParameter("value");
		int value_of_total = 0;
		
		Board_Service sv = sqlSession.getMapper(Board_Service.class);
		value_of_total = sv.value_of_total(mb_number, bat_number, search, value);
		Paging paging = new Paging(Integer.parseInt(now_page), Integer.parseInt(view_per_page), value_of_total);
		ArrayList<Attribute_DTO> attribute_list = sv.attribute_list(mb_number);
		ArrayList<Board_DTO> board_list = sv.board_list(mb_number, paging, bat_number, search, value);
		ArrayList<Board_DTO> noties_list = sv.board_noties_list(mb_number);
		ArrayList<Comment_number> comment_number = sv.comment_number();
		
		LocalDateTime ldt = LocalDateTime.now();
		
		mo.addAttribute("board_list", board_list);
		mo.addAttribute("attribute_list", attribute_list);
		mo.addAttribute("noties_list", noties_list);
		mo.addAttribute("page", paging);
		mo.addAttribute("bat_number", bat_number);
		mo.addAttribute("search", search);
		mo.addAttribute("value", value);
		mo.addAttribute("now_date", ldt.toLocalDate());
		mo.addAttribute("comment_number", comment_number);
		mo.addAttribute("mb_number", mb_number);
		
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
		mo.addAttribute("mb_number", mb_number);
		
		return "board_write";
	}
	@RequestMapping(value = "board_save")
	public String board_save(HttpServletRequest request, Model mo) throws IllegalStateException, IOException {
		String bct_title = request.getParameter("title");
		String bct_content = request.getParameter("content");
		String bat_number = request.getParameter("attribute");
		String mb_number = request.getParameter("mb_number");
		if (mb_number == null) mb_number = "1";
		
		HttpSession hs = request.getSession();
		Member_DTO dto = (Member_DTO)hs.getAttribute("member");
		String bct_writer = dto.getMb_nick_name();
		String bct_writer_id = dto.getMb_id();
		
		Board_Service sv = sqlSession.getMapper(Board_Service.class);
		sv.board_save(bct_writer, bct_title, bct_content, bat_number, mb_number, bct_writer_id);
		
		mo.addAttribute("mb_number", mb_number);
		
		return "redirect:board_main";
	}
	@RequestMapping(value = "board_view")
	public String board_view(HttpServletRequest request, Model mo) {
		String bct_content_number = request.getParameter("bct_content_number");
		String mb_number = request.getParameter("mb_number");
		if (mb_number == null) mb_number = "1";
		String like = "false";
		int login_number = 0;
		
		HttpSession hs = request.getSession();
		Member_DTO login = (Member_DTO)hs.getAttribute("member");
		if (login != null) {
			login_number = Integer.parseInt(login.getMb_number());
		}
		
		Board_Service sv = sqlSession.getMapper(Board_Service.class);
		sv.board_view_cntup(bct_content_number);
		Board_DTO post = sv.board_view(bct_content_number);
		ArrayList<Comment_DTO> comment = sv.comment_list(bct_content_number);
		ArrayList<Attribute_DTO> attribute_list = sv.attribute_list(mb_number);
		ArrayList<Integer> liked_list = sv.board_liked_list(bct_content_number);
		
		for (int list:liked_list) {
			if (list == login_number) like = "true";
		}
		
		mo.addAttribute("post", post);
		mo.addAttribute("comment", comment);
		mo.addAttribute("attribute_list", attribute_list);
		mo.addAttribute("like", like);
		mo.addAttribute("mb_number", mb_number);
		
		return "board_view";
	}
	@RequestMapping(value = "board_delete")
	public String board_delete(HttpServletRequest request, Model mo) {
		String bct_content_number = request.getParameter("bct_content_number");
		String mb_number = request.getParameter("mb_number");
		
		System.out.println(mb_number);
		
		Board_Service sv = sqlSession.getMapper(Board_Service.class);
		sv.board_delete(bct_content_number);
		sv.board_comment_delete(bct_content_number);
		
		mo.addAttribute("mb_number", mb_number);
		
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
		String bct_content_number = request.getParameter("bct_content_number");
		String bct_title = request.getParameter("title");
		String bct_content = request.getParameter("content");
		String attribute = request.getParameter("attribute");
		
		Board_Service sv = sqlSession.getMapper(Board_Service.class);
		sv.board_modify(bct_title, bct_content, attribute, bct_content_number);
		
		return "redirect:board_main";
	}
	@ResponseBody
	@RequestMapping(value = "comment_save")
	public String comment_save(HttpServletRequest request, Model mo) {
		String cm_content = request.getParameter("cm_content");
		String bct_content_number = request.getParameter("bct_content_number");
		String cm_inheritance = request.getParameter("cm_inheritance");
		String cm_indent = request.getParameter("cm_indent");
		if (cm_inheritance == null) cm_inheritance = "0";
		if (cm_indent == null) cm_indent = "0";
		
		HttpSession hs = request.getSession();
		Member_DTO member = (Member_DTO)hs.getAttribute("member");
		String mb_id = member.getMb_id();
		String mb_nick_name = member.getMb_nick_name();
		
		Board_Service sv = sqlSession.getMapper(Board_Service.class);
		sv.comment_save(cm_content, bct_content_number, mb_id, cm_inheritance, mb_nick_name, cm_indent);
		
		return "등록완료";
	}
	@ResponseBody
	@RequestMapping(value = "comment_delete")
	public String comment_delete(HttpServletRequest request, Model mo) {
		String cm_number = request.getParameter("cm_number");
		
		Board_Service sv = sqlSession.getMapper(Board_Service.class);
		sv.comment_delete(cm_number);
		
		return "삭제완료";
	}
	@ResponseBody
	@RequestMapping(value = "board_list_add")
	public String board_list_add(HttpServletRequest request) {
		String mb_number = request.getParameter("mb_number");
		if (mb_number == null) mb_number = "1";
		
		Board_Service sv = sqlSession.getMapper(Board_Service.class);
		sv.board_list_add(mb_number);
		
		return "분류 추가완료";
	}
	@ResponseBody
	@RequestMapping(value = "board_list_del")
	public String board_list_del(HttpServletRequest request) {
		String bat_number = request.getParameter("bat_number");
		
		Board_Service sv = sqlSession.getMapper(Board_Service.class);
		sv.board_list_del(bat_number);
		
		return "분류 삭제완료";
	}
	@ResponseBody
	@RequestMapping(value = "board_list_modi")
	public String board_list_modi(HttpServletRequest request) {
		String bat_number = request.getParameter("bat_number");
		String bat_cls = request.getParameter("bat_cls");
		
		Board_Service sv = sqlSession.getMapper(Board_Service.class);
		sv.board_list_modi(bat_cls, bat_number);
		
		return "분류 수정완료";
	}
	@ResponseBody
	@RequestMapping(value = "board_list_delete")
	public String board_del_test(HttpServletRequest request) {
		String [] bct_content_number = request.getParameterValues("bct_content_number");
		
		Board_Service sv = sqlSession.getMapper(Board_Service.class);
		
		for (String number:bct_content_number) {
			sv.board_delete(number);
			sv.board_comment_delete(number);
		}
		
		return "분류 수정완료";
	}
	@ResponseBody
	@RequestMapping(value = "board_set_noties")
	public String board_set_noties(HttpServletRequest request) {
		String bct_content_number = request.getParameter("bct_content_number");
		String noties = request.getParameter("noties");
		
		Board_Service sv = sqlSession.getMapper(Board_Service.class);
		sv.board_set_noties(noties, bct_content_number);
		
		return "공지 설정완료";
	}
	@ResponseBody
	@RequestMapping(value = "post_like")
	public String post_like_add(HttpServletRequest request) {
		HttpSession hs = request.getSession();
		Member_DTO login = (Member_DTO)hs.getAttribute("member");
		String bct_content_number = request.getParameter("bct_content_number");
		String mb_number = login.getMb_number();
		String like = request.getParameter("like");
		
		Board_Service sv = sqlSession.getMapper(Board_Service.class);
		if (like.equals("false")) {
			sv.post_like_add(mb_number, bct_content_number);
			sv.board_like_up(bct_content_number);
		}
		if (like.equals("true")) {
			sv.post_like_del(mb_number, bct_content_number);
			sv.board_like_down(bct_content_number);
		}
		
		return "좋아요 완료";
	}
}