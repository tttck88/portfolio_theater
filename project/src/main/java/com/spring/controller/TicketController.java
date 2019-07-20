package com.spring.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.domain.MovieVO;
import com.spring.domain.ReservationVO;
import com.spring.domain.ScheduleVO;
import com.spring.domain.ScreenVO;
import com.spring.domain.TheaterVO;
import com.spring.domain.UserVO;
import com.spring.service.MovieService;
import com.spring.service.ReservationService;
import com.spring.service.ScheduleService;
import com.spring.service.ScreenService;
import com.spring.service.TheaterService;
import com.spring.service.TicketService;
import com.spring.service.UserService;

@Controller
@RequestMapping("/ticket/*")
public class TicketController {

	private static final Logger logger = LoggerFactory.getLogger(TicketController.class);
	
	@Inject
	private MovieService movieService;
	
	@Inject
	private TicketService ticketService;
	
	@Inject
	private ScheduleService scheduleService;
	
	@Inject
	private ScreenService screenService;
	
	@Inject
	private TheaterService theaterService;

	@Inject
	private ReservationService reservationService;
	
	@Inject
	private UserService userService;
	
	//예매하기로 접근
	@RequestMapping(value="/ticket", method=RequestMethod.GET)
	public void movieList(Model model) throws Exception {
		
		logger.info("ticket/ticket");
		
		model.addAttribute("movieList",movieService.list());
	}
	//영화선택후 예매페이지 접근
	@RequestMapping(value="/ticketByMovie", method=RequestMethod.GET)
	public String movieList(Model model,  @ModelAttribute("m_id") int m_id) throws Exception {
		
		logger.info("ticket/ticket");
		
		model.addAttribute("movieList",movieService.list());
		
		return "/ticket/ticket";
	}
	
	@RequestMapping(value="/theater", method=RequestMethod.POST)
	@ResponseBody
	public List<TheaterVO> theaterList(MovieVO mvo) throws Exception {
		
		logger.info("ticket/theater");
//		System.out.println("=======1=========" + mvo);
//		System.out.println("======2==========" + scheduleService.list(mvo));scr_seat_tot
		
		List<ScheduleVO> scheduleList = scheduleService.list(mvo);
		List<TheaterVO> theaterList = new ArrayList();
		TheaterVO theaterVO = new TheaterVO();
		
		for(ScheduleVO scheduleVO : scheduleList) {
			
//			System.out.println("======3========극장" + scheduleVO.getT_id());
			theaterVO.setT_id(scheduleVO.getT_id());
//			theaterService.getTheater(theaterVO);
			System.out.println("========t_id에 따른 극장 이름===========" + theaterService.getTheater(theaterVO));
			theaterList.add(theaterService.getTheater(theaterVO));
		}
		System.out.println("======theaterList======" + theaterList);
		return theaterList;
	}

	@RequestMapping(value="/screen", method=RequestMethod.POST)
	@ResponseBody
	public List<ScreenVO> screenList(TheaterVO tvo) throws Exception {
		
		logger.info("ticket/screen");
		
		System.out.println("======screenList======" + screenService.getScrOne_m(tvo));
		
		return screenService.getScrOne_m(tvo);
	}
	
	@RequestMapping(value="/time", method=RequestMethod.POST)
	@ResponseBody
	public List<ScheduleVO> time(ScheduleVO svo) throws Exception {
		
		logger.info("ticket/time");
		
		List<ScheduleVO> schList = new ArrayList();
		
		for(ScheduleVO scheduleVO : scheduleService.getList(svo)) {
			
			schList.add(scheduleVO);
			
		}
		return schList;
	}
	
	@RequestMapping(value="/reservation", method=RequestMethod.POST)
	@ResponseBody
	public Map<String,Integer> reservation(ScheduleVO schVO) throws Exception {
		
		logger.info("ticket/reservation");
		
		Map<String,Integer> map = new HashMap();
		
		int i=0;
		System.out.println("======schVO======" +schVO);
		System.out.println("======schVO.getSch_id()======" + schVO.getSch_id());
		System.out.println("======reservationService.getList_sch(schVO.getSch_id())======" + reservationService.getList_sch(schVO.getSch_id()));
		for(ReservationVO reservationVO : reservationService.getList_sch(schVO.getSch_id())) {
			i++;
		}
		
		int tot = screenService.getScrOne(schVO.getScr_id()).getScr_seat_tot();
		System.out.println("======i======" + i);
		System.out.println("======tot======" + tot);
		map.put("i",i);
		map.put("tot",tot);
		return map;
	}
	
