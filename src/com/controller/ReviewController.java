package com.controller;
import java.io.UnsupportedEncodingException;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import net.sf.json.JSONArray;

import org.springframework.ui.ModelMap;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.model.BookInfo;
import com.model.ReviewInfo;
import com.service.OrderInfoService;
import com.service.ReviewService;

@Controller
@RequestMapping("/review")
@SessionAttributes({"username"})
public class ReviewController {
	@Resource
	private ReviewService reviewService;
	@Resource
	private OrderInfoService orderInfoService;
	public ReviewController() {
		super();
	}
	public ReviewService getReviewService() {
		return reviewService;
	}
	public void setReviewService(ReviewService reviewService) {
		this.reviewService = reviewService;
	}
	@RequestMapping(value = "/selectcomment.do", method = RequestMethod.GET)
	public ModelAndView findByUserName(
			@RequestParam(value = "username") String username,ModelMap map){
		System.out.println("username******="+username);
		ModelAndView mv = new ModelAndView();
		List<ReviewInfo>listComment=reviewService.findByUserName(username);
		List<BookInfo>listBook=reviewService.findBookName(listComment);
		/*JSONArray json=JSONArray.fromObject(listComment);*/

		mv.addObject("comment",listComment);
		mv.addObject("book",listBook);
		mv.setViewName("/review");
		return mv;	
	}
	@RequestMapping(value ="/orderToComment.do", method = RequestMethod.GET)
	public ModelAndView findByBookId(
			@RequestParam(value = "bookId") String bookId,
			@RequestParam(value="userId")String userId,
			@RequestParam(value="bookName")String bookName,
			@RequestParam(value="username")String username,
			@RequestParam(value="id")String id) throws Exception{
		ModelAndView mv=new ModelAndView();
		mv.addObject("bookId", bookId);
		mv.addObject("userId", userId);
		System.out.println("bookName11="+bookName);
        bookName =new String(bookName.getBytes("iso-8859-1"),"utf-8");
        mv.addObject("bookName",bookName);
        username=new String(username.getBytes("iso-8859-1"),"utf-8");
        mv.addObject("username",username);
		System.out.println("bookName="+bookName);
		mv.addObject("id", id);
		mv.setViewName("/reviewWrite");
		return mv;	
	}
	@RequestMapping(value = "/insertcomment.do", method = RequestMethod.POST)
	public ModelAndView saveReviewInfoInDB(
			@RequestParam(value = "userId") String userId,
			@RequestParam(value = "bookId") String bookId,
			@RequestParam(value = "reviewContent") String reviewContent,
			@RequestParam(value = "username") String username,
			@RequestParam(value = "id") String id) throws Exception{
		ModelAndView mv = new ModelAndView();
		System.out.println("reviewContent="+reviewContent);
		ReviewInfo reviewInfo=new ReviewInfo();
		Date date = new Date(); 
		DateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String dateStr = sdf.format(date); 
		reviewInfo.setPubTime( Timestamp.valueOf(dateStr));
		reviewInfo.setUserId(Integer.parseInt(userId));
		reviewInfo.setBookId(Integer.parseInt(bookId));
//		reviewContent=new String(reviewContent.getBytes("iso-8859-1"),"utf-8");
		reviewInfo.setReviewContent(reviewContent);
		reviewService.saveReviewInfoInDB(reviewInfo);
		orderInfoService.comment(Integer.valueOf(id));
		mv.setViewName("redirect:/review/selectcomment.do?");
		return mv;	
	}
	@RequestMapping(value = "/deletecomment.do", method = RequestMethod.GET)
	public ModelAndView deleteComment(
			@RequestParam(value = "id") String id,
			@RequestParam(value="username")String username){
		System.out.print("username%%%"+username);
		ModelAndView mv = new ModelAndView();
		reviewService.deleteReviewInfoInById(Integer.parseInt(id));
		mv.setViewName("redirect:/review/selectcomment.do?");
		return mv;	
	}	
}
