package com.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONArray;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.model.BookInfo;
import com.model.ReviewInfo;
import com.model.UserInfo;
import com.service.ManageBookService;
import com.service.ReviewService;

@Controller
@SessionAttributes({ "deleteBookResult" })
public class ManageBookController {
	@Autowired
	private ManageBookService manageBookService;
	@Autowired
	private ReviewService reviewService;
	public ManageBookController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @return the showBookService
	 */
	public ManageBookService getShowBookService() {
		return manageBookService;
	}

	/**
	 * @param showBookService
	 *            the showBookService to set
	 */
	public void setShowBookService(ManageBookService showBookService) {
		this.manageBookService = showBookService;
	}

	/**
	 * 返回所有的书本信息 modified by gjb on 6.26
	 * 
	 * @return
	 */
	@RequestMapping(value = { "/index.do"}, method = RequestMethod.GET)
	public ModelAndView findAll() {
		ModelAndView mv = new ModelAndView();
		List<BookInfo> list = manageBookService.findAll();
		// JSONArray json=JSONArray.fromObject(list);
		// System.out.println("json: "+json);
		mv.addObject("data", list);
		mv.setViewName("/index");
		return mv;
	}

	/**
	 * 查找该书本的信息 modified by gjb on 6.26
	 * 
	 * @return
	 */
	@RequestMapping(value = "/find.do", method = RequestMethod.GET)
	public ModelAndView find(@RequestParam(value = "bookId") String bookId) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("single");
		if(bookId.equals("")){		
			return mv;
		}else{
			BookInfo book = manageBookService.find(bookId);
			mv.addObject("data", book);
		}
		
