package com.spring.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import java.util.stream.Collectors;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.dto.Challenge;
import com.spring.dto.ChallengeRegion;
import com.spring.dto.Title;
import com.spring.dto.User;
import com.spring.dto.UserChallenge;
import com.spring.dto.UserTitle;
import com.spring.service.ChallengeService;
import com.spring.service.TitleService;
import com.spring.service.UserService;

@Controller
public class MypageController {

	@Autowired
	UserService service;
	
	@Autowired
	ChallengeService challService;
	
	@Autowired
	TitleService titleService;

	// 참여 챌린지
	@RequestMapping(value = "/mypage/chall", method = RequestMethod.GET)
	public String mypageChall(HttpSession session, Model model) throws Exception {
		String userId =(String)session.getAttribute("userId");
		if(userId == null || userId=="")
			return "login";
		
		User user = service.getUserByUserId(userId);
		List<ChallengeRegion> myChallList = challService.getChallByUserId(userId);
		List<UserChallenge> myUCList = challService.getUserChallbyUserId(userId);
		model.addAttribute("user", user);
		model.addAttribute("myUCList", myUCList);
		model.addAttribute("myChallList", myChallList);
		return "mypage_chall";
	}
	
	// 칭호탭
	@RequestMapping(value = "/mypage/title", method = RequestMethod.GET)
	public String mypageTitle(HttpSession session, Model model) throws Exception {
		System.out.println("title");
		
		String userId = (String) session.getAttribute("userId");
		if(userId == null || userId=="") {
			return "login";
		}
		
		// 전체 칭호 조회
		List<Title> titleList = titleService.getAllTitles();
		System.out.println("전체 칭호 목록 : " + titleList);
		model.addAttribute("titleList", titleList);
		
		User user = service.getUserByUserId(userId);
		model.addAttribute("user", user);
		
		List<UserTitle> userTitle = titleService.getTitleByUserId(userId);
		List<Integer> userTitleIds = new ArrayList<Integer>();
		
		for(int i = 0; i < userTitle.size(); i++) {
			userTitleIds.add(userTitle.get(i).getTitle_id());
			System.out.println("userTitleIds : " + userTitleIds);
		}
		
		List<Title> userTitleList = new ArrayList<Title>();
		
		if (userTitle != null) {
			for(int userTitleId : userTitleIds) {
				userTitleList.addAll(titleService.getTitlesByTitleId(userTitleId));
			}
		}
		System.out.println("해당 유저가 획득한 타이틀 정보 : " + userTitleList);
		model.addAttribute("userTitleList", userTitleList);
		
		return "mypage_title";
	}

	// 프로필 수정으로 이동
	@RequestMapping(value = "/mypage/edit", method = RequestMethod.GET)
	public String myPageEditForm(HttpServletRequest request, Model model) throws Exception {

		HttpSession session = request.getSession(false);
		System.out.println("접속 계정 : " + session.getAttribute("userId"));

		User user = service.getUserByUserId(session.getAttribute("userId").toString());

		System.out.println(
				"닉네임 : " + user.getNickname() + "\n아이디 : " + user.getUser_id() + "\n한줄 소개 : " + user.getIntro());

		model.addAttribute("user", user);

		if (session == null || !request.isRequestedSessionIdValid()) {
			model.addAttribute("msg", "로그인 후 이용 가능한 서비스입니다.");
			return "login";
		}

		return "mypage_edit";
	}

	// 프로필 수정
	@RequestMapping(value = "/mypage/edit", method = RequestMethod.PUT)
	public String myPageEdit(HttpServletRequest request, @ModelAttribute("userId") String userId,
			@ModelAttribute("userNickname") String userNickname, @RequestParam("userPic") MultipartFile userPicFile,
			@ModelAttribute("userIntro") String userIntro, @ModelAttribute("userPw") String userPw,
			@RequestParam("pw_quest_input") String userPwQ, @ModelAttribute("userPwA") String userPwA) throws Exception {

		HttpSession session = request.getSession(false);
		boolean result = false;
		
		User user = service.getUserByUserId(session.getAttribute("userId").toString());

		updateProfile(user, userNickname, userPicFile, userIntro, userPw, userPwQ, userPwA);

		result = service.updateUserProfile(user);

		if (result) {
			return "redirect:/test";

		} else {

			return "mypage_edit";
		}
	}

	// 프로필 수정 method
	public void updateProfile(User user, String userNickname, MultipartFile userPicFile, String userIntro,
			String userPw, String userPwQ, String userPwA) throws Exception {

		String nickNameRegex = "^[ㄱ-ㅎ가-힣a-zA-Z0-9]{2,10}$";
		String pwRegex = "^(?=.*[0-9a-zA-Z])(?=.*[!@#$%^*+=-]).{4,20}$";
		
		boolean nickNamematcher = false;
		boolean pwmatcher = false;
		
		System.out.println("updateProfile 실행");

		if (userNickname != null && !userNickname.isEmpty()) {
			nickNamematcher = Pattern.matches(nickNameRegex, userNickname);
			
			user.setNickname(userNickname);
			
			if (!nickNamematcher) {
				throw new Exception("잘못된 값 또는 잘못된 양식으로 프로필 수정 실패");
			}
		}

		if (userPicFile != null && !userPicFile.isEmpty()) {
			deletePreviousUserPicFile(user);

			String picName = StringUtils.cleanPath(userPicFile.getOriginalFilename());
			String picUpload = "C:/images/";
//	    	C:/images/ -> WebConfing - resources 경로 추가 "file:///C:/images/" 			
			
			Path filePath = Paths.get(picUpload, picName);

			try {
				InputStream stream = userPicFile.getInputStream();
				Files.copy(stream, filePath, StandardCopyOption.REPLACE_EXISTING);
				stream.close();

				user.setUser_pic(picName);
			} catch (IOException e) {
				e.printStackTrace();
				System.out.println("파일 복사 중 발생한 에러 : " + e.getMessage());
			}
		}

		if (userIntro != null && !userIntro.isEmpty()) {
			user.setIntro(userIntro);
		}

		if (userPw != null && !userPw.isEmpty()) {
			
			pwmatcher = Pattern.matches(pwRegex, userPw);
			
			user.setUser_pw(userPw);
			
			if(!pwmatcher) {
				throw new Exception("잘못된 값 또는 잘못된 양식으로 프로필 수정 실패");
			}
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

		if (user.getUser_pic() != null && !user.getUser_pic().isEmpty()) {

			String picUpload = "C:/images/";
			String filePath = picUpload + "/" + user.getUser_pic();

			File previousePic = new File(filePath);
			System.out.println("삭제 대상 : " + previousePic);

			if (previousePic.exists()) {
				System.out.println("이전 프로필 사진 파일 존재");
				previousePic.delete();
			} else {
				System.out.println("이전 프로필 사진 부재!");
			}
		}
	}

	@RequestMapping(value = "/test", method = RequestMethod.GET)
	public String test(HttpServletRequest request, Model model) {

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
