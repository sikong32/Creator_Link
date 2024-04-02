package com.creator.link.Store;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Properties;
import java.util.UUID;

import javax.annotation.PostConstruct;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.creator.link.Member.Member_DTO;

@Controller
public class Store_Controller {
	@Autowired
	SqlSession sqlSession;

	@Autowired
	ServletContext servletContext;

	String imagePath;
	
	@PostConstruct
	public void init() {
        Properties properties = new Properties();
        try {
        	String Path = servletContext.getRealPath(".");
            properties.load(new FileInputStream(Path+"/META-INF/maven/com.creator/link/pom.properties"));
            String projectLocation = properties.getProperty("m2e.projectLocation");
            imagePath = projectLocation + "/src/main/webapp/resources/store/item_cover/";
        } catch (IOException e) {
            e.printStackTrace();
        }
	}
	
	@RequestMapping(value = "store_main")
	public String store_main(Model model) {
		Store_Service ss = sqlSession.getMapper(Store_Service.class);
		ArrayList<Store_DTO> list = ss.store_mainout();
		model.addAttribute("list",list);
		return "store_main";
	}
	@RequestMapping(value = "shopping_cart")
	public String shopping_cart() {
		return "shopping_cart";
	}
	@RequestMapping(value = "store_detail")
	public String store_detail(HttpServletRequest request,Model model) {
		String pd_number = request.getParameter("pd_number");
		Store_Service ss = sqlSession.getMapper(Store_Service.class);
		Store_DTO dto = ss.store_detail(pd_number);
		LocalDate today = LocalDate.now();
		model.addAttribute("dto",dto);
		model.addAttribute("today",today.plusDays(3));
		return "store_detail";
	}
	@RequestMapping(value = "shoping_buy")
	public String shoping_buy() {
		return "shoping_buy";
	}
	@RequestMapping(value = "shoping_buy_fix")
	public String shoping_buy_fix() {
		return "shoping_buy_fix";
	}
	@RequestMapping(value = "gifthub")
	public String gifthub() {
		return "gifthub";
	}
	@RequestMapping(value = "editor", method = RequestMethod.POST)
	public String editor(HttpServletRequest request,Model model) {
		String editor = request.getParameter("editor");
		System.out.println("에디터에서 받은 값"+editor);
		System.out.println("안되나...  내 5시간...");
		model.addAttribute("editor",editor);
		return "editorout";
	}
	@RequestMapping(value = "store_input")
	public String store_input() {
		return "store_input";
	}
	@RequestMapping(value = "store_save", method = RequestMethod.POST)
	public String store_save2(MultipartHttpServletRequest mul,HttpServletRequest request) throws IllegalStateException, IOException {
		Store_Service ss = sqlSession.getMapper(Store_Service.class);
		// 회원 번호 가져오기
//		HttpSession hs = request.getSession();
//		Member_DTO dto = (Member_DTO)hs.getAttribute("member");
//		System.out.println("맨버 번호"+dto.toString());
		int mb_number = 1002;
//				Integer.parseInt(dto.getMb_number());
		// 대표 상품 정보 가져오기
		String pd_category = mul.getParameter("pd_category");
		String pd_name = mul.getParameter("pd_name");
		int pd_price = Integer.parseInt(mul.getParameter("pd_price"));
		String pd_content = request.getParameter("pd_content");
		int pd_stock = Integer.parseInt(mul.getParameter("pd_stock"));
		MultipartFile mf = mul.getFile("pd_pohto");
		String pd_pohto = filesave(mf.getOriginalFilename());
//		System.out.println("상품 카테고리"+pd_category);
//		System.out.println("상품 이름"+pd_name);
//		System.out.println("상품 가격"+pd_price);
//		System.out.println("상품 상세내용"+pd_content);
//		System.out.println("상품 재고"+pd_stock);
		if(request.getParameter("os_radio").equals("Y")) {
			int os_print_su = Integer.parseInt(request.getParameter("os_print_su"));
//			System.out.println("옵션개수 "+os_print_su);// 옵션 개수 표시
			ss.store_insert0(pd_name, pd_price, pd_category, pd_content, pd_pohto, pd_stock, mb_number);
			int max_index = ss.store_max_index();
			System.out.println("상품의 최근 생성 시퀀스 수"+max_index);
			for (int i = 1; i <= os_print_su; i++) {
				int os_price;
				if(request.getParameter("os_"+i+"price").equals("")){
					os_price = pd_price;
				}else {
					os_price = Integer.parseInt(request.getParameter("os_"+i+"price"));
				}
				int os_stock;
				if(request.getParameter("os_"+i+"stock").equals("")) {
					os_stock = 0;
				}else {
					os_stock = Integer.parseInt(request.getParameter("os_"+i+"stock"));
				}
				String os_photo;
				MultipartFile mf1;
				if(mul.getFile("os_"+i+"pohto")==null){
					os_photo = pd_pohto;
				}else {
					mf1 = mul.getFile("os_"+i+"pohto");
					os_photo = filesave(mf1.getOriginalFilename());
					mf1.transferTo(new File(imagePath + os_photo)); // 옵션사진파일저장
				}
			if(request.getParameter("os_1_1")!=null && request.getParameter("os_2_1")!=null && request.getParameter("os_3_1")!=null) {
				String os_1name = request.getParameter("os_1_"+i);
				String os_2name = request.getParameter("os_2_"+i);
				String os_3name = request.getParameter("os_3_"+i);
				ss.os3_insert(max_index,os_1name,os_2name,os_3name,os_price,os_photo,os_stock);
//				System.out.println("옵션 3 저장");
				}else if(request.getParameter("os_1_1")!=null && request.getParameter("os_2_1")!=null){
					String os_1name = request.getParameter("os_1_"+i);
					String os_2name = request.getParameter("os_2_"+i);
					ss.os2_insert(max_index,os_1name,os_2name,os_price,os_photo,os_stock);
//					System.out.println("옵션 2 저장");
				}else if(request.getParameter("os_1_1")!=null) {
					String os_1name = request.getParameter("os_1_"+i);
					System.out.println("옵션 이름"+os_1name);
					ss.os1_insert(max_index,os_1name,os_price,os_photo,os_stock);
//					System.out.println("옵션 1 저장");
				}
			}
		}else {
//			System.out.println("옵션 없이 저장 시도");
			ss.store_insert0(pd_name, pd_price, pd_category, pd_content, pd_pohto, pd_stock, mb_number);
		}
//		System.out.println("상품 저장 완료");
		return "redirect:store_main";
	}
	private String filesave(String fname) throws IOException {
		UUID uuid = UUID.randomUUID();
		String sname = uuid.toString()+"_"+fname;
		return sname;
	}
}
