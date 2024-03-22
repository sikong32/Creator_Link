package com.creator.link.Board;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class Board_Controller {
	@Autowired
	SqlSession sqlSession;
	
	@RequestMapping(value = "board_main")
	public String board_main() {
		return "board_main";
	}
	@RequestMapping(value = "board_creator")
	public String board_creator() {
		return "board_creator";
	}
	@RequestMapping(value = "gifthub")
	public String gifthub() {
		return "gifthub";
	}
}