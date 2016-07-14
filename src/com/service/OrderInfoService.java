package com.service;

import java.util.Date;
import java.util.List;

import com.model.OrderInfo;

public interface OrderInfoService {
	public List<OrderInfo> getOrderInfoList(Integer userId);
	public OrderInfo getOrderInfo(int id);
	public OrderInfo order(Integer userId,Integer addressId);
	public int pay(int userId,OrderInfo orderInfo,double price);
	public String receipt(Integer orderId);
	public String delivery(Integer orderId,String sendAddress);
	public String comment(int orderId);
	public List<OrderInfo> getBetween(Date begin,Date end);
	public List<OrderInfo> findAllAll();
}
