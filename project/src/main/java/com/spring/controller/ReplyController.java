package com.spring.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.spring.domain.Criteria;
import com.spring.domain.PageMaker;
import com.spring.domain.ReplyVO;
import com.spring.service.ReplyService;

@RestController
@RequestMapping("/replies")
public class ReplyController {
	
	@Inject
	private ReplyService service;
	
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
	
	@RequestMapping(value = "/all/{b_id}", method = RequestMethod.GET)
	public ResponseEntity<List<ReplyVO>> list(@PathVariable("b_id") Integer b_id) {
		
		ResponseEntity<List<ReplyVO>> entity = null;
		try {
			entity = new ResponseEntity<>(service.listReply(b_id), HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
			
		}
		return entity;
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
			entity = new ResponseEntity<String>(e.getMessage(),HttpStatus.BAD_REQUEST);
			
		}
		return entity;
	}
	
	@RequestMapping(value = "/{r_id}", method = { RequestMethod.DELETE })
	public ResponseEntity<String> remove(@PathVariable("r_id") Integer r_id) {
		
		ResponseEntity<String> entity = null;
		try {
			service.removeReply(r_id);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(e.getMessage(),HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
  @RequestMapping(value = "/{b_id}/{page}", method = RequestMethod.GET)
  public ResponseEntity<Map<String, Object>> listPage(
      @PathVariable("b_id") Integer b_id,
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