	@RequestMapping(value="/seat", method= RequestMethod.POST)
	public void seat(ScheduleVO schVO,ReservationVO rVO,Model model) throws Exception {
		System.out.println("======seatseatseatseatseatseat======");
		System.out.println(schVO);
		System.out.println(rVO);
		logger.info("ticket/seat");
		
		//예약한좌석조회
		List<ReservationVO> list = reservationService.getList_sch(schVO.getSch_id());
		//상영관
		
		Map<String,Object> map = new HashMap();
		map.put("scheduleVO",schVO);
		map.put("reservationList",reservationService.getList_sch(schVO.getSch_id()));
		map.put("screenVO",screenService.getScrOne(schVO.getScr_id()));
		map.put("r_date",rVO.getR_date());
		
		model.addAttribute("map",map);
	}
	@RequestMapping("/chosenSeat")
	@ResponseBody
	public String seat(HttpServletRequest request) {
		logger.info("ticket/chosenSeat");
		String seat = request.getParameter("rowCol");
		
		return seat;
	}
	
	@RequestMapping(value="/pay", method= RequestMethod.POST)
	public void pay(ScheduleVO schVO,ReservationVO reservationVO, 
			HttpServletRequest request, @RequestParam("check_seat") String rowCol
			,Model model,HttpSession session) throws Exception {
		logger.info("ticket/pay");
		
		System.out.println("======paypaypaypaypaypay======");
		
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		Object user = auth.getPrincipal();
		
		System.out.println("auth" + auth);
		System.out.println("user" + user);
		System.out.println(reservationVO);
		
		UserVO userVO = userService.getUser((String)user);
		
		String seats[] = request.getParameterValues("check_seat");
		System.out.println("seats  " + seats);
		
//		String scheduleVODate = schVO.getDate();
		
//		schVO = scheduleService.getSchOne(schVO);
//		
//		schVO.setDate(scheduleVODate);
//		
//		System.out.println("scheduleVO : " + scheduleVO);
		
		List<ReservationVO> reservationList = new ArrayList<>();
		for(String seat: seats) {
			ReservationVO rVO = new ReservationVO();
			rVO.setUsername((String)user);
			
			String splitSeat[] = seat.split("/");
			
			rVO.setSeat_row(splitSeat[0]);
			rVO.setSeat_col(splitSeat[1]);
			rVO.setSch_id(schVO.getSch_id());
			System.out.println("rVO.getR_date() : " + reservationVO.getR_date());
			rVO.setR_date(reservationVO.getR_date());
			System.out.println("rVO : " + rVO);
//			rVO.setPrice(Integer.parseInt(schVO.getPrice()));
			
			//String to Date
//			Date date = Date.valueOf(schVO.getDate());
//			reservationVO.setR_date(date);
			
//			System.out.println(reservationVO);
			reservationList.add(rVO);
		}
//		int totPrice = 0;
//		for (ReservationVO reservationOne : reservationList) {
//			totPrice += Integer.parseInt(reservationOne.getPrice());
//		}
//		session.setAttribute("totPrice", totPrice);
//		scheduleVO.getM_id();
		int totPrice = 0;
		totPrice = reservationList.size() * 6000;
		
		MovieVO movieVO = new MovieVO();
		System.out.println("scheduleVO.getM_id() : " + schVO.getM_id());
		movieVO.setM_id(schVO.getM_id());
		movieVO = movieService.readMovie(movieVO.getM_id());
		
//		scheduleVO.getScr_id();
		ScreenVO screenVO = new ScreenVO();
		screenVO.setScr_id(schVO.getScr_id());
		screenVO = screenService.getScrOne(screenVO.getScr_id());
		
//		theater
		TheaterVO theaterVO = new TheaterVO();
		theaterVO.setT_id(schVO.getT_id());
		theaterVO = theaterService.getTheater(theaterVO);
		
		request.setAttribute("movieVO", movieVO);
		request.setAttribute("screenVO", screenVO);
		request.setAttribute("theaterVO", theaterVO);
		request.setAttribute("time", schVO.getTime());
		request.setAttribute("scheduleVO", schVO);
		request.setAttribute("reservationList", reservationList);
		request.setAttribute("totPrice", totPrice);
		request.setAttribute("userVO", userVO);
		request.setAttribute("reservationVO", reservationVO);
		session.setAttribute("reservationList", reservationList);
		
		System.out.println(movieVO);
		System.out.println(screenVO);
		System.out.println(theaterVO);
		System.out.println(schVO);
		System.out.println(reservationList);
	}
	
