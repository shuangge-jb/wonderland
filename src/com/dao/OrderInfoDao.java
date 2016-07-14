package com.dao;

import java.util.Date;
import java.util.List;

import com.model.OrderInfo;

/**
 * 
 * @author Fang
 *
 */
public interface OrderInfoDao {
	public List<OrderInfo> findAll(Integer userID);
	public void saveOrUpdate(OrderInfo orderInfo);
	public void delete(OrderInfo orederInfo);
	public OrderInfo findById(Integer id);
	/**
	 * 找出已付款的订单whx
	 * @param status
	 * @return
	 */
	public List<OrderInfo>findOrderHaspaid(Integer status);
	public List<OrderInfo> findBetween(Date begin,Date end);
	public List<OrderInfo> findAllAll();
}
