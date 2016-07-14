package com.service;

import com.model.UserInfo;

/**
 * 登录的相关操作   modified by gjb on 6.26
 * @author gjb
 *
 */
public interface LoginService {
	public static final String EXISTED = "existed";
	public static final String UNEXISTED = "unexisted";
	public static final String CORRECT = "correct";
	public static final String INCORRECT = "密码错误";
public static final String DELETE_SUCCESS="删除成功";
public static final String USER_UNEXISTED="该用户不存在";
public static final String UPDATE_SUCCESS="修改成功";
public static final String USERNAME_NOT_NULL="用户名不能为空";
public static final String PASSWORD_NOT_NULL="密码不能为空";
	/**
	 * 判断用户名是否存在      modified by gjb on 6.25
	 * 
	 * @param username
	 * @return
	 */
	public String isUsernameExisted(String username);

	/**
	 * 判断密码是否正确       modified by gjb on 6.25
	 * 
	 * @param username
	 * @param password
	 * @return
	 */
	public String isPasswordCorrect(String username, String password);

	/**
	 * 删除该用户（在此方法中判断用户是否存在）    modified by gjb on 6.25
	 * 
	 * @param userName
	 * @return  成功删除返回  "删除成功"，如果用户不存在，返回   "该用户不存在"
	 */
	public String delete(String userName);
	/**
	 * 获取user    created by gjb on 6.27
	 * @return
	 */
	public UserInfo getUserByName(String userName);
	/**
	 * 保存新密码
	 * @param newPassword
	 * @return
	 */
	public String saveNewPassword(String username,String newPassword);
	
	
}
