package com.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.annotation.Propagation; 

import com.dao.UserInfoDao;
import com.model.UserInfo;
/**
 * 登录管理的实现类  modified by gjb on 6.26
 * @author gjb
 *
 */
@Service("loginService")
public class LoginServiceImpl implements LoginService {
	@Resource
	private UserInfoDao userInfoDao;

	public LoginServiceImpl() {
		super();
	}

	/**
	 * @return the loginDao
	 */
	public UserInfoDao getUserInfoDao() {
		return userInfoDao;
	}

	/**
	 * @param loginDao the loginDao to set
	 */
	public void setUserInfoDao(UserInfoDao loginDao) {
		this.userInfoDao = loginDao;
	}

	@Override
	public String isUsernameExisted(String username) {
		if(username==null||username.trim().length()==0)return USERNAME_NOT_NULL;
		return userInfoDao.getUserByName(username)!=null?null:USER_UNEXISTED;//存在就返回null，不存在才给出错误提示
		}
	@Override
	public String isPasswordCorrect(String username,String password){
		if(password==null||password.trim().length()==0)return PASSWORD_NOT_NULL;
		String realPassword=userInfoDao.getPassword(username);
		if(realPassword==null){
			return INCORRECT;
		}else{
		return realPassword.equals(password)?null:INCORRECT;//正确就返回null，不正确才给出错误提示
		}
	}
 
	@Override
	public String delete(String username){
		UserInfo user=userInfoDao.getUserByName(username);
		if(user!=null){userInfoDao.delete(user);
		System.out.println(username+" has been deleted");
		return DELETE_SUCCESS;
		}else{
			System.out.println(username +" doesn't existed.");
			return USER_UNEXISTED;
		}
	}

	@Override
	public UserInfo getUserByName(String username) {
		return userInfoDao.getUserByName(username);
		
	}

	@Override
	public String saveNewPassword(String username,String newPassword) {
		UserInfo user=userInfoDao.getUserByName(username);
		if(user==null)return USER_UNEXISTED;
		user.setPassword(newPassword);
		userInfoDao.update(user);
		return UPDATE_SUCCESS;
	}


}
