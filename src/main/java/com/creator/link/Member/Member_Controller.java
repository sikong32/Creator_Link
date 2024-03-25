package com.creator.link.Member;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.http.HttpRequest;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@Controller
public class Member_Controller {
	@Autowired
	SqlSession sqlSession;
	String basic_path = "C:\\이젠디지털12\\CreaterLink\\CreaterLinkProject\\src\\main\\webapp\\resources\\member\\basic_photo";
	String profile_path = "C:\\이젠디지털12\\CreaterLink\\CreaterLinkProject\\src\\main\\webapp\\resources\\member\\member_profile";
	
	@RequestMapping(value = "regist")
	public String regist() {
		return "regist";
	}
	
	
	
	@RequestMapping(value = "regist_do")
	public String regist_do(HttpServletRequest request) throws IOException {
		Member_Service mService = sqlSession.getMapper(Member_Service.class);
		String rgPhoto = "";
		String rgId = request.getParameter("id");
		String rgPw = request.getParameter("pw");
		String rgPwVr = request.getParameter("pw_verify");
		String rgName = request.getParameter("name");
		String rgBirthDate = request.getParameter("birthDate");

		String rgPhone = request.getParameter("phone1") + request.getParameter("phone2") + request.getParameter("phone3");

		
		mService.regist(rgId,rgPw,rgName,rgBirthDate,rgPhone);
		
		return "redirect:index";
	}
	
	
	
	private String filesave(String rgPhoto2, byte[] bs) throws IOException {
		UUID uid = UUID.randomUUID();
		String randomName = uid.toString()+"_"+rgPhoto2;
		File savePhoto = new File(profile_path+"\\"+randomName);
		FileCopyUtils.copy(bs, savePhoto);
		
		return randomName;
	}

	@RequestMapping(value = "loginForm")
	public String login() {
		return "loginForm";
	}
	
	@RequestMapping(value = "login_do")
	public String login_do(HttpServletRequest request,HttpServletResponse response) throws IOException {
		Member_Service mService = sqlSession.getMapper(Member_Service.class);
		String loginId = request.getParameter("id");
		String loginPw = request.getParameter("pw");
		Member_DTO mDto = mService.memberLogin(loginId,loginPw);
		if (mDto != null) {
			HttpSession hs = request.getSession();
			hs.setAttribute("member", mDto);
			hs.setAttribute("loginState", true);
			hs.setMaxInactiveInterval(1800);
			return "redirect:index";
		} else {
			response.setContentType("text/html;charset=utf-8");
			PrintWriter pw = response.getWriter();
			pw.print("<script> alert('아이디가 존재하지 않거나 잘못 입력했습니다.'); window.location.href='loginForm'; </script>");
			return null;
		}
		
	}
	
	@RequestMapping(value = "memberLogout")
	public String memberLogout(HttpServletRequest request) {
		HttpSession hs = request.getSession();
		hs.removeAttribute("member");
		hs.setAttribute("loginState", false);
		
		return "redirect:index";
	}
	
	@RequestMapping(value = "mypage")
	public String mypage() {
		return "mypage";
	}
}
