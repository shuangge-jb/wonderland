package com.dao;

import javax.annotation.Resource;

import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;

import com.model.BookNum;

@Repository
public class BookNumDaoImpl implements BookNumDao {

	@Resource
	private SessionFactory sessionFactory;
	
	@Override
	public BookNum findById(int id) {
		return (BookNum) sessionFactory.getCurrentSession().get(BookNum.class, id);
	}

	@Override
	public void saveOrUpdate(BookNum bookNum) {
		sessionFactory.getCurrentSession().saveOrUpdate(bookNum);

	}

	@Override
	public void delete(int id) {
		sessionFactory.getCurrentSession().delete(findById(id));

	}

}