	@RequestMapping("/pay")
	@ResponseBody
	public String pay() {
		logger.info("ticket/pay");
		
		return "success";
		/*
		 * imp_uid = extract_POST_value_from_url('imp_uid') //post ajax request로부터
		 * imp_uid확인
		 * 
		 * payment_result = rest_api_to_find_payment(imp_uid) //imp_uid로 아임포트로부터 결제정보 조회
		 * amount_to_be_paid = query_amount_to_be_paid(payment_result.merchant_uid)
		 * //결제되었어야 하는 금액 조회. 가맹점에서는 merchant_uid기준으로 관리
		 * 
		 * IF payment_result.status == 'paid' AND payment_result.amount ==
		 * amount_to_be_paid success_post_process(payment_result) //결제까지 성공적으로 완료 ELSE
		 * IF payment_result.status == 'ready' AND payment.pay_method == 'vbank'
		 * vbank_number_assigned(payment_result) //가상계좌 발급성공 ELSE
		 * fail_post_process(payment_result) //결제실패 처리
		 */		
	}
	
	@RequestMapping(value="/payOk", method= RequestMethod.POST)
	public String payOk(HttpSession session,Model model,MovieVO mVO,TheaterVO tVO,ScreenVO scrVO,ScheduleVO schVO) throws Exception {
		logger.info("ticket/payOk");
		System.out.println("reservationList =======" + session.getAttribute("reservationList"));
		List<ReservationVO> reservationList = (List<ReservationVO>) session.getAttribute("reservationList");
		
		for(ReservationVO reservationVO : reservationList) {
			reservationService.insertRes(reservationVO);
		}
		session.removeAttribute("reservationList");
		
		movieService.readMovie(mVO.getM_id());
		theaterService.list(tVO.getT_id());
		screenService.getScrOne(scrVO.getScr_id());
		scheduleService.getOne(schVO);
		
		System.out.println("mVO =======" + mVO);
		System.out.println("movieService =======" + movieService.readMovie(mVO.getM_id()));
		System.out.println("tVO =======" + tVO);
		System.out.println("theaterService =======" + theaterService.getTheater(tVO));
		System.out.println("screenService =======" + screenService.getScrOne(scrVO.getScr_id()));
		System.out.println("scheduleService =======" + scheduleService.getOne(schVO));
		
		model.addAttribute("reservationList", reservationList);
		model.addAttribute("movieVO", movieService.readMovie(mVO.getM_id()));
		model.addAttribute("theaterVO", theaterService.list(tVO.getT_id()));
		model.addAttribute("screenVO", screenService.getScrOne(scrVO.getScr_id()));
		model.addAttribute("scheduleVO", scheduleService.getOne(schVO));
		
		return "/myPage/myPage";
		/*
		 * imp_uid = extract_POST_value_from_url('imp_uid') //post ajax request로부터
		 * imp_uid확인
		 * 
		 * payment_result = rest_api_to_find_payment(imp_uid) //imp_uid로 아임포트로부터 결제정보 조회
		 * amount_to_be_paid = query_amount_to_be_paid(payment_result.merchant_uid)
		 * //결제되었어야 하는 금액 조회. 가맹점에서는 merchant_uid기준으로 관리
		 * 
		 * IF payment_result.status == 'paid' AND payment_result.amount ==
		 * amount_to_be_paid success_post_process(payment_result) //결제까지 성공적으로 완료 ELSE
		 * IF payment_result.status == 'ready' AND payment.pay_method == 'vbank'
		 * vbank_number_assigned(payment_result) //가상계좌 발급성공 ELSE
		 * fail_post_process(payment_result) //결제실패 처리
		 */		
	}
}





