package com.spring.controller;

import java.io.PrintWriter;
import java.util.Map;

import javax.inject.Inject;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.domain.CustomUserDetails;
import com.spring.service.UserService;

@Controller
@RequestMapping("/user")
public class RegisterController {
	
	private static final Logger logger = LoggerFactory.getLogger(SearchBoardController.class);
	
	@Inject
	private UserService service;
	
	@Autowired
    JavaMailSender mailSender;

	
	@RequestMapping(value ="/register", method = RequestMethod.GET)
	public void registerGET() {
		
//		logger.info("/userregister get ...........");
	}
	
	@RequestMapping(value ="/register2", method = RequestMethod.GET)
	public void register2GET() {
		
//		logger.info("/userregister get ...........");
	}
	
	@RequestMapping(value ="/register2", method = RequestMethod.POST)
	public String registerPOST(CustomUserDetails user, RedirectAttributes rttr) throws Exception {
		
//		logger.info("/userregister POST ...........");
//		logger.info("/userregister POST ...........");
//		System.out.println("Controller -- " + user);
		service.registerUser(user);
		
		rttr.addFlashAttribute("result", "success");
		
		return "redirect:/main/main";
	}
	
	@RequestMapping(value ="/checkId", method = RequestMethod.POST)
	@ResponseBody
	public String checkId(String username) throws Exception {
		
		CustomUserDetails userVO = service.getUser(username);
//		System.out.println("userVO " + userVO);
		if(userVO == null) {
//			System.out.println("success " + userVO);
			return "success";
		}
//		System.out.println("fail " + userVO);
		return "fail";
	}
	
	@RequestMapping(value ="/checkEmail", method = RequestMethod.POST)
	@ResponseBody
	public String checkEmail(String email) throws Exception {
		
//		System.out.println("email " + email);
		CustomUserDetails userVO = service.getUser_email(email);
//		System.out.println("userVO " + userVO);
		if(userVO == null) {
//			System.out.println("success " + userVO);
			return "success";
		}
//		System.out.println("fail " + userVO);
		return "fail";
	}
	
	@RequestMapping(value="/findPassword_view", method = RequestMethod.GET)
	public void findPasswordGET() throws Exception {
		
	}
	
	@RequestMapping(value="/findPassword", method = RequestMethod.POST)
	public String findPasswordPOST(@ModelAttribute("customUserDetails") CustomUserDetails customUserDetails
			, RedirectAttributes redirectattr,Errors errors,BindingResult result) throws Exception {
		new FindPassValidator().validate(customUserDetails, result);
		
		if(errors.hasErrors()) {
            return "/user/findPassword_view";
		}
		
		try {
			CustomUserDetails user = service.getUser_email(customUserDetails.getEmail());
            redirectattr.addFlashAttribute("userVO",user); 
            return "redirect:sendpass";
        }catch(Exception e)
        {
            errors.reject("EmailNotExist");
//            System.out.println("EmailNotExist " + errors.getFieldError());
//            System.out.println("EmailNotExist " + errors.getGlobalError());
            return "/user/findPassword_view"; 
        }
	}
	
    @RequestMapping(value = "/sendpass")
    public String mailSending(Model model,HttpServletResponse response) throws Exception {
      Map<String, Object> map = model.asMap();
      CustomUserDetails userDto = (CustomUserDetails)map.get("userVO");
      
      String pw ="";
      
		for (int i = 0; i < 12; i++) {
			pw += (char) ((Math.random() * 26) + 97);
		}
		CustomUserDetails userVO = new CustomUserDetails();
		userVO.setUsername(userDto.getUsername());
		userVO.setPassword(pw);
		service.setPw(userVO);
		
//		System.out.println(pw);
//      System.out.println(userDto.getEmail());
//      System.out.println(userDto.getUsername());
      
      String setfrom = "springteam11@gmail.com";         
      String tomail  = userDto.getEmail();     // 받는 사람 이메일
      String title   = userDto.getUsername() + "님의 아이디와 임시비밀번호 입니다.";      // 제목
      String content = userDto.getUsername() + "님의 아이디는 " 
                          + userDto.getUsername()
                          + " 임시비밀번호는 "
                          + pw
                          + " 입니다.";    // 내용
     
      try {
        MimeMessage message = mailSender.createMimeMessage();
        MimeMessageHelper messageHelper  = new MimeMessageHelper(message, true, "UTF-8"); //두번째 인자 true여야 파일첨부 가능.
   
        messageHelper.setFrom(setfrom);  // 보내는사람 생략하거나 하면 정상작동을 안함
        messageHelper.setTo(tomail);     // 받는사람 이메일
        messageHelper.setSubject(title); // 메일제목은 생략이 가능하다
        messageHelper.setText(content);  // 메일 내용
       
        mailSender.send(message);
        
			
			 response.setContentType("text/html; charset=UTF-8"); PrintWriter out =
			 response.getWriter();
			 out.println("<script>alert('성공적으로 메일을 발송했습니다.');history.go(-1);</script>");
			 out.flush();
			 


      } catch(Exception e){
//        System.out.println(e);
      }
     
      return "/user/findPassword_view";
    }
	
}















