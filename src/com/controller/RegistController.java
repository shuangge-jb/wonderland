package com.controller;
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

import com.model.UserInfo;
import com.service.LoginService;
import com.service.RegistService;
import com.service.UserInfoService;

@Controller
@RequestMapping("/regist")
@SessionAttributes("username")
public class RegistController {
	@Resource
	private RegistService registService;
	@Resource
	private UserInfoService userInfoService;
	public RegistController() {
		super();
	}
	public RegistService getRegistService() {
		return registService;
	}
	public void setRegistService(RegistService registService) {
		this.registService = registService;
	}
	@RequestMapping(value = "/regist.do", method = RequestMethod.POST)
	public ModelAndView regist(
			@RequestParam(value = "username") String username,
			@RequestParam(value = "password1") String password,
			@RequestParam(value = "email") String email,
			@RequestParam(value = "payPassword1") String payPassword1,
			@RequestParam(value = "question") String question,
			@RequestParam(value = "answer") String answer,
			/*@ModelAttribute("username")*/ ModelMap model) {
		System.out.println("username= " + username);
		System.out.println("password= " + password);
		ModelAndView mv = new ModelAndView();
		
			model.put("Tip", "注册成功");	
			UserInfo user=new UserInfo();
			user.setUsername(username);
			user.setPassword(userInfoService.jiaMiOrJieMi(password));
			user.setAnswer(answer);
			user.setQuestion(question);
			user.setEmail(email);
			user.setBuyPassword(userInfoService.jiaMiOrJieMi(payPassword1));
			user.setBalance(Double.valueOf(0));
			user.setUserScore("0");
			registService.saveUserInDb(user);
			mv.setViewName("regist");	
		return mv;
	}
	@RequestMapping(value = "/isUserNameExist.do", method = RequestMethod.POST)
	@ResponseBody
    public String isUserNameExist(@RequestParam(value = "username") String username){
		//ModelAndView mv = new ModelAndView();
		String tip=null;
		System.out.println("验证username="+username);
		if(username==null||username.trim().length()==0){
			tip="用户名不能为空";
		}
		else if(registService.isUserNameExit(username)){
			 tip="该用户已存在";
		}
		else if(!username.matches("[a-zA-Z0-9]{3,11}")){
			tip="用户名只能由3-12位数字或字母组成";
		}
		return tip; 	
    }
	@RequestMapping(value = "/isEmailCorrect.do", method = RequestMethod.POST)
	@ResponseBody
	public String isEmailCorrect(@RequestParam(value="email")String email){
		String tipe=null;
		if(!email.matches("^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+(.[a-zA-Z0-9_-])+")){
			tipe="邮箱格式不正确";
		}
		System.out.print("格式是"+tipe);
		return tipe;
		
	}
	@RequestMapping(value = "/isPasswordFormatCorrect.do", method = RequestMethod.POST)
	@ResponseBody
	public String isPassword1Correct(@RequestParam(value="password1")String password1){
		String tipp1=null;
		if(password1==null||password1.trim().length()==0){
			tipp1="密码不能为空";
		}
		else if(!password1.matches("^.{6,20}$")){
			tipp1="*密码必须是6-20位的数字或字母或字符";
		}
		System.out.print("密码格式是"+tipp1);
		return tipp1;
		
	}
	@RequestMapping(value = "/isTwoPasswordSame.do", method = RequestMethod.POST)
	@ResponseBody
	public String isTwoPasswordSame(@RequestParam(value="password1")String password1,
			@RequestParam(value="password2")String password2){
		String tipp2=null;
		if(password2==null||password2.trim().length()==0){
			tipp2="确认密码不能为空";
		}
		else if(!password1.equals(password2)){
			tipp2="两次密码不一致";
		}
		return tipp2;	
	}
	@RequestMapping(value = "/isPayPasswordRight.do", method = RequestMethod.POST)
	@ResponseBody
	public String isPayPasswordRight(@RequestParam(value="payPassword1")String payPassword1
			){
		String tippay1=null;
		if(payPassword1==null||payPassword1.trim().length()==0){
			tippay1="密码不能为空";
		}
		else if(!payPassword1.matches("^.{6,20}$")){
			tippay1="支付密码必须由6-20位的数字或字母或字符";
		}
		return tippay1;	
	}
	@RequestMapping(value = "/isTwoPayPasswordSame.do", method = RequestMethod.POST)
	@ResponseBody
	public String isTwoPayPasswordSame(@RequestParam(value="payPassword2")String payPassword2,
			@RequestParam(value="payPassword1")String payPassword1){
		String tippay2=null;
		if(payPassword2==null||payPassword2.trim().length()==0){
			tippay2="确认支付密码不能为空";
		}
		else if(!payPassword1.equals(payPassword2)){
			tippay2="两次密码不一致";
		}
		return tippay2;	
	}
	@RequestMapping(value = "/isQuestionCorrect.do", method = RequestMethod.POST)
	@ResponseBody
	public String isQuestionCorrect(@RequestParam(value="question")String question){
		String tippq=null;
		if(question==null||question.trim().length()==0){
			tippq="问题不能为空";
		}
		else if(question.length()>=30){
			tippq="问题长度太长";
		}
		return tippq;
		
	}
	@RequestMapping(value = "/isAnswerCorrect.do", method = RequestMethod.POST)
	@ResponseBody
	public String isAnswerCorrect(@RequestParam(value="answer")String answer){
		String tippa=null;
		if(answer==null||answer.trim().length()==0){
			tippa="请输入密保问题的答案";
		}
		else if(answer.length()>=30){
			tippa="答案长度太长";
		}
		return tippa;
		
	}
	
	
}
