package com.spring.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;

import javax.mail.Multipart;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.spring.dto.User;
import com.spring.service.UserService;

@Controller
public class MypageController {

	@Autowired
	UserService service;

	// 커밋
	@GetMapping("/mypage/feed")
	public String mypage_feed() {
		System.out.println("feed");
		return "mypage_feed";
	}

	@GetMapping("/mypage/chall")
	public String mypage_chall() {
		System.out.println("chall");
		return "mypage_chall";
	}

	@GetMapping("/mypage/title")
	public String events() {
		System.out.println("title");
		return "mypage_title";
	}

	// 프로필 수정으로 이동
	@GetMapping("/mypage/edit")
	public String myPageEditForm(HttpServletRequest request, Model model) throws Exception {

		HttpSession session = request.getSession(false);
		System.out.println("접속 계정 : " + session.getAttribute("userId"));

		User user = service.getUserByUserId(session.getAttribute("userId").toString());
		
		System.out.println(
				"닉네임 : " + user.getNickname() + 
				"\n아이디 : " + user.getUser_id() + 
				"\n한줄 소개 : " + user.getIntro());

		model.addAttribute("user", user);
		
		if(session == null || !request.isRequestedSessionIdValid()) {
			model.addAttribute("msg", "로그인 후 이용 가능한 서비스입니다.");
			return "login";
		}
		
		return "mypageEdit";
	}

	// 프로필 수정
	@PutMapping("/mypage/edit")
	public String myPageEdit(HttpServletRequest request,
							 @ModelAttribute("userId") String userId,
							 @ModelAttribute("userNickname") String userNickname,
							 @RequestParam("userPic") MultipartFile userPicFile,
							 @ModelAttribute("userIntro") String userIntro,
							 @ModelAttribute("userPw") String userPw,
							 @ModelAttribute("userPwQ") String userPwQ,
							 @ModelAttribute("userPwA") String userPwA,
							 Model model) throws Exception {
		
		HttpSession session = request.getSession(false);
		boolean result = false;
		User user = service.getUserByUserId(session.getAttribute("userId").toString());
		
			updateProfile(user, userNickname, userPicFile, userIntro, userPw, userPwQ, userPwA);
			
			System.out.println("유저 프로필 수정 - input nickname : " + user.getNickname() +
							   "\n유저 프로필 수정 - input intro : " + user.getIntro() +
							   "\n유저 프로필 수정 - input 비번 질문 : " + user.getPw_quest() +
							   "\n유저 프로필 수정 - input 비번 답변 : " + user.getPw_quest_answer());
			
			 result = service.updateUserProfile(user);

			if(result) {
				
				session.setAttribute("success", "프로필 수정을 완료했습니다!");
				return "redirect:/test";
				
			} else  {
				session.setAttribute("fail", "프로필 수정에 실패했습니다. 다시 시도해주세요.");
				return "/mypage/edit";
			}
	}
	
	// 프로필 수정 method
	public void updateProfile(User user, 
						String userNickname, 
						MultipartFile userPicFile, 
						String userIntro,
						String userPw, 
						String userPwQ, 
						String userPwA) {
		
		System.out.println("updateProfile 실행");
		
		if (userNickname != null && !userNickname.isEmpty()) {
	        user.setNickname(userNickname);
	    }
	    if (userPicFile != null && !userPicFile.isEmpty()) {
	    	deletePreviousUserPicFile(user);
	    	
	    	String picName = StringUtils.cleanPath(userPicFile.getOriginalFilename());
	    	String picUpload = "../static/images/profileImages";
	    	
	    	Path filePath = Paths.get(picUpload, picName);
	    	
	    	try {
				Files.copy(userPicFile.getInputStream(), filePath, StandardCopyOption.REPLACE_EXISTING);
				user.setUser_pic(picName);
				
	    	} catch (IOException e) {
				e.printStackTrace();
				System.out.println("파일 복사 중 발생한 에러 : " + e.getMessage());
			}
	    	
	    	user.setUser_pic(picName);
	    }
	    if (userIntro != null && !userIntro.isEmpty()) {
	        user.setIntro(userIntro);
	    }
	    if (userPw != null && !userPw.isEmpty()) {
	        user.setUser_pw(userPw);
	    }
	    if (userPwQ != null && !userPwQ.isEmpty()) {
	        user.setPw_quest(userPwQ);
	    }
	    if (userPwA != null && !userPwA.isEmpty()) {
	        user.setPw_quest_answer(userPwA);
	    }
	}
	
	private void deletePreviousUserPicFile(User user) {
		
		System.out.println("deletePreviousUserPicFile 실행");
		
		if(user.getUser_pic() != null && !user.getUser_pic().isEmpty()) {

			String picUpload = "../static/images/profileImages";
			String filePath = picUpload + "/" + user.getUser_pic();
			File previousePic = new File(filePath);
			System.out.println("삭제 대상 : " + previousePic);
			
			if(previousePic.exists()) {
				previousePic.delete();
				System.out.println("이전 프로필 사진 파일 삭제");
			} else {
				System.out.println("이전 프로필 사진 파일 없음!");
			}
		}
	}
	
	@GetMapping("/test")
	public String test (HttpServletRequest request,
						Model model) {
		
		HttpSession session = request.getSession(false);
		
		try {
			User user = service.getUserByUserId(session.getAttribute("userId").toString());
			
			model.addAttribute("user", user);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "test";
	}
}
