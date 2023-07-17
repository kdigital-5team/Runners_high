package com.spring.service;

import java.sql.SQLException;
import java.util.List;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.dto.User;
import com.spring.mapper.UserMapper;

@Service
public class UserService {
	@Autowired
	UserMapper mapper;
	
	// List
	public List<User> getAllUsers() {
		return mapper.getAllUsers();
	}

	// 회원가입
	public boolean insertUser(User user) throws SQLException, Exception {
		boolean result = false;
		
		// 비밀번호 암호화
//		System.out.println("암호화 전 : " + user.getUser_pw());
		user.setUser_pw(BCrypt.hashpw(user.getUser_pw(), BCrypt.gensalt()));
//		System.out.println("암호화 후 : " + user.getUser_pw());
		
		int res = mapper.insertUser(user);
		
		if(res != 0) {
			result = true;
		} else {
			throw new Exception("유저 회원가입 실패");
		}
		
		return result;
	}


	public int idCheck(String userId) throws Exception {
        return mapper.idCheck(userId);
    }



	public int nickNameCheck(String nickName) throws Exception{
		return mapper.nickNameCheck(nickName);
	}


	public String findPw(String user_id, String pw_quest, String pw_quest_answer) throws Exception{
		return mapper.findPw(user_id, pw_quest, pw_quest_answer);
	}
	public boolean updatePw(String new_pw, String user_id) throws Exception{
		return mapper.updatePw(new_pw, user_id);
	}


	// 로그인
	public User getUserByUserId(String userId) throws Exception { 
		User user = mapper.getUserByUserId(userId);
		
		if(user == null) {
			throw new Exception("등록되지 않은 사용자 또는 아이디/비밀번호 오류입니다.");
		}
		return user; 
	}

	// 프로필 수정
	public boolean updateUserProfile(User user) throws Exception {
		boolean result = false;
		
		// 비밀번호 재암호화
		if(user.getUser_pw() != null && user.getUser_pw() != "") {
		user.setUser_pw(BCrypt.hashpw(user.getUser_pw(), BCrypt.gensalt()));
		}
		
		int res = mapper.updateUserProfile(user);
		System.out.println("res : " + res);
		
		if(res != 0) {
			result = true;
		} else {
			throw new Exception("유저 프로필 업데이트 실패");
		}
		
		return result;
	}
	
/* 0706 카카오 로그인 API
 * 9.0.1 문법 적용 : nullpointerException
 * Token으로 유저 정보 가지고 오기 : java.lang.IllegalArgumentException: invalid start or end
	// 카카오 로그인
	public String getAccessToken(String code) {
		// 사용자 토큰 
		String access_Token = "";
		// access가 만료되었을 때 새로 발급받기 위함.
		String refresh_Token = "";
		// 토큰 요청 url
		String reqURL = "https://kauth.kakao.com/oauth/token";
		 
		 try {
			URL url = new URL(reqURL);
			
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("POST");
			conn.setDoOutput(true);
			
			BufferedWriter bw = 
						new BufferedWriter
							(new OutputStreamWriter(conn.getOutputStream()));
			StringBuilder sb = new StringBuilder();
			sb.append("grant_type=authorization_code");
			sb.append("&client_id=6b8fd47f0536895682320ac460cd43a2");
			sb.append("&redirect_uri=http://localhost:8081/login/kakao");
			sb.append("&code=" + code);
			
			bw.write(sb.toString());
			bw.flush();
			
			// 응답 코드 200이어야 성공
			int responseCode = conn.getResponseCode();
			System.out.println("responseCode : " + responseCode);
			
			BufferedReader br = 
						new BufferedReader
							(new InputStreamReader(conn.getInputStream()));
			String line = "";
			String result = "";
			
			while((line = br.readLine()) != null) {
				result += line;
			}
			System.out.println("response body : " + result);
			
			//기존 문법 
			JsonParser parser = new JsonParser();
			JsonElement element = parser.parse(result);
			access_Token = element.getAsJsonObject().get("access_token").getAsString();
			refresh_Token = element.getAsJsonObject().get("refresh_token").getAsString();
			
			// Gson 2.9.1 버전 ??
			JsonElement elements = JsonParser.parseString(result);
			access_Token = ((JsonObject) elements).get("access_Token").getAsString();
			refresh_Token = ((JsonObject) elements).get("refresh_Token").getAsString();
			
			System.out.println("access_Token : " + access_Token);
			System.out.println("refresh_Token : " + refresh_Token);
			
			br.close();
			bw.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
		 
		return access_Token;
	}

	// 카카오 Token으로 유저 정보
	public HashMap<String, Object> getUserByKakaoToken(String access_Token) {
		HashMap<String, Object> userInfo = new HashMap<String, Object>();
		
		String reqURL = "https://kapi.kakao.com/v2/user/me";
		
		try {
			URL url = new URL(reqURL);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("GET");
			
			// 요청 header
			conn.setRequestProperty("Authorization", "Bearer " + access_Token);
			
			int responseCode = conn.getResponseCode();
			System.out.println("responseCode : " + responseCode);
			
			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			
			String line = "";
			String result = "";
			
			while((line = br.readLine()) != null) {
				result += line;
			}
			System.out.println("response body : " + result);
			
			JsonParser parser = new JsonParser();
			JsonElement element = parser.parse(result);
			
			JsonObject properties = element.getAsJsonObject().get("kakao_account.profile").getAsJsonObject();
			JsonObject kakao_account = element.getAsJsonObject().get("kakao_account").getAsJsonObject();
			
			String nickname = properties.getAsJsonObject().get("nickname").getAsString();
			String picture= properties.getAsJsonObject().get("picture").getAsString();
			
			userInfo.put("nickname", nickname);
			userInfo.put("picture", picture);
			
			return userInfo;
		} catch (IOException e) {
			e.printStackTrace();
		}
		return userInfo;
	}
*/
}
