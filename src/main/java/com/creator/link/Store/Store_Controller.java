package com.creator.link.Store;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Properties;
import java.util.UUID;

import javax.annotation.PostConstruct;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
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
	@ResponseBody
	@RequestMapping(value = "shopping_cart_save",method = RequestMethod.POST)
	public String shopping_cart(HttpServletRequest request,HttpServletResponse response) {
		response.setContentType("text/html;charset=utf-8");
		HttpSession hs = request.getSession();
		Member_DTO member = (Member_DTO)hs.getAttribute("member");
		Store_Service ss = sqlSession.getMapper(Store_Service.class);
		int pd_number = Integer.parseInt(request.getParameter("pd_number"));
		if(request.getParameter("os_number")!=null) { //옵션 선택 이 있을 경우
			String[] os_numbers = request.getParameterValues("os_number");
			for (int i = 0; i < os_numbers.length; i++) {
				ss.cart_save_os(pd_number,member.getMb_number(),os_numbers[i]);
				System.out.println("os_number"+os_numbers[i]);
			}
		}else {
			ss.cart_save_noos(pd_number,member.getMb_number());
		}
		return 	"저장성공";
	}
	@RequestMapping(value = "shopping_cart_view")
	public String shopping_cart_view(HttpServletRequest request, Model mo) {
		HttpSession hs = request.getSession();
		Member_DTO member = (Member_DTO)hs.getAttribute("member");
		Store_Service ss = sqlSession.getMapper(Store_Service.class);
		ArrayList<Store_Cart_DTO> cart_list = ss.cart_select(member.getMb_number());
		ArrayList<Store_OS_DTO> os_list = new ArrayList<Store_OS_DTO>(); // 옵션 정보 초기화
		ArrayList<Store_DTO> pd_list = new ArrayList<Store_DTO>(); // 상품 정보 초기화
		
		for (int i = 0; i < cart_list.size(); i++) {
			if(cart_list.get(i).getOs_number()!=0) {
				Store_OS_DTO os_number = ss.select_os(cart_list.get(i).getOs_number());
				os_list.add(os_number);
			}else {
				Store_DTO pd_number = ss.select_pd(cart_list.get(i).getPd_number());
				pd_list.add(pd_number);
			}
		}
		mo.addAttribute("os_list",os_list);
		mo.addAttribute("pd_list",pd_list);
		return "shopping_cart_view";
	}
	@ResponseBody
	@RequestMapping(value = "os_number_get",method = RequestMethod.GET)
	public String os_number_get(HttpServletRequest request) {
		int pd_number = Integer.parseInt(request.getParameter("pd_number"));
		Store_Service ss = sqlSession.getMapper(Store_Service.class);
		String[] os_names = request.getParameter("os_names").split(",");
		int os_number = 0;
		if(os_names.length == 1) {
			os_number = ss.select_os_3number(pd_number,os_names[0]);
		}else if(os_names.length == 2) {
			os_number = ss.select_os_2number(pd_number,os_names[0],os_names[1]);
		}else if(os_names.length == 3) {
			os_number = ss.select_os_1number(pd_number,os_names[0],os_names[1],os_names[2]);
		}
		return String.valueOf(os_number);
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
		
		ArrayList<Store_DTO> pd_list = ss.select_pd_all(pd_number);
		ArrayList<Store_OS_DTO> os_list = null;
		if(request.getParameter("os_number")!=null) {
			String[] os_numbers = request.getParameterValues("os_number");
			for (int i = 0; i < os_numbers.length; i++) {
				os_list = ss.select_os_all(pd_number,Integer.parseInt(os_numbers[i]));
			}
			mo.addAttribute("pd_list",pd_list);
			mo.addAttribute("os_list",os_list);
		}
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
		int buy_quantity = Integer.parseInt(request.getParameter("buy_quantity"));
		Store_DTO pddto = ss.store_detail(pd_number);
		if(os_number!=0) {
			Store_OS_DTO osdto = ss.select_os(os_number);
			String os_f_name = osdto.getOs_1name()+""+osdto.getOs_2name()+""+osdto.getOs_3name();
			String os_full_name = os_f_name.replace("null","");
			mo.addAttribute("osdto",osdto);
			mo.addAttribute("os_full_name",os_full_name);
		}
		mo.addAttribute("pddto",pddto);
		mo.addAttribute("buy_quantity",buy_quantity);
		mo.addAttribute("member",member);
		return "shoping_buy";
	}
	@RequestMapping(value = "shoping_buy_fix")
	public String shoping_buy_fix(HttpServletRequest request,Model mo) {
//		구매번호:	배송주소:	결제금액:
		Store_Service ss = sqlSession.getMapper(Store_Service.class);
		HttpSession hs = request.getSession();
		Member_DTO member = (Member_DTO)hs.getAttribute("member");
		//배송 주소 저장
		int zip_code = Integer.parseInt(request.getParameter("zip_code"));
		String dlvy_address = request.getParameter("dlvy_address");
		String dlvy_address_dong = request.getParameter("dlvy_address");
		String dlvy_detail = request.getParameter("dlvy_detail");
		String dlvy_comment = request.getParameter("dlvy_comment");
		int pd_number = Integer.parseInt(request.getParameter("pd_number"));
		String od_id = member.getMb_id();
		String od_pd_name = request.getParameter("pd_name");
		int od_pd_qnt = Integer.parseInt(request.getParameter("buy_quantity"));
		int od_price = Integer.parseInt(request.getParameter("price"));
		String od_cp_code = "0";
		int mb_number = Integer.parseInt(member.getMb_number());
		if(request.getParameter("od_cp_code")!=null) {
			od_cp_code = request.getParameter("od_cp_code");
		}
		if(request.getParameter("os_number")!=null) {
			int os_number = Integer.parseInt(request.getParameter("os_number"));
			ss.od_insert_os(od_id,od_pd_name,od_pd_qnt,od_price,od_cp_code,mb_number,os_number,zip_code,dlvy_address,dlvy_address_dong,dlvy_detail,dlvy_comment);
			ss.od_updata_os(pd_number,od_pd_qnt,os_number);
		}else {
			ss.od_insert(od_id,od_pd_name,od_pd_qnt,od_price,od_cp_code,mb_number,zip_code,dlvy_address,dlvy_address_dong,dlvy_detail,dlvy_comment);
		}
		ss.od_updata_pd(pd_number,od_pd_qnt);
		int od_number = ss.od_select_number(od_id,od_pd_name,mb_number);
		mo.addAttribute("od_number",od_number);
		mo.addAttribute("od_address",dlvy_address+""+dlvy_detail+""+dlvy_comment);
		mo.addAttribute("od_price",od_price);
		return "shoping_buy_fix";
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
		MultipartFile mf = mul.getFile("pd_photo");
		String pd_photo = filesave(mf.getOriginalFilename());
		mf.transferTo(new File(imagePath + pd_photo));
		if(request.getParameter("os_radio").equals("Y")&&request.getParameter("os_print_su")!=null) {
			int os_print_su = Integer.parseInt(request.getParameter("os_print_su"));
			ss.store_insert0(pd_name, pd_price, pd_category, pd_content, pd_photo, pd_stock, mb_number);
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
				String os_photo = pd_photo;
				MultipartFile mf1 = mul.getFile("os_"+i+"photo");
				if(mf1 != null && !mf1.isEmpty()){
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
			ss.store_insert0(pd_name, pd_price, pd_category, pd_content, pd_photo, pd_stock, mb_number);
		}
		return "redirect:store_main";
	}
	private String filesave(String fname) throws IOException {
		UUID uuid = UUID.randomUUID();
		String sname = uuid.toString()+"_"+fname;
		return sname;
	}
}
