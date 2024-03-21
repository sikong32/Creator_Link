package com.creator.link;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class Home_Controller {
	@Autowired
	SqlSession sqlSession;
	
	@RequestMapping(value = "/index")
	public String index(Model mo) {
		return "main";
	}
	@RequestMapping(value = "/search")
	public String search(Model mo) {
		return "search";
	}
}
