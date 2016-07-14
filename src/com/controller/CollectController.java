package com.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.model.BookInfo;
import com.model.CollectInfo;
import com.service.CollectService;

@Controller
@RequestMapping("/collect")
public class CollectController {
	@Resource
	private CollectService collectService;

	public CollectService getCollectService() {
		return collectService;
	}

	public void setCollectService(CollectService collectService) {
		this.collectService = collectService;
	}
	@RequestMapping(value="selectCollect.do",method = RequestMethod.GET)
	public ModelAndView findByUseId(@RequestParam(value = "userId") String userId){
		ModelAndView mv = new ModelAndView();
		List<BookInfo>listBook=collectService.findCollectBookInfo(Integer.parseInt(userId));
		mv.addObject("listCollect", listBook);
		mv.setViewName("collection");
		return mv;
		
	}
	@RequestMapping(value="selectCollect3.do",method = RequestMethod.GET)
	public ModelAndView findByUseIdSec(@RequestParam(value = "userId") String userId){
		ModelAndView mv = new ModelAndView();
		List<BookInfo>listBook=collectService.findCollectBookInfo(Integer.parseInt(userId));
		mv.addObject("listCollect", listBook);
		mv.setViewName("collect");
		return mv;
		
	}
	@RequestMapping(value="selectCollect2.do",method = RequestMethod.GET)
	public ModelAndView findByUseId2(@RequestParam(value = "userId") String userId){
		ModelAndView mv = new ModelAndView();
		 List<BookInfo>listBook=collectService.findCollectBookInfo(Integer.parseInt(userId));
		mv.addObject("listCollect", listBook);
		mv.setViewName("collection2");
		return mv;
		
	}
	@RequestMapping(value="deleteCollect.do",method = RequestMethod.GET)
	public ModelAndView deleteCollectById(
			@RequestParam(value="userId")String userId,
			@RequestParam(value="bookId")String bookId){
		ModelAndView mv = new ModelAndView();
		collectService.deleteBookInCollect(Integer.valueOf(userId), Integer.valueOf(bookId));
		mv.setViewName("redirect:/collect/selectCollect.do?userId="+userId);
		return mv;
		
	}
	@RequestMapping(value="saveCollect.do",method = RequestMethod.GET)
	public ModelAndView  saveInCollect(
			@RequestParam(value="userId")String userId,
			@RequestParam(value="bookId")String bookId,ModelMap model){
		ModelAndView mv = new ModelAndView();
		String tip=null;
		if(collectService.isBookHasCollected(Integer.valueOf(userId), Integer.valueOf(bookId))){
		tip="你已经收藏过该书本了，亲";
		model.addAttribute("tip", tip);
		}else{
		CollectInfo collectInfo=new CollectInfo();
		collectInfo.setBookId(Integer.valueOf(bookId));
		collectInfo.setUserId(Integer.valueOf(userId));
		collectService.addBookToCollect(collectInfo);
		tip="收藏成功";
		}
        mv.setViewName("redirect:/collect/selectCollect2.do?userId="+userId);
		return mv;
	}
	
	

}
