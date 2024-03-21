package com.creator.link.Member;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class Member_Controller {
	@Autowired
	SqlSession sqlSession;
	
	@RequestMapping(value = "sample_member")
	public String sample_member() {
		return "sample_member";
	}
}
