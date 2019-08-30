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
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.domain.CustomUserDetails;
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
	public void myPage(HttpServletRequest request,Model model) throws Exception {
		
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
//		System.out.println("-----------auth -----" + auth.getName());
		String username = auth.getName();
		
		List<ReservationVO> reservationList = new ArrayList();
		
//		System.out.println("username " +username);
//		System.out.println("username " +username);
		
		reservationList = resService.getList_user_row(username);
		
//		System.out.println("reservationListreservationList " + reservationList);
		
		ScheduleVO scheduleVO = new ScheduleVO();
		MovieVO movieVO = new MovieVO();
		ScreenVO screenVO = new ScreenVO();
		TheaterVO theaterVO = new TheaterVO();
		
		List<ScheduleVO> scheduleList = new ArrayList<ScheduleVO>();
		List<MovieVO> movieList = new ArrayList<MovieVO>();
		List<ScreenVO> screenList = new ArrayList<ScreenVO>();
		List<TheaterVO> theaterList = new ArrayList<TheaterVO>();
		List<ReservationVO> resList = new ArrayList();
		
//		System.out.println("reservationList " + reservationList);
		
		for(ReservationVO reservationVO : reservationList) {
			scheduleVO.setSch_id(reservationVO.getSch_id());
			scheduleVO = scheduleService.getOne(scheduleVO);
//			System.out.println("scheduleVO : " + scheduleVO);
			scheduleList.add(scheduleVO);
//			System.out.println(scheduleList);
			
			movieVO = movieService.readMovie(scheduleVO.getM_id());
//			System.out.println("movieVO : " + movieVO);
			movieList.add(movieVO);
//			System.out.println(movieList);
			
			screenVO = screenService.getScrOne(scheduleVO.getScr_id());
//			System.out.println("screenVO : " + screenVO);
			screenList.add(screenVO);
			System.out.println(screenList);
			
			theaterVO.setT_id(scheduleVO.getT_id());
			theaterVO = theaterService.getTheater(theaterVO);
//			System.out.println("theaterVO : " + theaterVO);
			theaterList.add(theaterVO);
//			System.out.println(theaterList);
			
			/*
			 * resList = resService.getList_seat(reservationVO.getRow_num());
			 * System.out.println("resListresList " + resList); for (ReservationVO resVO :
			 * resList) { reservationVO.setSeat_row(resVO.getSeat_row());
			 * reservationVO.setSeat_col(resVO.getSeat_col()); }
			 * System.out.println("reservationVO " + reservationVO);
			 */
		}
		
		request.setAttribute("reservationList", reservationList);
		request.setAttribute("scheduleList", scheduleList);
		request.setAttribute("movieList", movieList);
		request.setAttribute("screenList", screenList);
		request.setAttribute("theaterList", theaterList);
	}
	
	@RequestMapping(value="/seat", method=RequestMethod.POST)
	@ResponseBody
	public List<ReservationVO> seat(int row_num) throws Exception {
		
		List<ReservationVO> reservationList = new ArrayList();
		
		reservationList = resService.getList_seat(row_num);
		
//		System.out.println("reservationList " + reservationList);
		
		return reservationList;
	}
	
	@RequestMapping(value="/deleteRes", method=RequestMethod.GET)
	public String deleteRes(int row_num) throws Exception {
		resService.deleteRes(row_num);
		return "redirect:/myPage/myPage";
	}
}




