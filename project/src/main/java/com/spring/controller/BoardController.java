package com.spring.controller;

import javax.inject.Inject;

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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.domain.BoardVO;
import com.spring.domain.Criteria;
import com.spring.domain.CustomUserDetails;
import com.spring.domain.PageMaker;
import com.spring.service.BoardService;

@Controller
@RequestMapping("/board/*")
public class BoardController {
	
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	@Inject
	private BoardService service;
	
	@RequestMapping(value = "/top", method = RequestMethod.GET)
	public String top() throws Exception {
		return "top";
	}
	
	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public void registerGET(BoardVO board, Model model) throws Exception {

//	  logger.info("register get ...........");
	}
	
	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String registerPOST(BoardVO board, RedirectAttributes rttr) throws Exception {
		
//	 logger.info("insertBoard post ...........");
//	 logger.info(board.toString());
	 
	Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	CustomUserDetails user = (CustomUserDetails) auth.getPrincipal();
	board.setId(user.getUsername());
	
//	System.out.println("board " +board);
	  
	 service.insertBoard(board);
	  
	 rttr.addFlashAttribute("result", "success");
	 
	 return "redirect:/board/listAll";
	}
	
	@RequestMapping(value="/listAll", method=RequestMethod.GET)
	public void listAll(Model model)throws Exception {
		
//		logger.info("show all list............");
		model.addAttribute("list", service.listAllBoard());
	}
	
	@RequestMapping(value = "/read", method = RequestMethod.GET)
	public void read(@RequestParam("b_id") int b_id, Model model)throws Exception {
	
	  model.addAttribute(service.readBoard(b_id));
	}

//	@RequestMapping(value = "/remove", method = RequestMethod.POST)
//	public String remove(@RequestParam("b_id") int b_id, RedirectAttributes rttr) throws Exception {
//	
//	  service.deleteBoard(b_id);
//	
//	  rttr.addFlashAttribute("msg", "SUCCESS");
//	
//	  return "redirect:/board/listAll";
//	}
	
	@RequestMapping(value = "/removePage", method = RequestMethod.POST)
	public String remove(@RequestParam("b_id") int b_id, Criteria cri, RedirectAttributes rttr) throws Exception {
	
	  service.deleteBoard(b_id);
	
	  rttr.addAttribute("page", cri.getPage());
	  rttr.addAttribute("perPageNum", cri.getPerPageNum());
	  rttr.addFlashAttribute("msg", "SUCCESS");
	
	  return "redirect:/board/listPage";
	}
	
//	@RequestMapping(value = "/modify", method = RequestMethod.GET)
//	public void modifyGET(int b_id, Model model) throws Exception {
//
//	  model.addAttribute(service.readBoard(b_id));
//	}
	
	@RequestMapping(value = "/modifyPage", method = RequestMethod.GET)
	public void modifyPagingGET(@RequestParam("b_id") int b_id, @ModelAttribute("cri") Criteria cri, Model model) throws Exception {

	  model.addAttribute(service.readBoard(b_id));
	}

//	@RequestMapping(value = "/modify", method = RequestMethod.POST)
//	public String modifyPOST(BoardVO board, RedirectAttributes rttr) throws Exception {
//
//	  logger.info("mod post............");
//
//	  service.updateBoard(board);
//	  rttr.addFlashAttribute("msg", "SUCCESS");
//
//	  return "redirect:/board/listAll";
//	}
	
	@RequestMapping(value = "/modifyPage", method = RequestMethod.POST)
	public String modifyPagingPOST(BoardVO board, Criteria cri, RedirectAttributes rttr) throws Exception {

//	  logger.info("mod post............");

	  service.updateBoard(board);
	  
	  rttr.addAttribute("page", cri.getPage());
	  rttr.addAttribute("perPageNum", cri.getPerPageNum());
	  rttr.addFlashAttribute("msg", "SUCCESS");

	  return "redirect:/board/listAll";
	}
	
	@RequestMapping(value="/listCri", method = RequestMethod.GET)
	public void listAll(Criteria cri, Model model)throws Exception {
		
//		logger.info("show list Page with Criteria.................");
		
		model.addAttribute("list", service.listCriteria(cri));
	}
	
	@RequestMapping(value = "/listPage", method = RequestMethod.GET)
	public void listPage(@ModelAttribute("cri") Criteria cri, Model model) throws Exception {

//	  logger.info(cri.toString());

	  model.addAttribute("list", service.listCriteria(cri));
	  PageMaker pageMaker = new PageMaker();
	  pageMaker.setCri(cri);
//	  pageMaker.setTotalCount(131);

	  pageMaker.setTotalCount(service.listCountCriteria(cri));

	  model.addAttribute("pageMaker", pageMaker);
	}
	
	@RequestMapping(value = "/readPage", method = RequestMethod.GET)
	public void read(@RequestParam("b_id") int b_id, @ModelAttribute("cri") Criteria cri, Model model)throws Exception {
	
	  model.addAttribute(service.readBoard(b_id));
	}
}











