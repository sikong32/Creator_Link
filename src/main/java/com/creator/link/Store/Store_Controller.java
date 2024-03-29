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
	public String store_save(MultipartHttpServletRequest mul,HttpServletRequest request) throws IllegalStateException, IOException {
		Store_Service  ss = sqlSession.getMapper(Store_Service.class);
		// 회원 번호 가져오기
		HttpSession hs = request.getSession();
		Member_DTO dto = (Member_DTO)hs.getAttribute("member");
		// 상품 정보 가져오기
		String pd_category = mul.getParameter("pd_category");
		String pd_name = mul.getParameter("pd_name");
		int pd_price = Integer.parseInt(mul.getParameter("pd_price"));
		String pd_content = request.getParameter("pd_content");
		int pd_stock = Integer.parseInt(mul.getParameter("pd_stock"));
		MultipartFile mf = mul.getFile("pd_pohto");
		String pd_pohto = filesave(mf.getOriginalFilename());
		mf.transferTo(new File(imagePath + pd_pohto));
//		int pd_option_su = Integer.parseInt(mul.getParameter("pd_option_su"));
		// 제대로 가져왔는지 확인
//		System.out.println(pd_option_su);
		System.out.println(pd_name+"이름"+pd_price+"가격"+pd_content+"내용"+pd_pohto+"사진"+pd_stock+"재고"+pd_category+"카테고리");
		System.out.println("컨텐츠 "+pd_content);
		System.out.println("id 번호:"+dto.getMb_number());
		// 만약 옵션 수가 없으면 그냥 저장
//		if(pd_option_su==0) {
			ss.store_insert0(pd_name,pd_price,pd_category,pd_content,pd_pohto,pd_stock,dto.getMb_number());
		Store_Service sv = sqlSession.getMapper(Store_Service.class);
		int opCategoryCnt1 = Integer.parseInt(request.getParameter("optionsContainer1"));
		int opCategoryCnt2 = Integer.parseInt(request.getParameter("optionsContainer2"));
		int opCategoryCnt3 = Integer.parseInt(request.getParameter("optionsContainer3"));
		
		String os_1name = request.getParameter("os_1name");
		int os_1prcie = Integer.parseInt(request.getParameter("os_1price"));
		String os_1photo = request.getParameter("os_1photo");
		int os_1stock = Integer.parseInt(request.getParameter("os_1stock"));
		ArrayList<Store_OS_DTO> oList1 = new ArrayList<Store_OS_DTO>();
		ArrayList<Store_OS_DTO> oList2 = new ArrayList<Store_OS_DTO>();
		ArrayList<Store_OS_DTO> oList3 = new ArrayList<Store_OS_DTO>();
		System.out.println(request.getParameterValues("option1").length);
		for (int i=1; i< request.getParameterValues("option1").length+1; i++) {
			String os_name = (String)request.getParameter("os_1"+i+"name");
			String os_prcie = (String)request.getParameter("os_1"+i+"price");
			MultipartFile mf1 = mul.getFile("os_1"+i+"photo");
			String os_pohto = filesave(mf1.getOriginalFilename());
//			mf.transferTo(new File(imagePaht + "\\"+pd_pohto));
			String os_stock = (String)request.getParameter("os_1"+i+"stock");
			oList1.add(new Store_OS_DTO(os_name, os_prcie, os_pohto, os_stock));
			for (int j = 1; j < request.getParameterValues("option2").length; j++) {
				String os_2name = (String)request.getParameter("os_2"+i+"name");
				String os_2prcie = (String)request.getParameter("os_2"+i+"price");
				MultipartFile mf2 = mul.getFile("os_2"+i+"photo");
				String os_2pohto = filesave(mf2.getOriginalFilename());
//				mf.transferTo(new File(imagePaht + "\\"+pd_pohto));
				String os_2stock = (String)request.getParameter("os_2"+i+"stock");
				oList2.add(new Store_OS_DTO(os_2name, os_2prcie, os_2pohto, os_2stock));
				for (int j2 = 1; j2 < request.getParameterValues("option3").length; j2++) {
					String os_3name = (String)request.getParameter("os_3"+i+"name");
					String os_3prcie = (String)request.getParameter("os_3"+i+"price");
					MultipartFile mf3 = mul.getFile("os_3"+i+"photo");
					String os_3pohto = filesave(mf3.getOriginalFilename());
//					mf.transferTo(new File(imagePaht + "\\"+pd_pohto));
					String os_3stock = (String)request.getParameter("os_3"+i+"stock");
					oList3.add(new Store_OS_DTO(os_3name, os_3prcie, os_3pohto, os_3stock));
					
				}
			}
		}
		
		
		
//		Store_Service  ss = sqlSession.getMapper(Store_Service.class);
//		// 회원 번호 가져오기
//		HttpSession hs = request.getSession();
//		Member_DTO dto = (Member_DTO)hs.getAttribute("member");
//		// 상품 정보 가져오기
//		String pd_category = mul.getParameter("pd_category");
//		String pd_name = mul.getParameter("pd_name");
//		int pd_price = Integer.parseInt(mul.getParameter("pd_price"));
//		String pd_content = request.getParameter("pd_content");
//		int pd_stock = Integer.parseInt(mul.getParameter("pd_stock"));
//		MultipartFile mf = mul.getFile("pd_pohto");
//		String pd_pohto = filesave(mf.getOriginalFilename());
//		mf.transferTo(new File(imagePaht + "\\"+pd_pohto));
//		// 옵션 카테고리 1
//		String osName = request.getParameter("os_1name");
//		if (osName == null) {
//		    System.out.println("os_1name 매개변수 값이 널입니다.");
//		} else {
//			for (int i = 1; i < 11 ; i++) {
//				String os_name = request.getParameter("os_"+i+"name");
//				String os_price = request.getParameter("os_"+i+"price");
//				MultipartFile mf1 = mul.getFile("os_"+i+"photo");
//				String os_photo = null;
//				if(mf1 == null) {
//				}else {
//					os_photo = filesave(mf1.getOriginalFilename());
////					mf1.transferTo(new File(imagePaht + "\\"+os_photo));
//				}
//				String os_stock = request.getParameter("os_"+i+"stock");
//				System.out.println(os_name);
//				System.out.println(os_price);
//				System.out.println(os_photo);
//				System.out.println(os_stock);
//			}
//		}
		// 옵션 카테고리 2
//		String[] ossu = request.getParameterValues("os_1name");
//		System.out.println(ossu.length);
//		String osName2 = request.getParameter("os_2name");
//		if (osName2 == null) {
//			System.out.println("os_1name 매개변수 값이 널입니다.");
//		} else {
//			for (int i = 1; i < 11 ; i++) {
//				String os_name = request.getParameter("os_1"+i+"name");
//				String os_price = request.getParameter("os_1"+i+"price");
//				MultipartFile mf1 = mul.getFile("os_1"+i+"photo");
//				String os_photo = null;
//				if(mf1 == null) {
//				}else {
//					os_photo = filesave(mf1.getOriginalFilename());
////					mf1.transferTo(new File(imagePaht + "\\"+os_photo));
//				}
//				String os_stock = request.getParameter("os_"+i+"stock");
//				System.out.println(os_name);
//				System.out.println(os_price);
//				System.out.println(os_photo);
//				System.out.println(os_stock);
//			}
//		}
//		// 옵션 카테고리 3
//		String osName3 = request.getParameter("os_3name");
//		if (osName3 == null) {
//			System.out.println("os_1name 매개변수 값이 널입니다.");
//		} else {
//			for (int i = 1; i < 11 ; i++) {
//				String os_name = request.getParameter("os_"+i+"name");
//				String os_price = request.getParameter("os_"+i+"price");
//				MultipartFile mf1 = mul.getFile("os_"+i+"photo");
//				String os_photo = null;
//				if(mf1 == null) {
//				}else {
//					os_photo = filesave(mf1.getOriginalFilename());
////					mf1.transferTo(new File(imagePaht + "\\"+os_photo));
//				}
//				String os_stock = request.getParameter("os_"+i+"stock");
//				System.out.println(os_name);
//				System.out.println(os_price);
//				System.out.println(os_photo);
//				System.out.println(os_stock);
//			}
//		}
//		int pd_option_su = Integer.parseInt(mul.getParameter("optionCategory"));
		// 제대로 가져왔는지 확인
//		System.out.println(pd_option_su);
//		System.out.println("컨텐츠 "+pd_content);
		// 만약 옵션 수가 없으면 그냥 저장
//		if(pd_option_su==0) {
//			ss.store_insert0(pd_name,pd_price,pd_category,pd_content,pd_pohto,pd_stock,dto.getMb_number());
//		}else if(pd_option_su==1){// 옵션 수가 1개이면 아래 코드로 저장
//			String os_1name = mul.getParameter("os_1name");
//			int os_1price = Integer.parseInt(mul.getParameter("os_1priec"));
//			MultipartFile mf1 = mul.getFile("os_1photo");
//			String os_1pohto = filesave(mf1.getOriginalFilename());
//			int os_1stock = Integer.parseInt(mul.getParameter("os_1stock"));
//			System.out.println(os_1name);
//			System.out.println(os_1price);
//			System.out.println(os_1pohto);
//			System.out.println(os_1stock);
//			System.out.println("여기까지 안 왔어?");
//			ss.store_insert1(pd_name,pd_price,pd_category,pd_content,pd_pohto,pd_stock,os_1name,os_1price,os_1pohto,os_1stock);
//		}else if(pd_option_su==2) {// 옵션 수가 2개이면 아래 코드로 저장
//			
//		}else {// 옵션 수가 3개이면 아래 코드로 저장
//			
//		}

		System.out.println("저장안됨");
		return "store_main";

	}
	private void os_category(HttpServletRequest request, MultipartHttpServletRequest mul) throws IOException {
		for (int i = 0; i < 10; i++) {
			String os_name = request.getParameter("os_"+i+"name");
			String os_price = request.getParameter("os_"+i+"price");
			MultipartFile mf = mul.getFile("os_"+i+"photo");
			String os_photo = filesave(mf.getOriginalFilename());
			mf.transferTo(new File(imagePath + "\\"+os_photo));
			String os_stock = request.getParameter("os_"+i+"stock");
			System.out.println(os_name);
			System.out.println(os_price);
			System.out.println(os_photo);
			System.out.println(os_stock);
		}
		
	}
	private String filesave(String fname) throws IOException {
		UUID uuid = UUID.randomUUID();
		String sname = uuid.toString()+"_"+fname;
		return sname;
	}
}
