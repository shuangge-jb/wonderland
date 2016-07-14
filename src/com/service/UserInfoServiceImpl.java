package com.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.dao.UserInfoDao;
import com.model.UserInfo;
@Service
public class UserInfoServiceImpl implements UserInfoService{
	@Resource
    UserInfoDao userInfoDao;
	public UserInfoDao getUserInfoDao() {
		return userInfoDao;
	}
	public void setUserInfoDao(UserInfoDao userInfoDao) {
		this.userInfoDao = userInfoDao;
	}
	@Override
	public void updateUserInfo(UserInfo userInfo) {
	    userInfoDao.update(userInfo);
	}
	@Override
	public UserInfo getUserByuserName(String username) {
		return userInfoDao.getUserByName(username);
	}
	@Override
	public List<UserInfo> findAllUsers() {
		// TODO Auto-generated method stub
		return userInfoDao.findAllUsers();
	}
	@Override
	public boolean isBuyPasswordCorrect(String username, String buyPassword) {
		UserInfo user=userInfoDao.getUserByName(username);
		if(user==null)return false;
		return user.getBuyPassword().equals(buyPassword);
	}
	@Override
	public String jiaMiOrJieMi(String password) {	
		char[]whx=password.toCharArray();
		for(int i=0;i<whx.length;i++){
			whx[i]=(char) (whx[i]^20000);
		}
		return new String(whx);
	}
}
