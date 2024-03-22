package com.creator.link.Store;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

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
}