		// System.out.println("data: "+json.toString());
		List<ReviewInfo> review = reviewService.findByBookId(Integer
				.valueOf(bookId));
		List<Map<String, String>> result = new ArrayList<Map<String, String>>(
				review.size());
		for (ReviewInfo item : review) {
			Map<String, String> node = new HashMap<String, String>();
			Integer userId = item.getUserId();
			UserInfo user=reviewService.findReviewerByUserId(userId);
			if(user!=null){
			node.put("userName", 
					user.getUsername());
			node.put("reviewContent", item.getReviewContent());
			result.add(node);
			}
			
		}
		// JSONArray reviewJSON=JSONArray.fromObject(result);
		// System.out.println("reviewJSON: "+reviewJSON);
		mv.addObject("review", result);
		System.out.println("turn to single.------------------");
		return mv;
	}

	/**
	 * 删除对应的书本（供管理员操作） modified by gjb on 6.26
	 * 
	 * @return
	 */
	@RequestMapping(value = "/deleteBook.do", method = RequestMethod.GET)
	@ResponseBody
	public String deleteBook(@RequestParam(value = "bookId") String bookId,
			ModelMap model) {
		return manageBookService.delete(bookId);
	}

	/**
	 * 更新上传对应的书本（供管理员操作) whx
	 * 
	 * @return
	 */
	@RequestMapping(value = "/saveBook.do", method = RequestMethod.POST)
	public String saveBook(@RequestParam(value = "bookName") String bookName,
	/* @RequestParam(value = "bookUrl") String bookUrl, */
	@RequestParam(value = "file", required = false) MultipartFile file,
			HttpServletRequest request,
			@RequestParam(value = "bookPrice") String bookPrice,
			@RequestParam(value = "bookNumber") String bookNumber,
			@RequestParam(value = "firstType") String bookFirstType,
			@RequestParam(value = "secondType") String bookSecondType,
			ModelMap model) {
		System.out.println("bookName=" + bookName);
		System.out.println("bookPrice=" + bookPrice);
		System.out.println("bookNumber=" + bookNumber);
		System.out.println("bookFirstType=" + bookFirstType);
		System.out.println("bookSecondType=" + bookSecondType);
		if (manageBookService.isBookExistInDb(bookName)) {
			System.out.print("该商品已上传");
			model.put("tip", "该商品已上传");
		} else {
			System.out.println("开始");
			BookInfo bookInfo = new BookInfo();
			bookInfo.setBookName(bookName);
			bookInfo.setBookNumber(Integer.valueOf(bookNumber));
			bookInfo.setBookPrice(Double.valueOf(bookPrice));
			bookInfo.setBookFirstType(bookFirstType);
			bookInfo.setBookSecondType(bookSecondType);
			
			String path = request.getSession().getServletContext()
					.getRealPath("images");
			String fileName = file.getOriginalFilename();
			System.out.println(path);
			File targetFile = new File(path, fileName);
			if (!targetFile.exists()) {
				targetFile.mkdirs();
			}
			// 保存
			try {
				file.transferTo(targetFile);
			} catch (Exception e) {
				e.printStackTrace();
			}
			String bookUrl = request.getContextPath() + "/images/" + fileName;
			bookInfo.setBookUrl(bookUrl);
			manageBookService.saveBookInDb(bookInfo);
			model.addAttribute("fileUrl", request.getContextPath() + "/images/"
					+ fileName);
			System.out.print("图片路径" + request.getContextPath() + "/images/"
					+ fileName);
		}
		return "bookManager";
		/*
		 * ModelAndView mv=new ModelAndView(); BookInfo bookInfo=new BookInfo();
		 * bookInfo.setBookNumber(Integer.parseInt(bookNumber));
		 * bookInfo.setBookName(bookName);
		 * bookInfo.setBookPrice(Double.parseDouble(bookPrice));
		 * mv.setViewName("success"); return mv;
		 */
	}

	@RequestMapping(value = "/findLike.do", method = RequestMethod.POST)
	public ModelAndView findLike(
			@RequestParam(value = "bookName") String bookName,
			@RequestParam(value = "bookFirstType") String bookFirstType) {
		System.out.println("search books like: " + bookName);
		System.out.println("search type is  " + bookFirstType);
		ModelAndView mv = new ModelAndView();
		List<BookInfo> list = manageBookService.findLike(bookName,
				bookFirstType);
		System.out.println("result list size= " + list.size());
		mv.addObject("data", list);
		mv.setViewName("/search");
		return mv;
	}

	/**
	 * 找出所有一级分类 gjb
	 * 
	 * @return
	 */
	@RequestMapping(value = "/findBookFirstType.do", method = RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> findBookFirstType() {
		// JSONObject result=new JSONObject();
		List<String> resultList = manageBookService.findBookFirstType();
		// result.put("result", resultList);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("result", resultList);
		return map;
	}

	/**
	 * 以JSON格式返回商品管理页面的数据
	 * 
	 * @return
	 */
	@RequestMapping(value = "/bookManagerData.do", method = RequestMethod.GET)
	@ResponseBody
	public List<BookInfo> bookManagerGetData() {
		List<BookInfo> list = manageBookService.findAll();
		return list;
	}

	/**
	 * 跳转到商品管理页面 gjb
	 * 
	 * @return
	 */
	@RequestMapping(value = "/bookManager.do", method = RequestMethod.GET)
	public String bookManagerGetHTML() {
		return "/bookManager";
	}
	@RequestMapping(value = "/managerCenter.do", method = RequestMethod.GET)
	public String managerCenter(){
		return "/managerCenter";
	}
	@RequestMapping(value = "/sellQuery.do", method = RequestMethod.GET)
	public String sellQuery(){
		return "/sellQuery";
	}
	@RequestMapping(value = "/orderManager.do", method = RequestMethod.GET)
	public String orderManager(){
		return "/orderManager";
	}
	
	@RequestMapping(value = "/isManager.do", method = RequestMethod.GET)
	@ResponseBody
	public boolean isManager(@RequestParam(value = "username") String username){
		return username.equals("123");
	}
	@RequestMapping(value = "/update.do", method = RequestMethod.GET)
	@ResponseBody
	public String update(@RequestParam(value = "bookId") Integer bookId,
			@RequestParam(value = "bookNumber") Integer bookNumber,
			@RequestParam(value = "bookPrice") Double bookPrice){
		return manageBookService.update(bookId, bookNumber, bookPrice);
		
	}
	

}
