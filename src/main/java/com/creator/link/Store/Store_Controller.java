package com.creator.link.Store;

import java.io.File;
import java.io.IOException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@Controller
public class Store_Controller {
	@Autowired
	SqlSession sqlSession;
	
	String imagePaht = "C:\\github\\Creator_Link\\src\\main\\webapp\\resources\\store\\item_cover";
	
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
	public String store_save(MultipartHttpServletRequest mul,HttpServletRequest request) throws IllegalStateException, IOException {
		Store_Service  ss = sqlSession.getMapper(Store_Service.class);
		//		int mb_nember = Integer.parseInt(mul.getParameter("mb_nember"));
		String pd_category = mul.getParameter("pd_category");
		String pd_name = mul.getParameter("pd_name");
		int pd_price = Integer.parseInt(mul.getParameter("pd_price"));
		String pd_content = request.getParameter("pd_content");
		int pd_stock = Integer.parseInt(mul.getParameter("pd_stock"));
		MultipartFile mf = mul.getFile("pd_pohto");
		String pd_pohto = filesave(mf.getOriginalFilename());
		mf.transferTo(new File(imagePaht + "\\"+pd_pohto));
		int pd_option_su = Integer.parseInt(mul.getParameter("pd_option_su"));
		System.out.println(pd_option_su);
		System.out.println(pd_name+"이름"+pd_price+"가격"+pd_content+"내용"+pd_pohto+"사진"+pd_stock+"재고"+pd_category+"카테고리");
		System.out.println("컨텐츠 "+pd_content);
		if(pd_option_su==0) {
			ss.store_insert0(pd_name,pd_price,pd_category,pd_content,pd_pohto,pd_stock);
		}else if(pd_option_su==1){
			String os_1name = mul.getParameter("os_1name");
			int os_1price = Integer.parseInt(mul.getParameter("os_1priec"));
			MultipartFile mf1 = mul.getFile("os_1photo");
			String os_1pohto = filesave(mf1.getOriginalFilename());
			int os_1stock = Integer.parseInt(mul.getParameter("os_1stock"));
			System.out.println(os_1name);
			System.out.println(os_1price);
			System.out.println(os_1pohto);
			System.out.println(os_1stock);
			System.out.println("여기까지 안 왔어?");
			ss.store_insert1(pd_name,pd_price,pd_category,pd_content,pd_pohto,pd_stock,os_1name,os_1price,os_1pohto,os_1stock);
		}else if(pd_option_su==2) {
			
		}else {
			
		}
		System.out.println("저장완료");
		return "store_main";
	}
	private String filesave(String fname) throws IOException {
		UUID uuid = UUID.randomUUID();
		String sname = uuid.toString()+"_"+fname;
		System.out.println(sname);
		return sname;
	}
}
