package com.creator.link;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

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
import java.io.IOException;
import java.io.InputStreamReader;

@Controller
public class Home_Controller {
	@Autowired
	SqlSession sqlSession;
	
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
//		WebDriverManager.chromedriver().setup(); // 크롬 드라이브 자동 생성
//        WebDriver driver = new ChromeDriver(); // 크롬 드라이브 설정
//        try {
//            driver.get("https://chzzk.naver.com/");
//        } catch (Exception e) {
//            e.printStackTrace();  // 오류 출력
//        } finally {
//            driver.quit();  // 사용이 끝난 드라이버를 종료
//        }
//		try {
//            // ProcessBuilder를 사용하여 Python 스크립트 실행
//            ProcessBuilder pb = new ProcessBuilder("python","C:\\github\\Creator_Link\\src\\main\\webapp\\resources\\python\\cllo.py");
//            pb.redirectErrorStream(true);
//            Process p = pb.start();
//
//            // Python 스크립트의 출력을 읽기
//            BufferedReader in = new BufferedReader(new InputStreamReader(p.getInputStream()));
//            String line;
//            while ((line = in.readLine()) != null) {
//                System.out.println(line);
//            }
//
//            // 오류 스트림 확인
//            BufferedReader err = new BufferedReader(new InputStreamReader(p.getErrorStream()));
//            while ((line = err.readLine()) != null) {
//                System.err.println(line);
//            }
//
//            // 프로세스 종료 코드 확인
//            int exitCode = p.waitFor();
//            System.out.println("Python script exited with code " + exitCode);
//        } catch (IOException | InterruptedException e) {
//            e.printStackTrace();
//        }
//	    List<WebElement> elements = driver.findElements(By.cssSelector("li.component_item__ynD21"));
//	    StringBuilder products = new StringBuilder();
//	    for (WebElement element : elements) {
//	        products.append(element.getText()).append("\n");
//	        System.out.println(element.getText()); // 콘솔에 출력
//	    }
//
//	    driver.quit(); // 웹 드라이버 종료
//	    mo.addAttribute("product", products.toString());
	    return "test";
	}
}
