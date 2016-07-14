package com.dao;

import java.util.List;

import javax.annotation.Resource;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.orm.hibernate4.support.HibernateDaoSupport;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.model.UserInfo;
/**
 * 不能使用HiernateDaoSupport,否则事务执行不了
 * @author Administrator
 *
 */
@Repository
public class UserInfoDaoImpl /*extends HibernateDaoSupport*/ implements UserInfoDao {
	@Resource
	private SessionFactory sessionFactory;

	public UserInfoDaoImpl() {
		super();
	}

	public UserInfoDaoImpl(SessionFactory sessionFactory) {
		super();
		this.sessionFactory = sessionFactory;
	}

	/**
	 * @return the sessionFactory
	 */
	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	/**
	 * @param sessionFactory the sessionFactory to set
	 */
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@SuppressWarnings("unchecked")
	@Override
	public UserInfo getUserByName(String username) {
		/*List<UserInfo> list = (List<UserInfo>) getHibernateTemplate().find(
				"from com.model.UserInfo where username=?", username);*/
		String hql="from com.model.UserInfo where username=:username";
		System.out.println("username"+username);
		List<UserInfo> list = sessionFactory.getCurrentSession().createQuery(hql).setString("username", username).list();
		System.out.println("list"+list.size());
		return list.size() > 0 ? list.get(0) : null;
	}
	@Override
	public String getPassword(String username) {
		UserInfo user=getUserByName(username);
		return user==null?null:user.getPassword();
	}
	
	@Override
	public void delete(UserInfo user) {
		sessionFactory.getCurrentSession().delete(user);
	}

	@Override
	public UserInfo find(Integer id) {
		String hql="from com.model.UserInfo where id=:id";
		List<UserInfo> list = sessionFactory.getCurrentSession().createQuery(hql).setInteger("id", id).list();
		return list.size() > 0 ? list.get(0) : null;
	}
	@Override
	public void saveUserInDb(UserInfo userInfo) {
		sessionFactory.getCurrentSession().save(userInfo);	
	}

	@Override
	public Integer getUserId(String username) {
		UserInfo user=getUserByName(username);
		return user!=null?user.getId():null;	
	}
	@Override
	public void update(UserInfo userInfo) {
		sessionFactory.getCurrentSession().update(userInfo);
	}

	@Override
	public List<UserInfo> findAllUsers() {
		String hql="from com.model.UserInfo";
		List<UserInfo> list = sessionFactory.getCurrentSession().createQuery(hql).list();
		return list;
	}
}
