package com.controller;

import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.jws.WebParam.Mode;
import javax.servlet.http.HttpSession;


import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.view.RedirectView;

import com.model.UserInfo;
import com.service.LoginService;
import com.service.UserInfoService;
import com.controller.LoginController;
@Controller
@RequestMapping("/login")
@SessionAttributes({ "username", "userId","isManager" })
public class LoginController {
	@Resource
	private LoginService loginService;
	@Resource
	private UserInfoService useroInfoService;
	public LoginController() {
		super();
	}

	/**
	 * @return the loginService
	 */
	public LoginService getLoginService() {
		return loginService;
	}

	/**
	 * @param loginService
	 *            the loginService to set
	 */
	public void setLoginService(LoginService loginService) {
		this.loginService = loginService;
	}

	/**
	 * 判断该用户是否存在 modified by gjb on 6.26
	 * 
	 * @return
	 */
	@RequestMapping(value = "/isUsernameExisted.do", method = RequestMethod.POST)
	@ResponseBody
	public String isUsernameExisted(
			@RequestParam(value = "username") String username) {
		System.out.println("username= " + username);
	//Map<String,String>map=new HashMap<String,String>();
		String result=loginService.isUsernameExisted(username);
		//map.put("result", result);	
		//return map;
		return result;
	}

	/**
	 * 判断密码是否正确 modified by gjb on 6.26
	 * 
	 * @return
	 */
	@RequestMapping(value = "/isPasswordCorrect.do", method = RequestMethod.POST)
	@ResponseBody
	public String isPasswordCorrect(
			@RequestParam(value = "username") String username,
			@RequestParam(value = "password") String password) {
		System.out.println("password= " + password);	
			String result=	loginService.isPasswordCorrect(username, useroInfoService.jiaMiOrJieMi(password));
		return result;
	}

	/**
	 * 用户登录（需要用到session） modified by gjb on 6.26
	 * 
	 * @return
	 */
	@RequestMapping(value = "/login.do", method = RequestMethod.POST)
	public ModelAndView login(
			@RequestParam(value = "username") String username,
			@RequestParam(value = "password") String password, ModelMap model) {
		System.out.println("username= " + username);
		ModelAndView mv = new ModelAndView();
		if(username.equals("")||password.equals("")){
			mv.setViewName("login2");
			return mv;
		}
			// model.addAttribute("username", username);
			UserInfo user = loginService.getUserByName(username);
			System.out.println("user=" + user);
			model.addAttribute("username", user.getUsername());
			model.addAttribute("userId", user.getId().toString());
			boolean isManager=username.equals("12");
			if(isManager){
				mv.setViewName("managerCenter");
				return mv;
			}
			model.addAttribute("isManager", isManager);
			// mv.setViewName("redirect:/index.do");
			RedirectView redirect = new RedirectView();
			redirect.setExposeModelAttributes(false);
			redirect.setUrl("/mall/index.do");
			mv = new ModelAndView(redirect, model);
		return mv;
	}
	/**
	 * 删除指定的书本（供管理员操作） modified by gjb on 6.26
	 * 
	 * @return
	 */
	@RequestMapping(value = "/delete.do", method = RequestMethod.GET)
	public String delete(@RequestParam(value = "username") String userName) {
		System.out.println("userName= " + userName);
		loginService.delete(userName);
		System.out.println("delete success.");
		return "index";

	}

	/**
	 * 用户退出登录（需要用到session） modified by gjb on 6.26
	 * 
	 * @return
	 */
	@RequestMapping(value = "/logout.do", method = RequestMethod.GET)
	public ModelAndView logout(@ModelAttribute("user") UserInfo user,
			ModelMap model, SessionStatus status, HttpSession session) {

		System.out.println("before logout.");
		status.setComplete();// 清除session中的数据
		session.invalidate();
		// model.remove("username");
		// model.addAttribute("username", "");
		RedirectView redirect = new RedirectView("/mall/index.do");
		redirect.setExposeModelAttributes(false);
		ModelAndView mv = new ModelAndView(redirect, null);
		System.out.println("after logout.");
		return mv;
	}
	
	/**
	 * 转到找回密码页面,并传入问题和答案
	 * @param username
	 * @return
	 */
	@RequestMapping(value = "/toFindPassword.do", method = RequestMethod.GET)
	public ModelAndView toFindPassword(@RequestParam("username")String username){
		ModelAndView mv = new ModelAndView();
		UserInfo user=loginService.getUserByName(username);
		if(user!=null){
			mv.addObject("username", username);
		mv.addObject("question",user.getQuestion());
		mv.addObject("answer", user.getAnswer());
		}
		mv.setViewName("/forgetPass");//要跳转的JSP页面名字
		 return mv;
	}
	@RequestMapping(value = "/toResetPassword.do", method = RequestMethod.POST)
	public ModelAndView toResetPassword(@RequestParam("username")String username){
		ModelAndView mv=new ModelAndView();
		mv.addObject("username", username);
		mv.setViewName("resetPass");
		return mv;//要跳转的JSP页面名字
	}
	@RequestMapping(value = "/saveNewPassword.do", method = RequestMethod.POST)
	public String saveNewPassword(@RequestParam("username")String username,
			@RequestParam("password")String password){
		loginService.saveNewPassword(username, useroInfoService.jiaMiOrJieMi(password));
		return "login2";//跳转到登录页面
	}
	
	
}
