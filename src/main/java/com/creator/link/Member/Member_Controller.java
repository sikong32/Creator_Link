package com.creator.link.Member;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.lang.reflect.Method;
import java.net.http.HttpRequest;
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
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class Member_Controller {
	@Autowired
	SqlSession sqlSession;
	String basic_path = "C:\\EZEN\\CreatorLink\\-Creator_Link\\src\\main\\webapp\\resources\\member\\basic_photo";
	String profile_path = "C:\\EZEN\\CreatorLink\\-Creator_Link\\src\\main\\webapp\\resources\\member\\profile";
	
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
            imagePath = projectLocation + "/src/main/webapp/resources/member/profile/";
        } catch (IOException e) {
            e.printStackTrace();
        }
	}
	
	
	@RequestMapping(value = "regist")
	public String regist() {
		return "member_regist";
	}
	
	@RequestMapping(value = "regist_do")
	public String regist_do(HttpServletRequest request) throws IOException {
		Member_Service mService = sqlSession.getMapper(Member_Service.class);
		String rgId = request.getParameter("id");
		String rgPw = request.getParameter("pw");
		String rgPwVr = request.getParameter("pw_verify");
		String rgName = request.getParameter("name");
		String rgBirthDate = request.getParameter("birthDate");
		String rgPhone = request.getParameter("phone");

		mService.regist(rgId,rgPw,rgName,rgBirthDate,rgPhone);
		
		return "redirect:index";
	}
	
	@ResponseBody
	@RequestMapping(value = "idCheck", method = RequestMethod.POST)
	public String idCheck(HttpServletRequest request) {
		Member_Service mService = sqlSession.getMapper(Member_Service.class);
		String vrId = request.getParameter("id");
		System.out.println("검증할 ID : "+vrId);
		int idCnt = mService.idCheck(vrId);
		System.out.println("idCnt 값 : "+idCnt);
		if (idCnt == 1) {
			return "fail";
		} else if (idCnt == 0){
			return "pass";
		}
		return "fail";
	}
	
	

	@RequestMapping(value = "login")
	public String login() {
		return "member_login";
	}
	
	@RequestMapping(value = "login_do")
	public String login_do(HttpServletRequest request,HttpServletResponse response) throws IOException {
		Member_Service mService = sqlSession.getMapper(Member_Service.class);
		String loginId = request.getParameter("id");
		String loginPw = request.getParameter("pw");
		Member_DTO mDto = mService.memberLogin(loginId,loginPw);
		if (mDto != null) {
			HttpSession hs = request.getSession();
			hs.setAttribute("member", mDto);
			hs.setAttribute("loginState", true);
			hs.setMaxInactiveInterval(1800);
			return "redirect:index";
		} else {
			response.setContentType("text/html;charset=utf-8");
			PrintWriter pw = response.getWriter();
			pw.print("<script> alert('아이디가 존재하지 않거나 잘못 입력했습니다.'); window.location.href='login'; </script>");
			return null;
		}
	}
	
	@RequestMapping(value = "logout")
	public String memberLogout(HttpServletRequest request) {
		HttpSession hs = request.getSession();
		hs.removeAttribute("member");
		hs.setAttribute("loginState", false);
		
		return "redirect:index";
	}
	
	@RequestMapping(value = "totalPage", method = RequestMethod.POST)
	public ModelAndView total(HttpServletRequest request, ModelAndView mav) {
		Member_Service mService = sqlSession.getMapper(Member_Service.class);
		Member_DTO mDto = new Member_DTO();
		String exId = request.getParameter("exId");
		mDto = mService.totalPage(exId);
		mav.addObject("dto", mDto);
		mav.setViewName("member_total");
		
		return mav;
	}
	
	@RequestMapping(value = "mypage", method = RequestMethod.POST)
	public ModelAndView mypage(HttpServletRequest request, HttpServletResponse response) throws IOException {
		ModelAndView mav = new ModelAndView();
		String myId = request.getParameter("exId");
		if (myId == null || myId == "") {
			response.setContentType("text/html;charset=utf-8");
			PrintWriter pw = response.getWriter();
			pw.print("<script> alert('로그인이 만료됐습니다. 다시 로그인해주세요.'); window.location.href='login'; </script>");
		} else {
		System.out.println("아이디 도착 : "+myId);
		Member_Service mService = sqlSession.getMapper(Member_Service.class);
		Member_DTO mDto = mService.myPage(myId);
		mav.addObject("dto", mDto);
		mav.setViewName("member_mypage");
		return mav;
		}
		return mav;
	}
	
	@ResponseBody
	@RequestMapping(value = "mypage_pwModify", method = RequestMethod.POST)
	public String mypage_pwCheck(HttpServletRequest request) {
		Member_Service mService = sqlSession.getMapper(Member_Service.class);
		String exId = request.getParameter("exId");
		String exPw = request.getParameter("exPw");
		String mdPw = request.getParameter("mdPw");
		int pass = mService.infoCheck(exId,exPw);
		if (pass == 1) {
			mService.passwordModify(exId,exPw,mdPw);
			return "pass";
		} else {
			return "fail";
		}
	}
	
	@ResponseBody
	@RequestMapping(value = "mypage_password_check", method = RequestMethod.POST)
	public String mypage_password_check(HttpServletRequest request) {
		Member_Service mService = sqlSession.getMapper(Member_Service.class);
		String exId = request.getParameter("exId");
		String exPwVr = request.getParameter("exPw");
		int pwCnt = mService.password_check(exId,exPwVr);
		if (pwCnt == 1) {
			return "pass";
		} else {
			return "notPass";
		}
		
	}
	
	@ResponseBody
	@RequestMapping(value = "mypage_nickName_check", method = RequestMethod.POST)
	public String mypage_nickName_check(HttpServletRequest request) {
		Member_Service mService = sqlSession.getMapper(Member_Service.class);
		String exNickName = request.getParameter("exNickName");
		String vrNickName = request.getParameter("vrNickName");
		System.out.println("기존 닉네임 : "+exNickName);
		System.out.println("새 닉네임 : "+vrNickName);
		int pass = 0;
		if (exNickName != vrNickName) {
			pass = mService.checkNickName(vrNickName);
			System.out.println("검색 결과 : "+pass);
			if (pass == 1) {
				System.out.println("\""+vrNickName+"\" 이라는 닉네임이 이미 있다!");
				return "false";
			} else {
				System.out.println("\""+vrNickName+"\" 은(는) 사용 가능한 닉네임이다!");
				return "pass";				
			}
		} 
		return "false";
	}
	
	@RequestMapping(value = "mypage_do", method = RequestMethod.POST)
	public String mypage_do(MultipartHttpServletRequest mul) throws IOException {
		Member_Service mService = sqlSession.getMapper(Member_Service.class);
		int myNumber = Integer.parseInt(mul.getParameter("number")); //회원번호
		String myId = mul.getParameter("id"); //아이디
		String myNickName = mul.getParameter("vrNickName"); // 변경할 닉네임이 기존과 같거나 공란일시 기존 닉네임으로 치환
		String exNickName = mul.getParameter("exNickName"); //기존닉네임
		String myBirthDate = mul.getParameter("birthDate"); //생년월일
		String myPhone = mul.getParameter("phone"); //연락처
		String myEmail = mul.getParameter("email"); //이메일
		String myAttribute = mul.getParameter("attribute");
		String myAddrPost = mul.getParameter("sample4_postcode"); //우편번호
		String myAddrRoad = mul.getParameter("sample4_roadAddress"); //도로명주소
		String myAddrLocal = mul.getParameter("sample4_jibunAddress"); //지번주소
		String myAddrDetail = mul.getParameter("sample4_detailAddress"); //상세주소
		String exPhoto = mul.getParameter("exPhoto"); //기존사진
		MultipartFile mf = mul.getFile("mdPhoto");
		String myPhoto = "";
		if (myId == null || myId == "") {
			myId = "TemporaryId";
		}
		System.out.println("번호 체크 : "+myNumber);
		System.out.println("아이디 체크 : "+myId);
		System.out.println("새 닉네임 체크 : "+myNickName);
		System.out.println("기존 닉네임 체크 : "+exNickName);
		System.out.println("생년월일 체크 : "+myBirthDate);
		System.out.println("연락처 체크 : "+myPhone);
		System.out.println("이메일 체크 : "+myEmail);
		System.out.println("기존 사진 체크 : "+exPhoto);
		
		if(myNickName == "" || myNickName == null) {
			myNickName = exNickName;
			System.out.println("새 닉네임이 없을 시 체크 : "+myNickName);
		}
		
		if (mf == null || mf.isEmpty()) {
			myPhoto = exPhoto;
			System.out.println("새 사진 값이 없을 시 체크 : "+myPhoto);
		} else {
			myPhoto = mf.getOriginalFilename();
			File delPhoto = new File(imagePath+"//"+exPhoto);
			System.out.println("새 사진 체크 : "+myPhoto);
			if (delPhoto.delete()) {
				System.out.println("기존 사진 파일이 성공적으로 삭제됐습니다.");
			} else {
				System.out.println("파일 삭제에 실패했거나 파일이 존재하지 않습니다.");
			}
			myPhoto = filesave(myPhoto, mf.getBytes());
			mf.transferTo(new File(imagePath+"//"+myPhoto));
		}
		mService.mdMyInfo(myNumber,myId,myPhoto,myNickName,myBirthDate,myPhone,myEmail,myAddrPost,myAddrRoad,myAddrLocal,myAddrDetail,myAttribute);
		return "redirect:index";
	}
	
	private String filesave(String rgPhoto2, byte[] bs) throws IOException {
		UUID uid = UUID.randomUUID();
		String randomName = uid.toString()+"_"+rgPhoto2;
		File savePhoto = new File(imagePath+"\\"+randomName);
		FileCopyUtils.copy(bs, savePhoto);
		
		return randomName;
	}
	
	
}
