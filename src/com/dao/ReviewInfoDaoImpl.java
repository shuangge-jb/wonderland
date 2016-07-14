package com.dao;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;

import com.model.BookInfo;
import com.model.ReviewInfo;
@Repository
public class ReviewInfoDaoImpl implements ReviewInfoDao {
	@Resource
	private SessionFactory sessionFactory;
	public ReviewInfoDaoImpl() {
		super();
		// TODO Auto-generated constructor stub
	}

	public ReviewInfoDaoImpl(SessionFactory sessionFactory) {
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

	@Override
	public List<ReviewInfo> findById(Integer id) {
		String hql = "from com.model.ReviewInfo where userId=:id ";
		return sessionFactory.getCurrentSession().createQuery(hql)
				.setInteger("id", id).list();
	}  
	@Override
	public void saveReviewInfoInDB(ReviewInfo reviewInfo) {
		sessionFactory.getCurrentSession().save(reviewInfo);
		
	}

	@Override
	public void deleteReviewInfoInById(Integer id) {
		String hql = "from com.model.ReviewInfo where id=:id";
		ReviewInfo reviewInfo=(ReviewInfo) sessionFactory.getCurrentSession().createQuery(hql)
				.setInteger("id", id).list().get(0);
		sessionFactory.getCurrentSession().delete(reviewInfo);	
	}

	@Override
	public List<ReviewInfo> findByBookId(Integer bookId) {
		String hql = "from com.model.ReviewInfo where bookId=:id ";
		return sessionFactory.getCurrentSession().createQuery(hql)
				.setInteger("id", bookId).list();
	}

	@Override
	public int getBookNumByBookId(Integer bookId) {
		String hql = "from com.model.ReviewInfo where bookId=:id ";
		 return sessionFactory.getCurrentSession().createQuery(hql)
				.setInteger("id", bookId).list().size();
	}

}
