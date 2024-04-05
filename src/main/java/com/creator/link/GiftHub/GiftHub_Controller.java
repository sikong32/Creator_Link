package com.creator.link.GiftHub;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.creator.link.Member.Member_DTO;

@Controller
public class GiftHub_Controller {
	@Autowired
	SqlSession sqlSession;
	
	/*@RequestMapping(value= "get_creator")
	@ResponseBody
	public ArrayList<GiftHub_Creator_DTO> get_creator(){
	GiftHub_Service gs = sqlSession.getMapper(GiftHub_Service.class);
		return gs.creator_list();
	}*/
	
	@RequestMapping(value = "gifthub")
	public String gifthub(Model mo) {
		GiftHub_Service gs = sqlSession.getMapper(GiftHub_Service.class);
		ArrayList<GiftHub_Creator_DTO> creator_list = gs.creator_list();
		mo.addAttribute("list", creator_list);
		return "gifthub";
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
