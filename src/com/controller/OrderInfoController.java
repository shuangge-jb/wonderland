package com.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Set;

import javax.annotation.Resource;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.DateTimeFormat.ISO;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.dao.BookNumDaoImpl;
import com.dao.UserInfoDao;
import com.model.Address;
import com.model.BookInfo;
import com.model.BookNum;
import com.model.OrderInfo;
import com.model.ShoppingCart;
import com.model.UserInfo;
import com.service.AddressService;
import com.service.BookNumService;
import com.service.BookNumServiceImpl;
import com.service.ManageShoppingCartService;
import com.service.OrderInfoService;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Controller
@RequestMapping(value = "/orderInfo")
@SessionAttributes({ "userId" })
public class OrderInfoController {
	@Resource
	private OrderInfoService orderInfoService;
	@Resource
	private AddressService addressService;
	@Resource
	private BookNumService bookNumService;
	@Resource
	private ManageShoppingCartService manageShoppingCartService;
	@Resource
	private UserInfoDao userInfoDao;

//localhost:8080/mall/orderInfo/getOrderInfoList.do?userId?123
	@RequestMapping(value = "getOrderInfoList.do", method = RequestMethod.GET)
	public String getOrderInfoList(@RequestParam("userId") Integer userId, Model model) {
		List<OrderInfo> orderInfoList = orderInfoService.getOrderInfoList(userId);
		model.addAttribute("orderInfoList", orderInfoList);
		model.addAttribute("userId", userId);
		return "myorder";
	}
	@RequestMapping(value="getOrderInfo.do",method=RequestMethod.GET)
	public String getOrderInfo(@RequestParam("id") int orderId,Model model){
		OrderInfo orderInfo =orderInfoService.getOrderInfo(orderId);
		Set<BookNum> bookNumSet = orderInfo.getBookNums();
		model.addAttribute("orderInfo", orderInfo);
		model.addAttribute("bookNumSet",bookNumSet);
		double price=0.0;
		for(BookNum bookNum:bookNumSet){
			price+=bookNum.getBookNum()*bookNum.getBookInfo().getBookPrice();
		}
		model.addAttribute("price", price);
		return "myOrderInf";
	}
	@RequestMapping(value="getOrderInfo1.do",method=RequestMethod.GET)
	public String getOrderInfo1(@RequestParam("id") int orderId,Model model){
		OrderInfo orderInfo =orderInfoService.getOrderInfo(orderId);
		Set<BookNum> bookNumSet = orderInfo.getBookNums();
		model.addAttribute("orderInfo", orderInfo);
		model.addAttribute("bookNumSet",bookNumSet);
		double price=0.0;
		for(BookNum bookNum:bookNumSet){
			price+=bookNum.getBookNum()*bookNum.getBookInfo().getBookPrice();
		}
		model.addAttribute("price", price);
		return "myOrderInf1";
	}
	
	@RequestMapping(value = "/preOrder.do", method = RequestMethod.GET)
	@ResponseBody
	public Object preOrder(@RequestParam(value = "userId") int userId,
			/*
			 * @RequestParam(value = "books", required = false) JSONArray books,
			 * 
			 * @RequestParam(value = "shoppingCarts", required = false)
			 * JSONArray shoppingCarts,
			 */
			Model model) {
		/*
		 * model.addAttribute("books", books);
		 * model.addAttribute("shoppingCarts", shoppingCarts);
		 */
		List<ShoppingCart> cartList = manageShoppingCartService.find(Integer.toString(userId));
		List<BookInfo> booksList = manageShoppingCartService.findBookInCart(cartList);
		JSONObject jsonObject = new JSONObject();
		JSONArray shopcarList = new JSONArray();
		for (int i = 0; i < booksList.size(); i++) {
			JSONObject shopcar_json = new JSONObject();
			BookInfo bookInfo = booksList.get(i);
			String bookName = bookInfo.getBookName();
			double bookPrice = bookInfo.getBookPrice();
			int num = cartList.get(i).getNumber();
			shopcar_json.put("bookName", bookName);
			shopcar_json.put("bookPrice", bookPrice);
			shopcar_json.put("number", num);
			shopcarList.add(shopcar_json);
		}
		List<Address> addresses = addressService.getAddressList(userId);
		JSONArray addressList = new JSONArray();
		for (Address address : addresses) {
			JSONObject address_json = new JSONObject();
			address_json.put("id", address.getId());
			address_json.put("userId", address.getUserId());
			address_json.put("getPerson", address.getGetPerson());
			address_json.put("getAddress", address.getGetAddress());
			address_json.put("tel", address.getTel());
			address_json.put("postcode", address.getPostcode());
			addressList.add(address_json);
		}
		jsonObject.put("shopcar", shopcarList);
		jsonObject.put("address", addressList);
		return jsonObject;

	}

