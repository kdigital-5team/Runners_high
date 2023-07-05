package com.spring.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.spring.interceptor.SessionInterceptor;

@Configuration
public class WebConfig implements WebMvcConfigurer{
	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		
		registry.addInterceptor(new SessionInterceptor())
					.addPathPatterns("/gallery");
					// 메인, 대회일정, 로그인, 회원가입, 비밀번호 찾기처럼 로그인 전 수행되는 것 이외 페이지들 전부 add로 추가
					// exclude로 설정할 시 js 파일들도 전부 interceptor로 걸려서 페이지 깨짐!
		
	}

}
