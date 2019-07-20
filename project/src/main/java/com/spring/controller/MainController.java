package com.spring.controller;


import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spring.domain.BoardVO;
import com.spring.domain.MovieVO;
import com.spring.domain.TheaterVO;
import com.spring.service.BoardService;
import com.spring.service.MovieService;
import com.spring.service.TheaterService;

@Controller
@RequestMapping("/main/*")
public class MainController {
	
	private static final Logger logger = LoggerFactory.getLogger(MainController.class);
	
	@Inject
	private BoardService boardService;
	
	@Inject
	private MovieService movieService;
	
	@Inject
	private TheaterService theaterService;
	
	@RequestMapping(value = "main", method = RequestMethod.GET)
	public void main(Model model) throws Exception {
		 logger.info("Welcome 메인!");
		 
		
		List<BoardVO> boardList = boardService.listAllBoard(); boardList =
		boardList.subList(0, 7); System.out.println("boardList = " + boardList);
		model.addAttribute("boardList",boardList);
		
		 
		 List<MovieVO> movieList = movieService.list();
		 movieList = movieList.subList(0,3);
		 System.out.println(movieList);
		 model.addAttribute("movieList",movieList);
		 
		 List<TheaterVO> theaterList = theaterService.getTheaterList();
		 theaterList = theaterList.subList(0,3);
		 System.out.println(theaterList);
		 model.addAttribute("theaterList",theaterList);
	}
}
