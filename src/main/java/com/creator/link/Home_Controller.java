package com.creator.link;

import java.io.IOException;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.Properties;

import javax.annotation.PostConstruct;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.creator.link.Member.Member_DTO;

import java.io.BufferedReader;
import java.io.FileInputStream;

@Controller
public class Home_Controller {
	@Autowired
	SqlSession sqlSession;
	
	@Autowired
	ServletContext servletContext;

	String py_path;
	
	@PostConstruct
	public void init() {
        Properties properties = new Properties();
        try {
        	String Path = servletContext.getRealPath(".");
            properties.load(new FileInputStream(Path+"/META-INF/maven/com.creator/link/pom.properties"));
            String projectLocation = properties.getProperty("m2e.projectLocation");
            py_path = projectLocation + "/src/main/webapp/resources/python/";
        } catch (IOException e) {
            e.printStackTrace();
        }
	}
	
	@RequestMapping(value = "/")
	public String main(Model mo,HttpServletRequest request) throws IOException {
		//로그인 정보 없음으로 처리
		HttpSession hs = request.getSession();
		hs.setAttribute("loginState", false);
		//방송 리스트 가져오기
		Home_Service sv = sqlSession.getMapper(Home_Service.class);
		ArrayList<Member_DTO> mb_list = sv.mb_select();
		ArrayList<BC_DTO> bc_list = sv.bc_select();
		mo.addAttribute("bc_list",bc_list);
		mo.addAttribute("mb_list",mb_list);
		return "main";
	}
	
	@RequestMapping(value = "/index")
	public String index(Model mo) {
		Home_Service sv = sqlSession.getMapper(Home_Service.class);
		ArrayList<BC_DTO> bc_list = sv.bc_select();
		ArrayList<Member_DTO> mb_list = sv.mb_select();
		mo.addAttribute("bc_list",bc_list);
		mo.addAttribute("mb_list",mb_list);
		return "main";
	}
	
	@RequestMapping(value = "/live_BC")
	public String index(HttpServletRequest request,Model mo) {
		Home_Service sv = sqlSession.getMapper(Home_Service.class);
		String live_bc = request.getParameter("live_BC");
		ArrayList<BC_DTO> bc_list = sv.bc_select_live(live_bc);
		ArrayList<Member_DTO> mb_list = sv.mb_select();
		mo.addAttribute("bc_list",bc_list);
		mo.addAttribute("mb_list",mb_list);
		return "main";
	}
	
	@RequestMapping(value = "/search")
	public String search(HttpServletRequest request, Model mo) {
		String value = request.getParameter("value");
		
		Home_Service sv = sqlSession.getMapper(Home_Service.class);
		ArrayList<Member_DTO> creator = sv.search_creator(value);
		ArrayList<Search_DTO> item = sv.search_item(value);
		ArrayList<String> seller = sv.search_seller(value);
		
		mo.addAttribute("creator", creator);
		mo.addAttribute("item", item);
		mo.addAttribute("seller", seller);
		
		return "search";
	}
	@RequestMapping(value = "/test")
	public String NewFile(Model mo) throws IOException, InterruptedException {
		ProcessBuilder processBuilder;
	    String a1; // 실행될 파이썬 파일의 경로
	    a1 = py_path + "Crawling.py"; 
	    processBuilder = new ProcessBuilder("python", a1);
	    processBuilder.redirectErrorStream(true);
	    Process process = processBuilder.start();
	    
	    // 로그 출력
	    BufferedReader reader = new BufferedReader(new InputStreamReader(process.getInputStream(),"utf-8"));
	    String line;
	    while ((line = reader.readLine()) != null) {
	        System.out.println(line);
	    }
	    
	    int result = process.waitFor();
	    System.out.println("파이썬 실행 성공은0 실패는 0이외 결과:" + result);
	    return "redirect:index";
	}
}
