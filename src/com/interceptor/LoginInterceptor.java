package com.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;
/**
 * 登录认证的拦截器 
 * @author gjb
 *
 */
public class LoginInterceptor implements HandlerInterceptor {
	/**
	 * Handler执行完成之后调用这个方法 
	 */
	@Override
	public void afterCompletion(HttpServletRequest arg0,
			HttpServletResponse arg1, Object arg2, Exception arg3)
			throws Exception {
		
	}
/**
 * Handler执行之后，ModelAndView返回之前调用这个方法 
 */
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response,
			Object handler, ModelAndView mv) throws Exception {
		
		
	}
/**
 * Handler执行之前调用这个方法 
 */
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response,
			Object handler) throws Exception {
		 //获取请求的URL  
        String url = request.getRequestURI();  
        //URL:login.jsp是公开的;这个demo是除了login.jsp是可以公开访问的，其它的URL都进行拦截控制  
        if(url.indexOf("login.do")>=0){  
            return true;  
        }  
        //获取Session  
        HttpSession session = request.getSession();  
        String username = (String)session.getAttribute("username");  
        System.out.println("username: "+username);
        if(username != null){  
            return true;  
        }  
        //不符合条件的，跳转到首页  
       // response.sendRedirect("index.jsp");
        response.sendRedirect("/mall/login");   
        System.out.println("forward to index.jsp");
//		mv=new ModelAndView("redirect:/login/login.do",null); 
        return false;  
	}

}
