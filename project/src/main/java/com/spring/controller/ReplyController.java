package com.spring.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.spring.domain.Criteria;
import com.spring.domain.PageMaker;
import com.spring.domain.ReplyVO;
import com.spring.service.ReplyService;

@RestController
@RequestMapping("/replies")
public class ReplyController {

	private static final Logger logger = LoggerFactory.getLogger(SearchBoardController.class);

	@Inject
	private ReplyService service;

	@RequestMapping(value = "replyAdd", method = RequestMethod.POST)
	@ResponseBody
	public ReplyVO replyAdd(int r_id) throws Exception {
//		System.out.println("controller1" + r_id);
		ReplyVO replyVO = service.selectOne(r_id);
//		System.out.println("controller" + service.selectOne(r_id));
		return replyVO;

	}

	@RequestMapping(value = "", method = RequestMethod.POST)
	public ResponseEntity<String> register(@RequestBody ReplyVO vo) {
		ResponseEntity<String> entity = null;
		try {
			service.addReply(vo);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);

		}
		return entity;
	}

	@RequestMapping(value = "replyRegister", method = RequestMethod.POST)
	public ResponseEntity<String> replyRegister(@RequestBody ReplyVO vo) {
		ResponseEntity<String> entity = null;
//		System.out.println("con " + vo);
		try {
			service.addReplyReply(vo);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);

		}
		return entity;
	}

	@RequestMapping(value = "/all/{b_id}", method = RequestMethod.GET)
	public ResponseEntity<List<ReplyVO>> list(@PathVariable("b_id") Integer b_id) {

		ResponseEntity<List<ReplyVO>> entity = null;
		try {
			entity = new ResponseEntity<>(service.listReply(b_id), HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
//		System.out.println("reply " + entity);
		return entity;
	}

	/*
	 * @RequestMapping(value = "/allReply/{originid}", method = RequestMethod.GET)
	 * public ResponseEntity<List<ReplyVO>> listReply(@PathVariable("originid")
	 * Integer originid) {
	 * 
	 * ResponseEntity<List<ReplyVO>> entity = null; try { entity = new
	 * ResponseEntity<>(service.listReplyReply(originid), HttpStatus.OK); } catch
	 * (Exception e) { e.printStackTrace(); entity = new
	 * ResponseEntity<>(HttpStatus.BAD_REQUEST); } System.out.println("reply "
	 * +entity); return entity; }
	 */

	@RequestMapping(value = "/allReply", method = RequestMethod.POST)
	@ResponseBody
	public List<ReplyVO> listReply(Integer originId) throws Exception {
//		System.out.println("con " + originId);
		return service.listReplyReply(originId);
	}

	@RequestMapping(value = "/{r_id}", method = { RequestMethod.PUT, RequestMethod.PATCH })
	public ResponseEntity<String> update(@PathVariable("r_id") Integer r_id, @RequestBody ReplyVO vo) {

		ResponseEntity<String> entity = null;
		try {
			vo.setR_id(r_id);
			service.modifyReply(vo);

			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);

		}
		return entity;
	}

	
	 @RequestMapping(value = "/{r_id}", method = { RequestMethod.DELETE }) public ResponseEntity<String> remove(@PathVariable("r_id") Integer r_id) {
//	 logger.info("/remove DELETE ...........");
	  
	 ResponseEntity<String> entity = null; 
	 try { service.removeReply(r_id); entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK); } 
	 catch (Exception e)
	 { e.printStackTrace(); entity = new ResponseEntity<>(e.getMessage(),HttpStatus.BAD_REQUEST); } return entity; }
	 

	@RequestMapping(value = "/{b_id}/{page}", method = RequestMethod.GET)
	public ResponseEntity<Map<String, Object>> listPage(@PathVariable("b_id") Integer b_id,
			@PathVariable("page") Integer page) {

		ResponseEntity<Map<String, Object>> entity = null;

		try {
			Criteria cri = new Criteria();
			cri.setPage(page);

			PageMaker pageMaker = new PageMaker();
			pageMaker.setCri(cri);

			Map<String, Object> map = new HashMap<String, Object>();
			List<ReplyVO> list = service.listReplyPage(b_id, cri);

			map.put("list", list);

			int replyCount = service.count(b_id);
			pageMaker.setTotalCount(replyCount);

			map.put("pageMaker", pageMaker);

			entity = new ResponseEntity<Map<String, Object>>(map, HttpStatus.OK);

		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<Map<String, Object>>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}

}
