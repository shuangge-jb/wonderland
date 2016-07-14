package com.dao;

import java.io.Serializable;
import java.util.List;

import javax.annotation.Resource;

import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;

import com.model.ShoppingCart;

/**
 * 访问购物车数据表的实现类 created by gjb on 6.26
 * 
 * @author gjb
 *
 */
@Repository
public class ShoppingCartDaoImpl implements ShoppingCartDao {
	@Resource
	private SessionFactory sessionFactory;

	public ShoppingCartDaoImpl() {
		super();
		// TODO Auto-generated constructor stub
	}

	public ShoppingCartDaoImpl(SessionFactory sessionFactory) {
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
	 * @param sessionFactory
	 *            the sessionFactory to set
	 */
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<ShoppingCart> findByUserId(Integer userId) {
		String hql = " from com.model.ShoppingCart where userId=:userId ";
		return sessionFactory.getCurrentSession().createQuery(hql)
				.setInteger("userId", userId).list();

	}

	@Override
	public Serializable add(ShoppingCart cart) {

		return sessionFactory.getCurrentSession().save(cart);
	}

	@Override
	public void delete(ShoppingCart cart) {
		sessionFactory.getCurrentSession().delete(cart);
	}

	@Override
	public ShoppingCart find(Integer userId, Integer bookId) {
		String hql = " from com.model.ShoppingCart where userId=:userId and bookId=:bookId";
		@SuppressWarnings("unchecked")
		List<ShoppingCart> list = sessionFactory.getCurrentSession()
				.createQuery(hql).setInteger("userId", userId)
				.setInteger("bookId", bookId).list();
		return list.size() > 0 ? list.get(0) : null;
	}

	@Override
	public void update(ShoppingCart cart) {
		sessionFactory.getCurrentSession().update(cart);

	}

	@Override
	public void deleteAll(Integer userId) {
		List<ShoppingCart> cart = findByUserId(userId);
		if (cart.size() > 0) {
			for (ShoppingCart item : cart) {
				sessionFactory.getCurrentSession().delete(item);
			}
		}
	}
}
