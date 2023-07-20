package com.spring.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.dto.User;
import com.spring.service.MailService;
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
	@RequestMapping(value = "/findPw/updatePw", method = RequestMethod.GET)
	public String updatePw() throws Exception {
		return "updatePw";
	}
	
	// 회원가입
	// http://localhost:8081/regist
	@RequestMapping(value = "/regist", method = RequestMethod.POST)
	public String insertDept(@ModelAttribute User newUser,
							 @RequestParam("pw_quest_input") String pwQuestInput,
							 Model model) {
		boolean userResult = false;
		
		newUser.setPw_quest(pwQuestInput);
		
		System.out.println(newUser);
	
		try {
			userResult = service.insertUser(newUser);
			
			if(userResult) {
				return "login";
			}
			
		} catch (Exception e) {
			
			e.printStackTrace();
			return "regist";
		}
		return "regist";
		
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
    public String findPw(@RequestParam String user_id, @RequestParam("pw_quest_input") String pw_quest, String pw_quest_answer,
    		HttpServletRequest request) throws Exception {
    	
    	HttpSession session = request.getSession(true);
    	
    	System.out.println("입력한 접속자 정보 : " + user_id);
    	
    	String pw = service.findPw(user_id, pw_quest, pw_quest_answer);
    	
    	if (pw == "" || pw == null) {
    		System.out.println("접속자 조회 결과 : 없는 유저입니다.");
    		throw new Exception();
    	}
    	
    	session.setAttribute("userId", user_id);
    	System.out.println("세션에 유저 정보 저장 : " + session.getAttribute("userId"));
    	
    	return "updatePw";
    	
	}
    
    // 비밀번호 변경
    @RequestMapping(value="/findPw/updatePw", method=RequestMethod.POST)
    public String updatePw(HttpServletRequest request) throws Exception {
    	System.out.println("update pw controller 실행");
    	
    	HttpSession session = request.getSession(true);
    	String new_Pw = request.getParameter("new_Pw");
    	String userId = session.getAttribute("userId").toString();
    	
    	boolean userResult = false;
    	
    	try {
    			userResult = service.updatePw(new_Pw, userId);
				
    	} catch (Exception e) {
			e.printStackTrace();
			session.invalidate();
			return "main";
    	}
    	session.invalidate();
    	return "redirect:/login";
    }


	// http://localhost:8081/login
	// 로그인 폼으로 이동
    
    @RequestMapping(value = "/login", method = RequestMethod.GET)
	public String loginForm() {
		return "login";
	}

	// 로그인
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(@RequestParam("userId") String userId, @RequestParam("userPw") String userPw,
			HttpSession session,
			Model model) {
		
			boolean pwResult;
				try {
					pwResult = BCrypt.checkpw(userPw, service.getUserByUserId(userId).getUser_pw());
				
					System.out.println(pwResult);
					if(pwResult == true) {
						session.setAttribute("userId", userId);
						System.out.println("접속자 session : " + session.getAttribute("userId"));
						// session 만료 시간 : 2주
						session.setMaxInactiveInterval(1209600);
						
						return "redirect:/main";
						
					} else {
						
						model.addAttribute("msg", "아이디/비밀번호를 다시 확인해주십시오.");
						System.out.println("model 2 : " + model.getAttribute("msg"));
						
						return "login";
					}
				
				} catch (Exception e) {
					model.addAttribute("msg", e.getMessage());
					System.out.println("model 3 : " + model.getAttribute("msg"));
					
					return "login";
				}
	}

	// 로그아웃
    @RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) {

		if (session != null) {
			session.invalidate();
		}
		return "redirect:/main";
	}
	
	
	
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