	@RequestMapping(value = "/order.do", method = RequestMethod.GET)
	@ResponseBody
	public boolean order(@RequestParam(value = "userId") int userId, @RequestParam(value = "addressId") int addressId,
			Model model) {
		List<BookNum> bookNumList = new ArrayList<BookNum>();
		List<ShoppingCart> cartList = manageShoppingCartService.find(Integer.toString(userId));
		List<BookInfo> booksList = manageShoppingCartService.findBookInCart(cartList);
		double price = 0.0;
		for (int i = 0; i < cartList.size(); i++){
			BookInfo bookInfo = booksList.get(i);
			int num = cartList.get(i).getNumber();
			BookNum bookNum = new BookNum();
			bookNum.setBookInfo(bookInfo);
			bookNum.setBookNum(num);
			bookNumList.add(bookNum);
			price+=num*bookInfo.getBookPrice();
		}
		OrderInfo orderInfo = orderInfoService.order(userId, addressId);
		for (BookNum bookNum : bookNumList) {
			bookNum.setOrderInfo(orderInfo);
			bookNumService.save(bookNum);
		}
		manageShoppingCartService.deleteAll(Integer.toString(userId));
		return true;
	}
	
	@RequestMapping(value = "/pay.do", method = RequestMethod.GET)
	@ResponseBody
	public int payOrder(@RequestParam(value="userId")int userId,@RequestParam(value = "id") Integer id) {
		OrderInfo orderInfo = orderInfoService.getOrderInfo(id);
		if(orderInfo.getStatus()==1)
			return 0;
		double price=0.0;
		for(BookNum bookNum:orderInfo.getBookNums()){
			price+=bookNum.getBookNum()*bookNum.getBookInfo().getBookPrice();
		}
		return orderInfoService.pay(userId,orderInfo,price);
	}

	@RequestMapping(value = "/toOrder.do", method = RequestMethod.GET)
	public String toOrder() {
		return "order";
	}

	@RequestMapping(value = "/delivery.do", method = RequestMethod.GET)
	@ResponseBody
	public String delivery(@RequestParam(value = "id") int id,
			@RequestParam(value="address",required=false) String sendAddress) {
		return orderInfoService.delivery(id, sendAddress);
	}
	@RequestMapping(value="/receipt.do",method=RequestMethod.GET)
	@ResponseBody
	public String receipt(@RequestParam(value = "id")int id){
		return orderInfoService.receipt(id);
	}
	
	@RequestMapping(value="/orderManager.do")
	public String orderManager(){
		return "orderManager";
	}
	@RequestMapping(value="/findBetween.do",method=RequestMethod.POST)
	public String findBetween(@RequestParam("begin") String begin,
			@RequestParam("end") String end,
			Model model) throws ParseException{
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date date = sdf.parse(begin);
		Date date2=sdf.parse(end);
		model.addAttribute("findBetween", orderInfoService.getBetween(date, date2));
		System.out.println(date);
		System.out.println(date2);
		return "orderResult";
	}
	@RequestMapping(value="findAllAll.do")
	public String findAllAll(Model model){
		model.addAttribute("findBetween",orderInfoService.findAllAll());
		return "orderResult";
	}

}
