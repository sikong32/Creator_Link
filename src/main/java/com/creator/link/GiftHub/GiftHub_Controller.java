package com.creator.link.GiftHub;

import java.io.IOException;
import java.io.PrintWriter;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import com.creator.link.Member.Member_DTO;

@Controller
public class GiftHub_Controller {
	
	@Autowired
	SqlSession sqlSession;
	
	@RequestMapping(value = "gifthub")
	public String gifthub(HttpServletRequest request, HttpServletResponse response) throws IOException {
		HttpSession hs = request.getSession();
		Member_DTO dto = (Member_DTO)hs.getAttribute("member");
		if(dto!=null) {
			return "gifthub";
		}
		else {
		    PrintWriter out = response.getWriter();
		    response.setCharacterEncoding("utf-8");
		    response.setContentType("text/html; charset=utf-8");
		    out.println("<script>alert('로그인 후 이용 가능합니다'); window.location='store_main';</script>");
		    out.close();
		    return null;
		}
	}
	
	@RequestMapping(value = "creatorSelect")
	public String creatorSelect(Model mo) {
		GiftHub_Service gs = sqlSession.getMapper(GiftHub_Service.class);
		ArrayList<Member_DTO> list = gs.basic_creator_list();
		mo.addAttribute("list",list);
		return "creator_select";
	}
	
	@RequestMapping(value = "searChcreator", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public ResponseEntity<byte[]> searchCreator(@RequestParam("keyword") String keyword) throws JsonProcessingException {
	    GiftHub_Service gs = sqlSession.getMapper(GiftHub_Service.class);
	    ArrayList<GiftHub_Creator_DTO> list = gs.search_creator_list(keyword);
	    ObjectMapper mapper = new ObjectMapper();
	    // 한글 깨짐 오류 발생 했던 원인 : 서버 → 클라이언트로 JSON 전송 할 때 문제 발생
	    // 서버 : 한글 정상 출력, 자바스크립트 : 한글 ? 출력 됐었음 (아래의 코드들로 해결)
	    byte[] jsonData = mapper.writeValueAsBytes(list); // JSON을 바이트 배열로 직접 생성 (인코딩 문제 방지)
	    HttpHeaders headers = new HttpHeaders();
	    headers.setContentType(new MediaType("application", "json", StandardCharsets.UTF_8)); // UTF-8 인코딩 명시적 지정
	    return new ResponseEntity<>(jsonData, headers, HttpStatus.OK);
	}
	
	@RequestMapping(value = "buyComplete", method = RequestMethod.POST)
	public String gifthub_out(HttpServletRequest request, HttpServletResponse response) throws IOException {
		GiftHub_Service gs = sqlSession.getMapper(GiftHub_Service.class);
		PrintWriter out = response.getWriter();
	    response.setCharacterEncoding("utf-8");
	    response.setContentType("text/html; charset=utf-8");
		String [] box_size = request.getParameterValues("box_size");
		String [] big_category = request.getParameterValues("big_category");
		String [] mid_category = request.getParameterValues("mid_category");
		String [] detail_category = request.getParameterValues("detail_category");
		String [] prices = request.getParameterValues("gift_price");
		// 선물 선택 여부 체크//
		if (prices==null) {
		    out.println("<script>alert('보낼 선물을 선택해주세요'); window.location='gifthub';</script>");
		    out.close();
		}
		// int로 형변환 (바로 parseInt 적용 안돼서 for문 사용)
		int [] gift_price = new int [prices.length];
		for (int i = 0; i < prices.length; i++) {
			// 가격 순서가 거꾸로 담겨서 추가 했음//
			gift_price[prices.length - 1 - i] = Integer.parseInt(prices[i]);
		}
		// 크리에이터 선택 여부 체크 //
		String creator_nick_name = request.getParameter("nick_name");
		if (creator_nick_name==null){
		    out.println("<script>alert('선물 할 크리에이터를 선택해주세요'); window.location='gifthub';</script>");
		    out.close();
		}
		// 로그인 여부 체크 //
		HttpSession hs = request.getSession();
		Member_DTO dto = (Member_DTO)hs.getAttribute("member");
		if(dto!=null) {
			for (int i=0; i < box_size.length-1; i++) {
				// 배송 주소 //
				String delivery_post = request.getParameter("address_post");
				String delivery_road = request.getParameter("address_road");
				String delivery_local = request.getParameter("address_local");
				String delivery_detail = request.getParameter("address_detail");
	
				// 보내는 사람 아이디 //
				int mb_number = Integer.parseInt(dto.getMb_number());
				String fan_id = gs.getid(mb_number);
				// 픽업 주소 //
				String pickup_post = request.getParameter("zip_code");
				String pickup_road = request.getParameter("dlvy_address");
				String pickup_local = request.getParameter("dlvy_address_dong");
				String pickup_detail = request.getParameter("dlvy_detail");
				gs.gifthub_insert(box_size[i],big_category[i],mid_category[i],detail_category[i],creator_nick_name,delivery_post,delivery_road,delivery_local,delivery_detail,fan_id,pickup_post,pickup_road,pickup_local,pickup_detail,gift_price[i],mb_number);
			}
			return "buy_complete";
		}
		else {
		    out.println("<script>alert('로그인 후 다시 이용해주세요'); window.location='store_main';</script>");
		    out.close();
		}
		return null;
	}

}