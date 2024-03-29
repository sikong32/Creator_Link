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
//		int mb_number = Integer.parseInt(dto.getMb_number());
		// 대표 상품 정보 가져오기
		String pd_category = mul.getParameter("pd_category");
		String pd_name = mul.getParameter("pd_name");
		int pd_price = Integer.parseInt(mul.getParameter("pd_price"));
		String pd_content = request.getParameter("pd_content");
		int pd_stock = Integer.parseInt(mul.getParameter("pd_stock"));
		MultipartFile mf = mul.getFile("pd_pohto");
		String pd_pohto = filesave(mf.getOriginalFilename());
		if(request.getParameterValues("os1_su")!=null) {
			int os1_su = request.getParameterValues("os1_su").length; //1번 옵션 카테고리 옵션수 체크
			//옵션이 1개라도 있는지 여부 체크
			if(os1_su>0) {
				ss.store_insert0(pd_name, pd_price, pd_category, pd_content, pd_pohto, pd_stock, 1001);
				int max_index = ss.store_max_index();
				System.out.println(max_index);
				for (int i = 1; i < os1_su+1; i++) {
					String os_name = request.getParameter("os_1"+i+"name");
					String os_price = request.getParameter("os_1"+i+"price");
					String os_stock = request.getParameter("os_1"+i+"stock");
					MultipartFile mf1;
					String os_photo;
					if(mul.getFile("os_1"+i+"pohto")==null){
						os_photo = pd_pohto;
					}else {
						mf1 = mul.getFile("os_1"+i+"pohto");
						os_photo = filesave(mf1.getOriginalFilename());
						mf1.transferTo(new File(imagePath + os_photo)); // 옵션사진파일저장
					}
					ss.os1_insert(os_name,os_price,os_photo,os_stock,max_index);
				}
			}else {
				ss.store_insert0(pd_name, pd_price, pd_category, pd_content, pd_pohto, pd_stock, 1001);
			}
		}
		mf.transferTo(new File(imagePath + pd_pohto)); // 상품 대표사진파일저장
		System.out.println("저장됨");
		return "store_main";

	}
	private String filesave(String fname) throws IOException {
		UUID uuid = UUID.randomUUID();
		String sname = uuid.toString()+"_"+fname;
		return sname;
	}
}
