package com.spring.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.spring.interceptor.SessionInterceptor;

@Configuration
//@EnableWebMvc
public class WebConfig implements WebMvcConfigurer{
	
	/*마이페이지 main.js등등 js파일 No mapping for GET 경고 떠서 교체*/
	
	private static final String[] CLASSPATH_RESOURCE_LOCATIONS = {
            "classpath:/META-INF/resources/", "classpath:/resources/",
            "classpath:/static/", "classpath:/public/", "file:///C:/images/"};
	
	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
	        registry.addResourceHandler("/**")
	                .addResourceLocations(CLASSPATH_RESOURCE_LOCATIONS);
	        registry.addResourceHandler("/images/**")
            .addResourceLocations("file:///C:/images/");
	}
	
	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		registry.addInterceptor(new SessionInterceptor())
					.addPathPatterns("/gallery");
					// 메인, 대회일정, 로그인, 회원가입, 비밀번호 찾기처럼 로그인 전 수행되는 것 이외 페이지들 전부 add로 추가
					// exclude로 설정할 시 js 파일들도 전부 interceptor로 걸려서 페이지 깨짐!
		
	}

}
