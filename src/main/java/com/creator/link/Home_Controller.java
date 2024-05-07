package com.creator.link;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
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
import com.creator.link.Store.Store_DTO;


import java.io.BufferedReader;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStreamReader;

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
		ArrayList<BC_DTO> bc_list = sv.bc_select();
		mo.addAttribute("bc_list",bc_list);
		return "main";
	}
	
	@RequestMapping(value = "/index")
	public String index(Model mo) {
		Home_Service sv = sqlSession.getMapper(Home_Service.class);
		ArrayList<BC_DTO> bc_list = sv.bc_select();
		mo.addAttribute("bc_list",bc_list);
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
        String a1; //실행될 파이선 파일의 경로
        a1 = py_path + "cllo2.py"; 
        processBuilder = new ProcessBuilder("python",a1);
        processBuilder.redirectErrorStream(true);
        Process process = processBuilder.start();
        int result = process.waitFor();
        System.out.println(result);
	    return "test";
	}
}
