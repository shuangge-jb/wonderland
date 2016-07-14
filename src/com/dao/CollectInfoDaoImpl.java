package com.dao;

import java.util.LinkedList;
import java.util.List;

import javax.annotation.Resource;

import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;

import com.model.BookInfo;
import com.model.CollectInfo;
import com.model.ShoppingCart;
/**
 *  收藏夹的实现类   whx
 * @author Administrator
 *
 */
@Repository
public class CollectInfoDaoImpl implements CollectInfoDao {
	@Resource
	private SessionFactory sessionFactory;
	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}
    public CollectInfoDaoImpl(SessionFactory sessionFactory) {
		super();
		this.sessionFactory = sessionFactory;
	}

	public CollectInfoDaoImpl(){
    	super();
    }
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Override
	public List<CollectInfo> findCollectBookInfo(Integer userId) {
		String hql = " from com.model.CollectInfo where userId=:userId";
		return sessionFactory.getCurrentSession()
				.createQuery(hql).setInteger("userId", userId).list();
	}
	@Override
	public void deleteBookInCollect(Integer userId, Integer bookId) {
		String hql = " from com.model.CollectInfo where userId=:userId and bookId=:bookId";
		@SuppressWarnings("unchecked")
		List<CollectInfo> list = sessionFactory.getCurrentSession()
				.createQuery(hql).setInteger("userId", userId)
				.setInteger("bookId", bookId).list();
		CollectInfo collectInfo=list.get(0);
		sessionFactory.getCurrentSession().delete(collectInfo);
	}

	@Override
	public void addBookToCollect(CollectInfo collectInfo) {
		sessionFactory.getCurrentSession().save(collectInfo);
		
	}
	@Override
	public boolean isBookHasCollected(Integer bookId, Integer userId) {
		String hql = " from com.model.CollectInfo where userId=:userId and bookId=:bookId";
		@SuppressWarnings("unchecked")
		List<CollectInfo> list = sessionFactory.getCurrentSession()
				.createQuery(hql).setInteger("userId", userId)
				.setInteger("bookId", bookId).list();
		if(list.size()>0)
			return true;
		else return false;
	}


}
