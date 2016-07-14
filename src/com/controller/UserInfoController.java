package com.controller;
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

import com.model.OrderInfo;
import com.model.UserInfo;
import com.service.LoginService;
import com.service.OrderInfoService;
import com.service.RegistService;
import com.service.UserInfoService;
/**
 * whx
 * @author Administrator
 *
 */
@Controller
@RequestMapping("/user")
@SessionAttributes("username")
public class UserInfoController {
	@Resource 
	private UserInfoService userInfoService;
	@Resource 
	private OrderInfoService orderInfoService;
	public UserInfoService getUserInfoService() {
		return userInfoService;
	}
	public void setUserInfoService(UserInfoService userInfoService) {
		this.userInfoService = userInfoService;
	}
	/**
	 * 进入个人中心
	 * @return
	 */
	@RequestMapping(value = "/userInfo.do", method = RequestMethod.GET)
	public ModelAndView regist() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("personal");
		return mv;
	}
	/**
	 * 管理员根据用户名查询用户信息
	 * @param username
	 * @return
	 */
	@RequestMapping(value = "/getUser.do", method = RequestMethod.GET)
	public ModelAndView getUser(@RequestParam(value="username")String username) {
		ModelAndView mv = new ModelAndView();
		UserInfo user=userInfoService.getUserByuserName(username);
		mv.addObject("user", user);
		mv.setViewName("userInfo");
		return mv;
	}
	/**
	 * 根据用户Id查询订单
	 * @param userId
	 * @return
	 */
	@RequestMapping(value = "/findOrdersByuserId.do", method = RequestMethod.GET)
	public ModelAndView findOrdersByUserId(@RequestParam(value="userId")Integer userId) {
		ModelAndView mv = new ModelAndView();
		List<OrderInfo> list=orderInfoService.getOrderInfoList(userId);
		mv.addObject("listOrder",list);
		mv.setViewName("orderMessage");
		return mv;
	}
	/**
	 * 查询所有用户
	 * @return
	 */
	@RequestMapping(value = "/findAllUsers.do", method = RequestMethod.GET)
	public ModelAndView findAllUsers() {
		ModelAndView mv = new ModelAndView();
		List<UserInfo> listUsers=userInfoService.findAllUsers();
		mv.addObject("listUsers",listUsers);
		mv.setViewName("members");
		return mv;
	}
	/**
	 * 点击进入上传书页面
	 * @return
	 */
	@RequestMapping(value = "/userInfo1.do", method = RequestMethod.GET)
	public ModelAndView test() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("addBook");
		return mv;
	}
	/**
	 * 修改信息
	 * @param username
	 * @param sex
	 * @param tel
	 * @param map
	 * @return
	 */
	@RequestMapping(value = "/changeUserInfo.do", method = RequestMethod.POST)
	public ModelAndView changeUserInfo(
			@RequestParam(value="username")String username,
			@RequestParam(value="sex")String sex,
			@RequestParam(value="tel")String tel,
			@RequestParam(value="email")String email,
			@RequestParam(value="question")String question,
			@RequestParam(value="answer")String answer,
			ModelMap map
			){
		String tip=null;
		UserInfo userInfo=userInfoService.getUserByuserName(username);  
		userInfo.setSex(sex);
        userInfo.setTel(tel);
        userInfo.setAnswer(answer);
        userInfo.setEmail(email);
        userInfo.setQuestion(question);
        tip="修改成功";
        userInfoService.updateUserInfo(userInfo);
        ModelAndView mv =new ModelAndView();
        mv.setViewName("redirect:/user/getUserInfo.do?username="+username);
		return mv;
	}
	/**
	 * 充值
	 * @param username
	 * @param password
	 * @param balance
	 * @param map
	 * @return
	 */
	@RequestMapping(value = "/changeUserBalance.do", method = RequestMethod.GET)
	public ModelAndView changeUserBanlance(
			@RequestParam(value="username")String username,
			@RequestParam(value="password")String password,
			@RequestParam(value="balance")String balance,
			ModelMap map
			){
		ModelAndView mv = new ModelAndView();
		UserInfo userInfo=userInfoService.getUserByuserName(username);
		if(Double.valueOf(balance)>0&&userInfoService.jiaMiOrJieMi(userInfo.getPassword()).equals(password))
		{
			map.put("tip", "充值成功");
		}
		mv.setViewName("success");
		return mv;	
	}
	/**
	 * 欢迎页
	 * @param username
	 * @return
	 */
	@RequestMapping(value = "/welcome.do", method = RequestMethod.GET)
	public ModelAndView welcome(String username) {
		ModelAndView mv = new ModelAndView();
		if(username!=null){
		UserInfo user=userInfoService.getUserByuserName(username);
		mv.addObject("balance", user.getBalance());
		mv.addObject("userScore",user.getUserScore());
		}
		mv.setViewName("welcome");
		return mv;
	}
	/**
	 * 进入修改页面
	 * @return
	 */
	@RequestMapping(value = "/pwChange.do", method = RequestMethod.GET)
	public ModelAndView pwchange() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("passwordChange");
		return mv;
	}
	/**
	 * 进入充值页面
	 * @return
	 */
	@RequestMapping(value = "/reCharge.do", method = RequestMethod.GET)
	public ModelAndView change() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("recharge");
		return mv;
	}
	/**
	 * 修改密码
	 * @param username
	 * @param password
	 * @param password1
	 * @param map
	 * @return
	 */
	@RequestMapping(value="changePassword.do",method=RequestMethod.POST)
	@ResponseBody
	public String changePassword(
			@RequestParam(value="username")String username,
			@RequestParam(value="password")String password,
			@RequestParam(value="password1")String password1,
			ModelMap map){
		ModelAndView mv = new ModelAndView();
		System.out.println("username######"+username);
		UserInfo userInfo=userInfoService.getUserByuserName(username);
		if(!userInfoService.jiaMiOrJieMi(password).equals(userInfo.getPassword())){
			map.put("tip","原密码输入不正确");
		}
		else if(password1==null||password1.trim().length()==0){
			map.put("tip","修改密码不能为空");
		}
		else{
			userInfo.setPassword(userInfoService.jiaMiOrJieMi(password1));
			map.put("tip","修改成功");
			userInfoService.updateUserInfo(userInfo);
		}
		
		return (String) map.get("tip");
		
	}
	
	@RequestMapping(value="getUserInfo.do",method=RequestMethod.GET)
	public ModelAndView getUserInfo(@RequestParam(value="username")String username
			){
		ModelAndView mv = new ModelAndView();
		UserInfo user=userInfoService.getUserByuserName(username);
		mv.addObject("userInfo", user);
		mv.setViewName("myInfo");
		return mv;
	}
	@RequestMapping(value="chongZhi.do",method=RequestMethod.GET)
	public ModelAndView getChongzhi(
			@RequestParam(value="username")String username,
			@RequestParam(value="buyPassword")String buyPassword,
			@RequestParam(value="balance")String balance){
		ModelAndView mv = new ModelAndView();
		UserInfo user=userInfoService.getUserByuserName(username);
		if(balance!=null&&balance.length()!=0&&user.getBuyPassword().equals(userInfoService.jiaMiOrJieMi(buyPassword))){
		user.setBalance(Double.valueOf(balance)+user.getBalance());
		System.out.println("ddddddddd"+Double.valueOf(balance)+user.getBalance());
		userInfoService.updateUserInfo(user);
		mv.addObject("tip", "充值成功");
		}
		else {
		mv.addObject("tip","充值失败");
		}
		mv.setViewName("/recharge");
		return mv;
	}
	/**
	 * @param balance
	 * @return
	 */
	@RequestMapping(value = "/isBalanceCorrect.do", method = RequestMethod.POST)
	@ResponseBody
	public String isbalanCorrect(@RequestParam(value="balance")String balance){
		String tipb=null;
		
		if(!balance.matches("^(([0-9]{1}\\d*))(\\.(\\d){0,2})?$")){
			
			tipb="输入金额必须是正整数或两位小数";
		}
		if(balance.equals("0")||balance.equals("0.0")||balance.equals("0.00")){
				tipb="输入金额必须是正整数或两位小数";
		}
		System.out.print("格式是"+tipb);
		return tipb;	
	}
	/**
	 * @param balance
	 * @return
	 */
	@RequestMapping(value = "/isPasswordCorrect.do", method = RequestMethod.POST)
	@ResponseBody
	public String isPassWCorrect(@RequestParam(value="buyPassword")String buyPassword,
			@RequestParam(value="username")String username){
		UserInfo user=userInfoService.getUserByuserName(username);
		String tipp=null;
		if(buyPassword==null||buyPassword.length()==0){
			tipp="支付密码不能为空";
		}
		else if((!userInfoService.jiaMiOrJieMi(buyPassword).equals(user.getBuyPassword()))){
			tipp="支付密码不正确";
		}
		System.out.print("格式是"+tipp);
		return tipp;	
	}
	
	/**
	 * 判断支付密码是否正确       modified by gjb on 7.9
	 * 
	 * @return
	 */
	@RequestMapping(value = "/isBuyPasswordCorrect.do", method = RequestMethod.GET)
	@ResponseBody
	public boolean isBuyPasswordCorrect(
			@RequestParam(value = "username") String username,
			@RequestParam(value = "buyPassword") String buyPassword) {
		System.out.println("buyPassword= " + buyPassword);
			boolean result=	userInfoService.isBuyPasswordCorrect(username, userInfoService.jiaMiOrJieMi(buyPassword));
		return result;
	}

}
