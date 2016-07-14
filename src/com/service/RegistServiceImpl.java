package com.service;
import java.util.List;

import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import com.dao.UserInfoDao;
import com.model.UserInfo;
@Service
public class RegistServiceImpl implements RegistService {
	@Resource
    private UserInfoDao userInfoDao;
	public UserInfoDao getUserInfoDao() {
		return userInfoDao;
	}
	public void setUserInfoDao(UserInfoDao userInfoDao) {
		this.userInfoDao = userInfoDao;
	}

	@Override
	public void saveUserInDb(UserInfo userInfo) {
		userInfoDao.saveUserInDb(userInfo);
	}
	@Override
	public boolean isUserNameExit(String username) {
		if(userInfoDao.getUserByName(username)!=null)
		return true;
		else return false;
	}

}
