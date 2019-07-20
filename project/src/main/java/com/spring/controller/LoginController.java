package com.spring.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class LoginController {
	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);
	
	@RequestMapping(value = "/loginform", method = { RequestMethod.GET, RequestMethod.POST })
	public String loginform() {
		System.out.println("loginform 메소드 호출입니다.");
		return "/login/loginform";// "/WEB-INF/views/loginform.jsp"
	}

	// 로그인실패 페이지 요청
	@RequestMapping(value = "/loginfail", method = RequestMethod.GET)
	public String loginfail() {

		/* View 정보를 반환하는 부분 */
		return "/login/loginfail"; // "/WEB-INF/views/loginfail.jsp"
	}

	// 로그아웃폼 페이지 요청
	@RequestMapping(value = "/logoutform", method = RequestMethod.GET)
	public String logoutform() {

		/* View 정보를 반환하는 부분 */
		return "/login/logoutform"; // "/WEB-INF/views/logoutform.jsp"
	}

	// 계정별 로그인
	@RequestMapping(value = "/loginsuccess", method = RequestMethod.GET)
	public String loginresult() {

		return "/login/loginsuccess";// "/WEB-INF/views/loginsuccess.jsp"
	}
	// 관리자
	@RequestMapping(value = "/admin", method = RequestMethod.GET)
	public String adminLogin() {

		return "/login/admin";// "/WEB-INF/views/loginsuccess.jsp"
	}
	// 권한으로 인한 접근 불가
    @RequestMapping(value="/access_denied_page")
    public String accessDeniedPage() throws Exception {
        return "/login/access_denied_page";
    }

}
