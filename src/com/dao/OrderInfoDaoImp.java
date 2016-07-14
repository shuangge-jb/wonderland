package com.dao;

import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;

import com.model.OrderInfo;

@Repository
public class OrderInfoDaoImp implements OrderInfoDao {
	
	@Resource
	private SessionFactory sessionFactory;
	@Override
	public List<OrderInfo> findAll(Integer userId) {
		String hql = "from com.model.OrderInfo where user_id=?";
		return sessionFactory.getCurrentSession().createQuery(hql).setInteger(0, userId).list();
	}

	
	@Override
	public void saveOrUpdate(OrderInfo orderInfo) {
		sessionFactory.getCurrentSession().saveOrUpdate(orderInfo);

	}
	@Override
	public void delete(OrderInfo orederInfo) {
		sessionFactory.getCurrentSession().delete(orederInfo);
	}
	@Override
	public OrderInfo findById(Integer id){
		return (OrderInfo) sessionFactory.getCurrentSession().get(OrderInfo.class, id);
	}
	
	@Override
	public List<OrderInfo> findOrderHaspaid(Integer status) {
		String hql = "from com.model.OrderInfo where status=?";
		return sessionFactory.getCurrentSession().createQuery(hql).setInteger(0, status).list();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<OrderInfo> findBetween(Date begin, Date end) {
		String hql ="from com.model.OrderInfo where pub_time>=? and pub_time<=? ";
		return sessionFactory.getCurrentSession().createQuery(hql).setTimestamp(0, begin).setTimestamp(1, end).list();
	}


	@Override
	public List<OrderInfo> findAllAll() {
		String hql = "from com.model.OrderInfo";
		return sessionFactory.getCurrentSession().createQuery(hql).list();
	}

}
