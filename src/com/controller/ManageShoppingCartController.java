package com.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.model.BookInfo;
import com.model.ShoppingCart;
import com.service.ManageBookService;
import com.service.ManageShoppingCartService;

@Controller
@RequestMapping("/shoppingCart")
@SessionAttributes({ "addToShoppingCartResult,deleteFromShoppingCartResult" })
public class ManageShoppingCartController {
	@Resource
	private ManageShoppingCartService manageShoppingCartService;

	public ManageShoppingCartController() {
		super();
		// TODO Auto-generated constructor stub
	}

	public ManageShoppingCartController(
			ManageShoppingCartService manageShoppingCartService) {
		super();
		this.manageShoppingCartService = manageShoppingCartService;
	}

	/**
	 * @return the manageShoppingCartService
	 */
	public ManageShoppingCartService getManageShoppingCartService() {
		return manageShoppingCartService;
	}

	/**
	 * @param manageShoppingCartService
	 *            the manageShoppingCartService to set
	 */
	public void setManageShoppingCartService(
			ManageShoppingCartService manageShoppingCartService) {
		this.manageShoppingCartService = manageShoppingCartService;
	}

	/**
	 * ͨ通过用户的ID找出该用户购物车的记录 modified by gjb on 7.4
	 * 
	 * @return
	 */
	@RequestMapping(value = "/find.do", method = RequestMethod.GET)
	@ResponseBody
	public List<Map<String, Object>>/* ModelAndView */find(
			@RequestParam(value = "userId") String userId) {
		if (userId.equals("")) {
			return null;
		}
		List<ShoppingCart> cartList = manageShoppingCartService.find(userId);
		List<BookInfo> booksList = manageShoppingCartService
				.findBookInCart(cartList);
		// JSONArray shoppingCart=toJSON(cartList);
		// System.out.println("shoppingCart: "+shoppingCart);
		List<Map<String, Object>> result = new ArrayList<Map<String, Object>>(
				cartList.size());

		for (int i = 0; i < cartList.size(); i++) {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("bookId", cartList.get(i).getBookId());
			map.put("number", cartList.get(i).getNumber());
			map.put("bookName", booksList.get(i).getBookName());
			map.put("bookPrice", booksList.get(i).getBookPrice());
			map.put("bookNumber", booksList.get(i).getBookNumber());
			result.add(map);
		}
		return result;
		// return mv;
	}

	/**
	 * 将商品添加到购物车 modified by gjb on 6.26
	 * 
	 * @return
	 */
	@RequestMapping(value = "/addToShoppingCart.do", method = RequestMethod.GET)
	public ModelAndView addToShoppingCart(
			@RequestParam(value = "userId") String userId,
			@RequestParam(value = "bookId") String bookId,
			@RequestParam(value = "number") String number, ModelMap model) {
		if (userId.equals("") || bookId.equals("")) {
			return new ModelAndView("index");
		}
		String result = manageShoppingCartService.add(userId, bookId, number);
		System.out.println(result);
		model.addAttribute("addToShoppingCartResult", result);
		ModelAndView mv = new ModelAndView(
				"redirect:/shoppingCart/findHTML.do?userId=" + userId, model);
		// mv.setViewName("/checkout");
		return mv;
	}

	/**
	 * 从购物车中移除 modified by gjb on 6.26
	 * 
	 * @return
	 */
	@RequestMapping(value = "/deleteFromShoppingCart.do", method = RequestMethod.GET)
	@ResponseBody
	public Map<String, String> deleteFromShoppingCart(
			@RequestParam(value = "userId") String userId,
			@RequestParam(value = "bookId") String bookId) {
		Map<String, String> result = new HashMap<String, String>();
		if (userId.equals("") || bookId.equals("")) {
			return result;
		}
		
		result.put("success", "true");
		result.put("deleteFromShoppingCartResult",
				manageShoppingCartService.delete(userId, bookId));
		return result;
	}

	/**
	 * 跳转到没有数据的购物车页面 gjb
	 * 
	 * @return
	 */
	@RequestMapping(value = "/findHTML.do", method = RequestMethod.GET)
	public ModelAndView findHTML() {
		ModelAndView mv = new ModelAndView("/checkout");
		return mv;
	}

	@RequestMapping(value = "/bookNumberAutoIncrement.do", method = RequestMethod.GET)
	@ResponseBody
	public String bookNumberAutoIncrement(
			@RequestParam(value = "userId") String userId,
			@RequestParam(value = "bookId") String bookId) {
		if (userId.equals("") || bookId.equals("")) {
			return "修改失败";
		}
		return manageShoppingCartService.numberAutoIncrement(userId, bookId);

	}

	@RequestMapping(value = "/bookNumberAutoDecrement.do", method = RequestMethod.GET)
	@ResponseBody
	public String bookNumberAutoDecrement(
			@RequestParam(value = "userId") String userId,
			@RequestParam(value = "bookId") String bookId) {
		if (userId.equals("") || bookId.equals("")) {
			return "修改失败";
		}
		return manageShoppingCartService.numberAutoDecrement(userId, bookId);
	}

	@RequestMapping(value = "/update.do", method = RequestMethod.GET)
	@ResponseBody
	public String update(@RequestParam(value = "userId") String userId,
			@RequestParam(value = "bookId") String bookId,
			@RequestParam(value = "number") String number) {
		if (userId.equals("") || bookId.equals("")) {
			return "修改失败";
		}
		return manageShoppingCartService.update(userId, bookId, number);

	}
	
	
}
