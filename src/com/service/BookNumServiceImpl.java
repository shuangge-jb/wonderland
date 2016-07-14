package com.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.dao.BookNumDao;
import com.dao.BookNumDaoImpl;
import com.model.BookNum;

@Service
public class BookNumServiceImpl implements BookNumService {

	@Resource
	private BookNumDao bookNumDao;
	@Override
	public void save(BookNum bookNum) {
		bookNumDao.saveOrUpdate(bookNum);
	}

}
