package com.spring.controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.domain.MovieVO;
import com.spring.service.MovieService;

@Controller
@RequestMapping("/movie/*")
public class MovieController {
	
	private static final Logger logger = LoggerFactory.getLogger(MovieController.class);
	
	@Inject
	private MovieService service;
	
	@RequestMapping(value="/movieList", method=RequestMethod.GET)
	public void movieList(Model model) throws Exception {
		
		/* logger.info("MovieList/movieList"); */
		
		model.addAttribute("list",service.list());
	}
	
	@RequestMapping(value="/readMovie", method=RequestMethod.GET)
	public void readMovie(@RequestParam("m_id") int m_id, Model model) throws Exception {
		
//		logger.info("MovieList/readMovie");
		
		model.addAttribute(service.readMovie(m_id));
	}
	
	@RequestMapping(value="/registerMovie", method=RequestMethod.GET)
	public void registerMovieGET() {
		
//		logger.info("MovieList/registerMovie");
	}
	
	@RequestMapping(value="/registerMovie", method=RequestMethod.POST)
	public String registerMoviePOST(MovieVO movieVO) throws Exception {
		
//		logger.info("MovieList/registerMovie");
		
		service.registerMovie(movieVO);
		
		return "redirect:/movie/movieList";
	}	
	
	@RequestMapping(value="/modifyMovie", method=RequestMethod.GET)
	public void modifyMovieGet(@RequestParam("m_id") int m_id, Model model) throws Exception {
		
//		logger.info("MovieList/modifyMovie");
		
		model.addAttribute(service.readMovie(m_id));
	}
	
	@RequestMapping(value="/modifyMovie", method=RequestMethod.POST)
	public String modifyMoviePost(MovieVO movieVO) throws Exception {
		
//		logger.info("MovieList/modifyMovie");
		
		service.updateMovie(movieVO);
		
//		System.out.println(movieVO);
		
		return "redirect:/movie/movieList";
	}
	
	@RequestMapping(value="/removeMovie", method=RequestMethod.POST)
	public String removeMovie(@RequestParam("m_id") int m_id) throws Exception {
		
//		logger.info("MovieList/removeMovie");
		
		service.removeMovie(m_id);
		
		return "redirect:/movie/movieList";
	}
}
