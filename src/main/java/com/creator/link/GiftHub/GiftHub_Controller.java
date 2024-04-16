package com.creator.link.GiftHub;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.http.MediaType; // MediaType 임포트 추가
import com.fasterxml.jackson.core.JsonProcessingException; // JsonProcessingException 임포트 추가
import com.fasterxml.jackson.databind.ObjectMapper; // ObjectMapper 임포트 추가

@Controller
public class GiftHub_Controller {
	
	@Autowired
	SqlSession sqlSession;
	
	@RequestMapping(value = "gifthub")
	public String gifthub() {
		return "gifthub";
	}
	
	@RequestMapping(value = "getcreators", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE) // produces : json 형식으로 반환하겠다 선언
    @ResponseBody // 반환 객체를 JSON 형태로 HTTP 응답 본문에 직접 작성
    public String getCreators() throws JsonProcessingException {
        GiftHub_Service gs = sqlSession.getMapper(GiftHub_Service.class);
        ArrayList<GiftHub_Creator_DTO> list = gs.creator_list();
        
        // ObjectMapper를 사용하여 ArrayList를 JSON 문자열로 변환
        ObjectMapper mapper = new ObjectMapper();
        String creators = mapper.writeValueAsString(list);
        
        return creators; // JSON 응답 반환
    }
	
	@RequestMapping(value = "searchcreator", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
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
		String box_size = request.getParameter("box_size");
		String big_category = request.getParameter("big_category");
		String mid_category = request.getParameter("mid_category");
		String detail_category = request.getParameter("detail_category");
		String delivery_address = request.getParameter("delivery_address");
		String pickup_address = request.getParameter("pickup_address");
		GiftHub_Service gs = sqlSession.getMapper(GiftHub_Service.class);
		gs.gifthub_insert(box_size,big_category,mid_category,detail_category,delivery_address,pickup_address);
		return "gifthub_out";
	}

}