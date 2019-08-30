package com.spring.controller;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.spring.domain.CustomUserDetails;

public class FindPassValidator implements Validator {
	
	private Pattern pattern;
    private Matcher matcher;
    
    String regexp = "^[_a-z0-9-]+(.[_a-z0-9-]+)*@(?:\\w+\\.)+\\w+$"; //이메일 정규 표현식
    
    public FindPassValidator() {
        pattern = pattern.compile(regexp);
    }
    @Override
    public boolean supports(Class<?> clazz) {
        return CustomUserDetails.class.isAssignableFrom(clazz);
    }

    @Override
    public void validate(Object target, Errors errors) {
    	CustomUserDetails customUserDetails = (CustomUserDetails)target;
//    	System.out.println("customUserDetails " + customUserDetails);
        //이메일이 올바른 형식인지 검사
        matcher = pattern.matcher(customUserDetails.getEmail());
        if(customUserDetails.getEmail() == null || customUserDetails.getEmail().trim().isEmpty()) {
//        	System.out.println("emailRequired");
            errors.rejectValue("email", "emailRequired");
        }else if (!matcher.matches()) {//사용자가 입력한 이메일이 정규표현식에 매치 되지않는다면
//        	System.out.println("bad");
            errors.rejectValue("email", "bad");
        }
    }
}
