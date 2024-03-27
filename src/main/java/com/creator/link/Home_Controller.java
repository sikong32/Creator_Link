package com.creator.link;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.creator.link.Member.Member_DTO;
import com.creator.link.Store.Store_DTO;

@Controller
public class Home_Controller {
	@Autowired
	SqlSession sqlSession;
	
	@RequestMapping(value = "/")
	public String main(Model mo) {
		return "main";
	}
	
	@RequestMapping(value = "/index")
	public String index(Model mo) {
		return "main";
	}
	
	@RequestMapping(value = "/search")
	public String search(HttpServletRequest request, Model mo) {
		String value = request.getParameter("value");
		
		Home_Service sv = sqlSession.getMapper(Home_Service.class);
		ArrayList<Member_DTO> creator = sv.search_creator(value);
		ArrayList<Store_DTO> item = sv.search_item(value);
		
		mo.addAttribute("creator", creator);
		mo.addAttribute("item", item);
		
		return "search";
	}
	@RequestMapping(value = "/test")
	public String NewFile(Model mo) {
		return "test";
	}
}
