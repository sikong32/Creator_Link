package com.creator.link.Store;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@Controller
public class Store_Controller {
	@Autowired
	SqlSession sqlSession;
	
	@RequestMapping(value = "store_main")
	public String store_main(Model model) {
		Store_Service ss = sqlSession.getMapper(Store_Service.class);
		ArrayList<Store_DTO> list = ss.store_mainout();
		model.addAttribute("list",list);
		return "store_main";
	}
	@RequestMapping(value = "shopping_cart")
	public String shopping_cart() {
		return "shopping_cart";
	}
	@RequestMapping(value = "store_detail")
	public String store_detail() {
		return "store_detail";
	}
	@RequestMapping(value = "shoping_buy")
	public String shoping_buy() {
		return "shoping_buy";
	}
	@RequestMapping(value = "shoping_buy_fix")
	public String shoping_buy_fix() {
		return "shoping_buy_fix";
	}
	@RequestMapping(value = "gifthub")
	public String gifthub() {
		return "gifthub";
	}
	@RequestMapping(value = "editor", method = RequestMethod.POST)
	public String editor(HttpServletRequest request,Model model) {
		String editor = request.getParameter("editor");
		System.out.println("에디터에서 받은 값"+editor);
		System.out.println("안되나...  내 5시간...");
		model.addAttribute("editor",editor);
		return "editorout";
	}
}
