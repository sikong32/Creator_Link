package com.creator.link.GiftHub;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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
	
	/*@RequestMapping(value = "basicCreators", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE) // produces : json 형식으로 반환하겠다 선언
    @ResponseBody // 반환 객체를 JSON 형태로 HTTP 응답 본문에 직접 작성
    public String getCreators() throws JsonProcessingException {
        GiftHub_Service gs = sqlSession.getMapper(GiftHub_Service.class);
        ArrayList<GiftHub_Creator_DTO> list = gs.creator_list();
        
        // ObjectMapper를 사용하여 ArrayList를 JSON 문자열로 변환
        ObjectMapper mapper = new ObjectMapper();
        String creators = mapper.writeValueAsString(list);
        
        return creators; // JSON 응답 반환
    }*/
	
	@RequestMapping(value = "searChcreator", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
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
	public String gifthub_out(HttpServletRequest request, Model mo) {
		GiftHub_Service gs = sqlSession.getMapper(GiftHub_Service.class);
		String [] box_size = request.getParameterValues("box_size");
		String [] big_category = request.getParameterValues("big_category");
		String [] mid_category = request.getParameterValues("mid_category");
		String [] detail_category = request.getParameterValues("detail_category");
		for (int i=0; i < box_size.length-1; i++) {
			// 크리에이터 닉네임 //
			String creator_nick_name = request.getParameter("nick_name");
			// 배송 주소 //
			String delivery_post = request.getParameter("address_post");
			String delivery_road = request.getParameter("address_road");
			String delivery_local = request.getParameter("address_local");
			String delivery_detail = request.getParameter("address_detail");
			// 보내는 사람 아이디 //
			HttpSession hs = request.getSession();
			Member_DTO dto = (Member_DTO)hs.getAttribute("member");
			int mb_number = Integer.parseInt(dto.getMb_number());
			String fan_id = gs.getid(mb_number);
			// 픽업 주소 //
			String pickup_post = request.getParameter("zip_code");
			String pickup_road = request.getParameter("dlvy_address");
			String pickup_local = request.getParameter("dlvy_address_dong");
			String pickup_detail = request.getParameter("dlvy_detail");
			gs.gifthub_insert(box_size[i],big_category[i],mid_category[i],detail_category[i],creator_nick_name,delivery_post,delivery_road,delivery_local,delivery_detail,fan_id,pickup_post,pickup_road,pickup_local,pickup_detail,mb_number);
		}
		return "gifthub_out";
	}

}