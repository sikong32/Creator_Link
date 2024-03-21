package com.creator.link.Board;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class Board_Controller {
	@Autowired
	SqlSession sqlSession;
	
	@RequestMapping(value = "sample")
	public String sample() {
		return "sample";
	}
}
