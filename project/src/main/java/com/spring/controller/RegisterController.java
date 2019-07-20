package com.spring.controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.domain.CustomUserDetails;
import com.spring.service.UserService;

@Controller
@RequestMapping("/user")
public class RegisterController {
	
	private static final Logger logger = LoggerFactory.getLogger(SearchBoardController.class);
	
	@Inject
	private UserService service;
	
	@RequestMapping(value ="/register", method = RequestMethod.GET)
	public void registerGET() {
		
		logger.info("/userregister get ...........");
	}
	
	@RequestMapping(value ="/register2", method = RequestMethod.GET)
	public void register2GET() {
		
		logger.info("/userregister get ...........");
	}
	
	@RequestMapping(value ="/register", method = RequestMethod.POST)
	public String registerPOST(CustomUserDetails user, RedirectAttributes rttr) throws Exception {
		
		logger.info("/userregister POST ...........");
		logger.info("/userregister POST ...........");
		System.out.println("Controller -- " + user);
		service.registerUser(user);
		
		rttr.addFlashAttribute("result", "success");
		
		return "redirect:/main/main";
	}
}
