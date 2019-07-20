package com.spring.controller;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.domain.TheaterVO;
import com.spring.service.TheaterService;

@Controller
@RequestMapping("/theater/*")
public class TheaterController {
	
	private static final Logger logger = LoggerFactory.getLogger(TheaterController.class);
	
	@Inject
	private TheaterService service;
	
	@RequestMapping(value = "/theaterList", method = RequestMethod.GET)
	public void theaterList(Model model) throws Exception {
		
		 logger.info("Welcome 극장리스트!");
		 
		 model.addAttribute("list",service.getTheaterList());
	}

	@RequestMapping(value = "/theaterOne", method = RequestMethod.GET)
	public void getTheater(Model model, TheaterVO vo) throws Exception {
		
		 logger.info("Welcome 극장상세!");
		 
		 model.addAttribute(service.getTheater(vo));
	}
	
	@RequestMapping(value = "/theaterList_ajax", method = RequestMethod.GET)
	@ResponseBody
	public List<TheaterVO> theaterList_ajax() throws Exception {
		
		 logger.info("극장리스트!");
		 
		 return service.getTheaterList();
	}
}
