package com.creator.link.Member;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class Member_Controller {
	@Autowired
	SqlSession sqlSession;
	
	@RequestMapping(value = "regist")
	public String regist() {
		return "regist";
	}
	@RequestMapping(value = "regist_do")
	public String regist_do() {
		return "redirect:index";
	}
	@RequestMapping(value = "login")
	public String login() {
		return "login";
	}
	@RequestMapping(value = "login_do")
	public String login_do() {
		return "redirect:index";
	}
	@RequestMapping(value = "mypage")
	public String mypage() {
		return "mypage";
	}
}
