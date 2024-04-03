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
		int pd_number = Integer.parseInt(request.getParameter("pd_number"));
		Store_Service ss = sqlSession.getMapper(Store_Service.class);
		Store_DTO dto = ss.store_detail(pd_number);
		ArrayList<Store_OS_DTO> list = ss.store_os_detail(pd_number);
		ArrayList<String> os_1name = ss.os_1name_search(pd_number);
		ArrayList<String> os_2name = ss.os_2name_search(pd_number);
		ArrayList<String> os_3name = ss.os_3name_search(pd_number);
		LocalDate today = LocalDate.now();
		model.addAttribute("dto",dto);
		model.addAttribute("list",list);
		model.addAttribute("os1name",os_1name);
		model.addAttribute("os2name",os_2name);
		model.addAttribute("os3name",os_3name);
		model.addAttribute("today",today.plusDays(3));
		return "store_detail";
	}
	@RequestMapping(value = "shoping_buy", method= RequestMethod.POST)
	public String shoping_buy(HttpServletRequest request,Model mo) {
		Store_Service ss = sqlSession.getMapper(Store_Service.class);
		HttpSession hs = request.getSession();
		Member_DTO member = (Member_DTO)hs.getAttribute("member");
		int pd_number = Integer.parseInt(request.getParameter("pd_number"));
		int os_number = 0;
		if(request.getParameter("os_1")!=null&&request.getParameter("os_2")!=null&&request.getParameter("os_1")!=null) {
			String os_1 = request.getParameter("os_1");
			String os_2 = request.getParameter("os_2");
			String os_3 = request.getParameter("os_3");
			os_number = ss.select_os_1number(pd_number,os_1,os_2,os_3);
		}else if(request.getParameter("os_1")!=null&&request.getParameter("os_2")!=null) {
			String os_1 = request.getParameter("os_1");
			String os_2 = request.getParameter("os_2");
			os_number = ss.select_os_2number(pd_number,os_1,os_2);
		}else if(request.getParameter("os_1")!=null){
			String os_1 = request.getParameter("os_1");
			os_number = ss.select_os_3number(pd_number,os_1);
		}
		int buy_su = Integer.parseInt(request.getParameter("buy_quantity"));
		Store_DTO pddto = ss.store_detail(pd_number);
		if(os_number!=0) {
			Store_OS_DTO osdto = ss.select_os(os_number);
			String os_f_name = osdto.getOs_1name()+""+osdto.getOs_2name()+""+osdto.getOs_3name();
			String os_full_name = os_f_name.replace("null","");
			mo.addAttribute("osdto",osdto);
			mo.addAttribute("os_full_name",os_full_name);
		}
		mo.addAttribute("pddto",pddto);
		mo.addAttribute("buy_su",buy_su);
		mo.addAttribute("member",member);
		return "shoping_buy";
	}
	@RequestMapping(value = "shoping_buy_fix")
	public String shoping_buy_fix(HttpServletRequest request) {
//		구매번호:	배송주소:	결제금액:
		Store_Service ss = sqlSession.getMapper(Store_Service.class);
		HttpSession hs = request.getSession();
		Member_DTO member = (Member_DTO)hs.getAttribute("member");
		request.getParameter("");
		int od_number;
		String od_id = member.getMb_id();
		String od_date;
		String od_pd_name = request.getParameter("");
		int od_pd_qnt;
		int od_price;
		String od_cp_code;
		int mb_number;
		
		return "shoping_buy_fix";
	}
	@RequestMapping(value = "gifthub")
	public String gifthub() {
		return "gifthub";
	}
	@RequestMapping(value = "editor", method = RequestMethod.POST)
	public String editor(HttpServletRequest request,Model model) {
		String editor = request.getParameter("editor");
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
		HttpSession hs = request.getSession();
		Member_DTO dto = (Member_DTO)hs.getAttribute("member");
		int mb_number = Integer.parseInt(dto.getMb_number());
		// 대표 상품 정보 가져오기
		String pd_category = mul.getParameter("pd_category");
		String pd_name = mul.getParameter("pd_name");
		int pd_price = Integer.parseInt(mul.getParameter("pd_price"));
		String pd_content = request.getParameter("pd_content");
		int pd_stock = Integer.parseInt(mul.getParameter("pd_stock"));
		MultipartFile mf = mul.getFile("pd_pohto");
		String pd_pohto = filesave(mf.getOriginalFilename());
		mf.transferTo(new File(imagePath + pd_pohto));
		if(request.getParameter("os_radio").equals("Y")&&request.getParameter("os_print_su")!=null) {
			int os_print_su = Integer.parseInt(request.getParameter("os_print_su"));
			ss.store_insert0(pd_name, pd_price, pd_category, pd_content, pd_pohto, pd_stock, mb_number);
			int max_index = ss.store_max_index();
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
				}else if(request.getParameter("os_1_1")!=null && request.getParameter("os_2_1")!=null){
					String os_1name = request.getParameter("os_1_"+i);
					String os_2name = request.getParameter("os_2_"+i);
					ss.os2_insert(max_index,os_1name,os_2name,os_price,os_photo,os_stock);
				}else if(request.getParameter("os_1_1")!=null) {
					String os_1name = request.getParameter("os_1_"+i);
					ss.os1_insert(max_index,os_1name,os_price,os_photo,os_stock);
				}
			}
		}else {
			ss.store_insert0(pd_name, pd_price, pd_category, pd_content, pd_pohto, pd_stock, mb_number);
		}
		return "redirect:store_main";
	}
	private String filesave(String fname) throws IOException {
		UUID uuid = UUID.randomUUID();
		String sname = uuid.toString()+"_"+fname;
		return sname;
	}
}
