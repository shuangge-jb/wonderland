package com.service;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.dao.AddressDao;
import com.dao.BookInfoDao;
import com.dao.OrderInfoDao;
import com.dao.UserInfoDao;
import com.model.Address;
import com.model.BookInfo;
import com.model.BookNum;
import com.model.OrderInfo;
import com.model.UserInfo;

@Service
public class OrderInfoServiceImpl implements OrderInfoService {

	@Resource
	private OrderInfoDao orderInfoDao;
	@Resource
	private AddressDao addressDao;
	@Resource
	private UserInfoDao userInfoDao;
	@Resource
	private BookInfoDao bookInfoDao;

	@Override
	public List<OrderInfo> getOrderInfoList(Integer userId) {
		return orderInfoDao.findAll(userId);
	}

	@Override
	public OrderInfo order(Integer userId, Integer addressId) {
		OrderInfo orderInfo = new OrderInfo();
		Address address = addressDao.find(addressId);
		orderInfo.setUserId(userId);
		orderInfo.setAddress(address);
		orderInfo.setPubTime(new java.sql.Timestamp(Calendar.getInstance().getTime().getTime()));
		orderInfo.setStatus(0);
		orderInfoDao.saveOrUpdate(orderInfo);
		return orderInfo;

	}

	@Override
	public int pay(int userId, OrderInfo orderInfo, double price) {
		List<BookInfo> bookInfoList = new ArrayList<BookInfo>();
		UserInfo userInfo = userInfoDao.find(userId);
		if (userInfo.getBalance() > price) {
			userInfo.setBalance(userInfo.getBalance() - price);
			userInfoDao.update(userInfo);
			orderInfo.setStatus(1);
			orderInfoDao.saveOrUpdate(orderInfo);
			for (BookNum bookNum : orderInfo.getBookNums()) {
				BookInfo bookInfo = bookNum.getBookInfo();
				if (bookInfo.getBookNumber() >= bookNum.getBookNum()) {
					bookInfo.setBookNumber(bookInfo.getBookNumber() - bookNum.getBookNum());
					bookInfoList.add(bookInfo);
				} else {
					return 2;
				}
			}
			for(BookInfo bookInfo:bookInfoList){
				bookInfoDao.update(bookInfo);
			}
			return 0;
		} else {
			return 1;
		}

	}

	@Override
	public String receipt(Integer orderId) {
		OrderInfo orderInfo = orderInfoDao.findById(orderId);
		orderInfo.setStatus(3);
		orderInfo.setGetTime(Calendar.getInstance().getTime());
		orderInfoDao.saveOrUpdate(orderInfo);
		return "确认收货成功";
	}

	@Override
	public String delivery(Integer orderId, String sendAddress) {
		OrderInfo orderInfo = orderInfoDao.findById(orderId);
		orderInfo.setSendAddress(sendAddress);
		orderInfo.setSendTime(Calendar.getInstance().getTime());
		orderInfo.setStatus(2);
		orderInfoDao.saveOrUpdate(orderInfo);
		return "已发货";
	}
	
	
	@Override
	public OrderInfo getOrderInfo(int id) {
		OrderInfo orderInfo = orderInfoDao.findById(id);
		return orderInfo;
	}

	@Override
	public List<OrderInfo> getBetween(Date begin, Date end) {
		return orderInfoDao.findBetween(begin, end);
	}

	@Override
	public List<OrderInfo> findAllAll() {
		return orderInfoDao.findAllAll();
	}

	@Override
	public String comment(int orderId) {
		OrderInfo orderInfo = orderInfoDao.findById(orderId);
		orderInfo.setStatus(4);
		orderInfoDao.saveOrUpdate(orderInfo);
		return null;
	}

}
