package com.dao;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate4.support.HibernateDaoSupport;
import org.springframework.stereotype.Repository;

import com.model.BookInfo;
import com.model.ShoppingCart;

@Repository
public class BookInfoDaoImpl/* extends HibernateDaoSupport */implements
		BookInfoDao {
	@Resource
	private SessionFactory sessionFactory;

	public BookInfoDaoImpl() {
		super();
		// TODO Auto-generated constructor stub
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

	/**
	 * 找出所有书的信息 created by gjb
	 */
	@SuppressWarnings("unchecked")
	@Override
	public List<BookInfo> findAll() {
		/*
		 * return (List<BookInfo>) getHibernateTemplate().find(
		 * "from com.model.BookInfo");
		 */
		return sessionFactory.getCurrentSession()
				.createQuery("from com.model.BookInfo").list();
	}

	/**
	 * 模糊搜索出含有该关键词的商品 created by gjb
	 * 
	 * @return
	 */
	@SuppressWarnings("unchecked")
	@Override
	public List<BookInfo> findLike(String keyword) {
		/*
		 * return (List<BookInfo>) getHibernateTemplate().find(
		 * "from com.model.BookInfo where book_name like ?",keyword);
		 */
		return sessionFactory
				.getCurrentSession()
				.createQuery(
						"from com.model.BookInfo where book_name like :keyword")
				.setString("keyword", "%" + keyword + "%").list();
	}

	/**
	 * 找出所有该分类下的商品 created by gjb
	 * 
	 * @return
	 */
	@Override
	// TODO
	public List<BookInfo> findByType(String type) {
		String hql = "from com.model.BookInfo where bookFirstType=:type or bookSecondType=:type";

		return sessionFactory.getCurrentSession().createQuery(hql)
				.setString("type", type).list();
	}

	@Override
	public BookInfo find(Integer id) {

		/*
		 * return (List<BookInfo>) getHibernateTemplate().find(
		 * "from com.model.BookInfo where bookId = ? ", bookId);
		 */
		List<BookInfo> list = sessionFactory.getCurrentSession()
				.createQuery("from com.model.BookInfo where id = :id")
				.setInteger("id", id).list();
		return list.size() > 0 ? list.get(0) : null;
	}

	@Override
	public void delete(BookInfo bookInfo) {

		sessionFactory.getCurrentSession().delete(bookInfo);
	}

	/**
	 * 管理员上传商品 whx
	 * 
	 */
	@Override
	public void saveBookInDb(BookInfo bookInfo) {
		sessionFactory.getCurrentSession().save(bookInfo);
	}

	/**
	 * 检验书是否已存在数据库 whx
	 * 
	 */
	@Override
	public boolean isBookExistInDb(String bookName) {
		List<BookInfo> list = sessionFactory
				.getCurrentSession()
				.createQuery("from com.model.BookInfo where bookName=:bookName")
				.setString("bookName", bookName).list();
		return list.size() > 0 ? true : false;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<BookInfo> findLike(String keyword, String bookFirstType) {
		return sessionFactory
				.getCurrentSession()
				.createQuery(
						"from com.model.BookInfo where bookName like :keyword and bookFirstType=:bookFirstType")
				.setString("keyword", "%" + keyword + "%")
				.setString("bookFirstType", bookFirstType).list();
	}

	@Override
	public List<String> findBookFirstType() {
		@SuppressWarnings("unchecked")
		List<String> result = sessionFactory.getCurrentSession()
				.createQuery(" select distinct bookFirstType from com.model.BookInfo ")
				.list();
		return result;
	}

	@Override
	public void update(BookInfo bookInfo) {
		sessionFactory.getCurrentSession().update(bookInfo);

	}

	

}
