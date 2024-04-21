package com.creator.link.GiftHub;

import java.util.ArrayList;
import java.util.Arrays;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.http.MediaType;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import com.creator.link.Member.Member_DTO;

@Controller
public class GiftHub_Controller {
	
	@Autowired
	SqlSession sqlSession;
	
	@RequestMapping(value = "gifthub")
	public String gifthub() {
		return "gifthub";
	}
	
	@RequestMapping(value = "creatorSelect")
	public String creatorSelect(Model mo) {
		GiftHub_Service gs = sqlSession.getMapper(GiftHub_Service.class);
		ArrayList<GiftHub_Creator_DTO> list = gs.basic_creator_list();
		mo.addAttribute("list",list);
		return "gifthub_creator_select";
	}
	
	@RequestMapping(value = "searChcreator", produces = {MediaType.APPLICATION_JSON_VALUE, "application/json; charset=UTF-8"})
    @ResponseBody
    public String searchCreator(@RequestParam("keyword") String keyword) throws JsonProcessingException {
        GiftHub_Service gs = sqlSession.getMapper(GiftHub_Service.class);
        ArrayList<GiftHub_Creator_DTO> list = gs.search_creator_list(keyword);
        ObjectMapper mapper = new ObjectMapper();
        if (list.isEmpty()) { // list가 비었을 때
        	return mapper.writeValueAsString(new ArrayList<>()); // 빈 배열 return
        }
        else {
        	return mapper.writeValueAsString(list);
        }
    }
	
	@RequestMapping(value = "gifthub_out")
	public String gifthub_out(HttpServletRequest request) {
		GiftHub_Service gs = sqlSession.getMapper(GiftHub_Service.class);
		String [] box_size = request.getParameterValues("box_size");
		System.out.println("box _size: " + box_size);
		String [] big_category = request.getParameterValues("big_category");
		System.out.println("bbig_category: " + big_category);
		String [] mid_category = request.getParameterValues("mid_category");
		System.out.println("mid_category: " + mid_category);
		String [] detail_category = request.getParameterValues("detail_category");
		System.out.println("detail_category: " + detail_category);
		for (int i=0; i < box_size.length-1; i++) {
			// 크리에이터 닉네임 //
			String creator_nick_name = request.getParameter("nick_name");
			System.out.println("nick_name: " + creator_nick_name);
			// 배송 주소 //
			String delivery_post = request.getParameter("address_post");
			System.out.println("address_post: " + delivery_post);
			String delivery_road = request.getParameter("address_road");
			System.out.println("address_road: " + delivery_road);
			String delivery_local = request.getParameter("address_local");
			System.out.println("address_local: " + delivery_local);
			String delivery_detail = request.getParameter("address_detail");
			System.out.println("address_detail: " + delivery_detail);
			// 보내는 사람 아이디 //
			HttpSession hs = request.getSession();
			Member_DTO dto = (Member_DTO)hs.getAttribute("member");
			int mb_number = Integer.parseInt(dto.getMb_number());
			System.out.println("mb_number: " + mb_number);
			String fan_id = gs.getid(mb_number);
			System.out.println("fan_id: " + fan_id);
			// 픽업 주소 //
			String pickup_post = request.getParameter("zip_code");
			System.out.println("zip_code: " + pickup_post);
			String pickup_road = request.getParameter("dlvy_address");
			System.out.println("dlvy_address: " + pickup_road);
			String pickup_local = request.getParameter("dlvy_address_dong");
			System.out.println("dlvy_address_dong: " + pickup_local);
			String pickup_detail = request.getParameter("dlvy_detail");
			System.out.println("dlvy_detail: " + pickup_detail);
			gs.gifthub_insert(box_size[i],big_category[i],mid_category[i],detail_category[i],creator_nick_name,delivery_post,delivery_road,delivery_local,delivery_detail,fan_id,pickup_post,pickup_road,pickup_local,pickup_detail,mb_number);
		}
		return "gifthub_out";
	}

}