package com.spring.controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.domain.BoardVO;
import com.spring.domain.PageMaker;
import com.spring.domain.SearchCriteria;
import com.spring.service.BoardService;

@Controller
@RequestMapping("/sboard/*")
public class SearchBoardController {
	
	private static final Logger logger = LoggerFactory.getLogger(SearchBoardController.class);
	
	@Inject
	private BoardService service;
	
	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public void registerGET() throws Exception {

	  logger.info("register get ...........");
	}
	
	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String registerPOST(BoardVO board, RedirectAttributes rttr) throws Exception {
		
	 logger.info("insertBoard post ...........");
	 logger.info(board.toString());
	  
	 service.insertBoard(board);
	  
	 rttr.addFlashAttribute("result", "success");
	 
	 return "redirect:/sboard/list";
	}
	
//	@RequestMapping(value="/listAll", method=RequestMethod.GET)
//	public void listAll(Model model)throws Exception {
//		
//		logger.info("show all list............");
//		model.addAttribute("list", service.listAllBoard());
//	}
	
	@RequestMapping(value = "/readPage", method = RequestMethod.GET)
	public String read(@RequestParam("b_id") int b_id, @ModelAttribute("cri") SearchCriteria cri, Model model)throws Exception {
	
	  model.addAttribute(service.readBoard(b_id));
	  
	  return "/sboard/readPage";
	}
	
	@RequestMapping(value = "/readPage_main", method = RequestMethod.GET)
	public String read(@RequestParam("b_id") int b_id, Model model)throws Exception {
	
	  model.addAttribute(service.readBoard(b_id));
	  
	  return "/sboard/readPage";
	}
	
//
//	@RequestMapping(value = "/remove", method = RequestMethod.POST)
//	public String remove(@RequestParam("b_id") int b_id, RedirectAttributes rttr) throws Exception {
//	
//	  service.deleteBoard(b_id);
//	
//	  rttr.addFlashAttribute("msg", "SUCCESS");
//	
//	  return "redirect:/board/listAll";
//	}
//	
	@RequestMapping(value = "/removePage", method = RequestMethod.POST)
	public String remove(@RequestParam("b_id") int b_id, SearchCriteria cri, RedirectAttributes rttr) throws Exception {
	
	  service.deleteBoard(b_id);
	
	  rttr.addAttribute("page", cri.getPage());
	  rttr.addAttribute("perPageNum", cri.getPerPageNum());
	  rttr.addAttribute("searchType", cri.getSearchType());
	  rttr.addAttribute("keyword", cri.getPerPageNum());
	  
	  rttr.addFlashAttribute("msg", "SUCCESS");
	
	  return "redirect:/sboard/list";
	}
//	
//	@RequestMapping(value = "/modify", method = RequestMethod.GET)
//	public void modifyGET(int b_id, Model model) throws Exception {
//
//	  model.addAttribute(service.readBoard(b_id));
//	}
//	
	@RequestMapping(value = "/modifyPage", method = RequestMethod.GET)
	public void modifyPagingGET(int b_id, @ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception {

	  model.addAttribute(service.readBoard(b_id));
	}
//
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
//	
	@RequestMapping(value = "/modifyPage", method = RequestMethod.POST)
	public String modifyPagingPOST(BoardVO board, SearchCriteria cri, RedirectAttributes rttr) throws Exception {

	  logger.info("mod post............");
	  service.updateBoard(board);
	  
	  rttr.addAttribute("page", cri.getPage());
	  rttr.addAttribute("perPageNum", cri.getPerPageNum());
	  rttr.addAttribute("searchType", cri.getSearchType());
	  rttr.addAttribute("Keyword", cri.getKeyword());
	  
	  rttr.addFlashAttribute("msg", "SUCCESS");

	  return "redirect:/sboard/list";
	}
//	
//	@RequestMapping(value="/listCri", method = RequestMethod.GET)
//	public void listAll(Criteria cri, Model model)throws Exception {
//		
//		logger.info("show list Page with Criteria.................");
//		
//		model.addAttribute("list", service.listCriteria(cri));
//	}
	
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public void listPage(@ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception {
	  logger.info(cri.toString());

	  model.addAttribute("list", service.listSearchCriteria(cri));
	  PageMaker pageMaker = new PageMaker();
	  pageMaker.setCri(cri);
//	  pageMaker.setTotalCount(131);

	  pageMaker.setTotalCount(service.listSearchCount(cri));

	  model.addAttribute("pageMaker", pageMaker);
	}
	
//	@RequestMapping(value = "/readPage", method = RequestMethod.GET)
//	public void read(@RequestParam("b_id") int b_id, @ModelAttribute("cri") Criteria cri, Model model)throws Exception {
//	
//	  model.addAttribute(service.readBoard(b_id));
//	}
	
	
}











