package com.spring.controller;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spring.domain.MovieVO;
import com.spring.domain.ReservationVO;
import com.spring.domain.ScheduleVO;
import com.spring.domain.ScreenVO;
import com.spring.domain.TheaterVO;
import com.spring.service.MovieService;
import com.spring.service.ReservationService;
import com.spring.service.ScheduleService;
import com.spring.service.ScreenService;
import com.spring.service.TheaterService;
import com.spring.service.UserService;

@Controller
@RequestMapping("/myPage/*")
public class MypageController {
	
	private static final Logger logger = LoggerFactory.getLogger(MypageController.class);
	
	@Inject
	private UserService userService;
	
	@Inject
	private ReservationService resService;
	
	@Inject
	private ScheduleService scheduleService;
	
	@Inject
	private MovieService movieService;
	
	@Inject
	private ScreenService screenService;
	
	@Inject
	private TheaterService theaterService;
	
	@RequestMapping(value="/myPage", method=RequestMethod.GET)
	public void myPage(HttpServletRequest request) throws Exception {
		
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		Object user = auth.getPrincipal();
		String username = (String)user;
		
		List<ReservationVO> resList = new ArrayList();
		
		resList = resService.getList_user(username);
		
		ScheduleVO scheduleVO = new ScheduleVO();
		MovieVO movieVO = new MovieVO();
		ScreenVO screenVO = new ScreenVO();
		TheaterVO theaterVO = new TheaterVO();
		
		List<ScheduleVO> scheduleList = new ArrayList<ScheduleVO>();
		List<MovieVO> movieList = new ArrayList<MovieVO>();
		List<ScreenVO> screenList = new ArrayList<ScreenVO>();
		List<TheaterVO> theaterList = new ArrayList<TheaterVO>();
		
		for(ReservationVO reservationVO : resList) {
			scheduleVO.setSch_id(reservationVO.getSch_id());
			scheduleVO = scheduleService.getOne(scheduleVO);
			System.out.println("scheduleVO : " + scheduleVO);
			scheduleList.add(scheduleVO);
			System.out.println(scheduleList);
			
			movieVO.setM_id(scheduleVO.getM_id());
			movieVO = movieService.readMovie(movieVO.getM_id());
			System.out.println("movieVO : " + movieVO);
			movieList.add(movieVO);
			System.out.println(movieList);
			
			screenVO.setScr_id(scheduleVO.getScr_id());
			screenVO = screenService.getScrOne(screenVO.getScr_id());
			System.out.println("screenVO : " + screenVO);
			screenList.add(screenVO);
			System.out.println(screenList);
			
			theaterVO.setT_id(scheduleVO.getT_id());
			theaterVO = theaterService.getTheater(theaterVO);
			System.out.println("theaterVO : " + theaterVO);
			theaterList.add(theaterVO);
			System.out.println(theaterList);
		}
		request.setAttribute("reservationList", resList);
		request.setAttribute("scheduleList", scheduleList);
		request.setAttribute("movieList", movieList);
		request.setAttribute("screenList", screenList);
		request.setAttribute("theaterList", theaterList);
	}
}
