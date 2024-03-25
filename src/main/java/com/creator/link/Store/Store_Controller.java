package com.creator.link.Store;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class Store_Controller {
	@Autowired
	SqlSession sqlSession;
	
	@RequestMapping(value = "store_main")
	public String store_main() {
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
}
