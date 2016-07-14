package com.dao;

import java.util.List;
import org.springframework.transaction.annotation.Transactional;
import com.model.UserInfo;
/**
 * 处理用户信息
 * 
 * @author modified by gjb on 6.25
 *
 */
public interface UserInfoDao {
/**
 * 通过userId找到user  created by gjb on 6.26
 * @param id
 * @return 如果查不到，返回null
 */
	public UserInfo find(Integer id);
	/**
	 * 查找对应的User(默认username都不同) modified by gjb on 6.25
	 * 
	 * @param username
	 * @return 如果查不到，返回null
	 */
	public UserInfo getUserByName(String username);

	/**
	 * 查询该用户的密码       modified by gjb on 6.25
	 * 
	 * @param username
	 * @return
	 */
	public String getPassword(String username);
	/**
	 * 删除用户(在service中判断用户是否存在，此方法直接删除，不判断用户是否为空)    modified by gjb on 6.25
	 * 
	 * @param user
	 */
	public void delete(UserInfo user);
	/**
	 * 保存用户信息到数据库
	 * @param userInfo
	 */
	public void saveUserInDb(UserInfo userInfo);
	/**
	 * created by gjb on 6.27
	 * @return  User Id,若用户不存在，返回null
	 */
	public Integer getUserId(String username);
	/**
	 * 修改后更新   gjb
	 */
	public void update(UserInfo userInfo);
	/**
	 * 查询所有用户
	 * @return
	 */
	public List<UserInfo> findAllUsers();
}
