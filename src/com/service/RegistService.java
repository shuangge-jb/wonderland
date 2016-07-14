package com.service;

import com.model.UserInfo;

public interface RegistService {
	public void saveUserInDb(UserInfo userInfo);
	public boolean isUserNameExit(String username);
}
