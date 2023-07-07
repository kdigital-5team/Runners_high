package com.spring.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

@Component
public class SessionInterceptor implements HandlerInterceptor {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		System.out.println("prehandle inteceptor 실행");
		
		HttpSession session = request.getSession(false);
		
		if(session == null || session.getAttribute("userId") == null) {
			response.sendRedirect("/login");
			return false;
		}
		
		return true;
	}
}