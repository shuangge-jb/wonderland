package com.service;

import java.util.List;

import com.model.UserInfo;

public interface UserInfoService {
	/**
	 * 修改用户信息   whx
	 * @param userInfo
	 */
 public void updateUserInfo(UserInfo userInfo);
 /**
  * 由用户名得到用户   whx
  * @param username
  * @return
  */
 public UserInfo getUserByuserName(String username);
 /**
  * 返回所有用户
  * @return
  */
 public List<UserInfo>findAllUsers();
 
 /**
	 * 判断支付密码是否正确       modified by gjb on 6.25
	 * 
	 * @param username
	 * @param password
	 * @return
	 */
	public boolean isBuyPasswordCorrect(String username, String buyPassword);
	/**
	 * 对密码加密或对密码解密（用到异或）
	 * @param password
	 * @return
	 */
	public String jiaMiOrJieMi(String password);
	
}
