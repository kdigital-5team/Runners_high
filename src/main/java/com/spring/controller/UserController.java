package com.spring.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.spring.dto.User;
import com.spring.service.UserService;

@Controller
public class UserController {
	@Autowired
	private UserService service;


	// http://localhost:8081/user/all
	@RequestMapping(value = "/user/all", method = RequestMethod.GET)
	public String getDeptByDeptno(Model model) throws Exception {
		List<User> user = service.getAllUsers();

		model.addAttribute("user", user);
		System.out.println(user);

		return "home";
	}
	
	// http://localhost:8081/regist
	@RequestMapping(value = "/regist", method = RequestMethod.GET)
	public String Regist() throws Exception {
		return "regist";
	}
	
	// http://localhost:8081/findPw
	@RequestMapping(value = "/findPw", method = RequestMethod.GET)
	public String findPw() throws Exception {
		return "findPw";
	}
	// http://localhost:8081/findPw
	@RequestMapping(value = "/updatePw", method = RequestMethod.GET)
	public String updatePw() throws Exception {
		return "findPw";
	}
	
	// http://localhost:8081/regist
	@RequestMapping(value = "/regist", method = RequestMethod.POST)
	public String insertDept(@ModelAttribute User newUser,
							 Model model) {
		
		System.out.println(newUser);
		boolean userResult = false;

	
		try {
			userResult = service.insertUser(newUser);
			
			if(userResult) {
				return "home";
			}
			
		} catch (Exception e) {
			
			e.printStackTrace();
			return "home";
		}
		return "home";
		
	}
	
	
	// 아이디 체크 비동기
	@ResponseBody
    @RequestMapping(value="/idCheck", method=RequestMethod.POST)
    public int idCheck(@RequestBody String userId) throws Exception {
        
        int count = 0;
        count = service.idCheck(userId);
 
        return count;    
    }
	
	// 닉네임 체크 비동기
	@ResponseBody
    @RequestMapping(value="/nickNameCheck", method=RequestMethod.POST)
    public int nickNameCheck(@RequestBody String nickName) throws Exception {
        
        int count = 0;
        count = service.nickNameCheck(nickName);
 
        return count;    
    }
	
	// 비밀번호 찾기
    @RequestMapping(value="/findPw", method=RequestMethod.POST)
    public String findPw(@RequestParam String user_id, String pw_quest, String pw_quest_answer,
    		HttpServletRequest request) throws Exception {
    	HttpSession session = request.getSession(true);
		String pw = service.findPw(user_id, pw_quest, pw_quest_answer);
		try {
			pw.isEmpty();
		} catch(Exception e) {
			
			//db에서 조건에 맞는 값이 없어서 가져오지 못한 경우 발생
			
			System.out.println("Null Point!");
			return "findPw"; 
		}
		// db에서 정상적으로 가져온 경우 세션을 만들어주고 다음 페이지로 이동
		session.setAttribute("userId", user_id);
		return "updatePw";

	}
    
    // 비밀번호 변경
    @RequestMapping(value="/updatePw", method=RequestMethod.POST)
    public String updatePw(HttpServletRequest request) throws Exception {
    	HttpSession session = request.getSession(true);
    	String new_Pw = request.getParameter("new_Pw");
    	String userId = session.getAttribute("userId").toString();
    	
    	boolean userResult = false;
    	try {
    			userResult = service.updatePw(new_Pw, userId);
				
    	} catch (Exception e) {
			e.printStackTrace();
			session.invalidate();
			return "home";
    	}
    	session.invalidate();
    	return "home";
    }
	// http://localhost:8081/login
	// 로그인 폼으로 이동
	@GetMapping("/login")
	public String loginForm() {
		return "login";
	}

	// 로그인
	@PostMapping("/login")
	public String login(@RequestParam("userId") String userId, @RequestParam("userPw") String userPw,
			HttpSession session,
			Model mv){
		
		try {
			User user = service.getUserByUserIdAndUserPw(userId, userPw);
			
				session.setAttribute("userId", userId);
				System.out.println("접속자 session : " + session.getAttribute("userId"));
			
		} catch (Exception e) {
				mv.addAttribute("msg", e.getMessage());
				System.out.println("mv : " + mv);
//			e.printStackTrace();
			
			return "redirect:/login";
		}
		
		return "redirect:/main";
	}

	// 로그아웃
	@GetMapping("/logout")
	public String logout(HttpSession session) {

		if (session != null) {
			session.invalidate();
		}
		return "redirect:/main";
	}
	
/* 0706 카카오 API 로그인
	// 카카오 로그인
	@GetMapping("/login/kakao")
	public String kakaoLogin(@RequestParam(value = "code", required = false) String code) throws Exception {
		System.out.println("###code : " + code);
		
		String access_Token = service.getAccessToken(code);
		System.out.println("###access_Token : " + access_Token);
		
		HashMap<String, Object> userInfo = service.getUserByKakaoToken(access_Token);
		System.out.println("###userInfo : " + userInfo);
		
		return "test";
    	}
*/ 
}
