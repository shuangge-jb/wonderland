package com.dao;
import java.util.List;

import javax.annotation.Resource;
import javax.transaction.Transactional;

import org.hibernate.FlushMode;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.orm.hibernate4.support.HibernateDaoSupport;
import org.springframework.stereotype.Repository;

import com.model.Address;

/**
 * 
 * @author Fang
 *
 */
@Repository
public class AddressDaoImpl /*extends HibernateDaoSupport */implements AddressDao {

	@Resource
	private SessionFactory sessionFactory;
	
	@Override
	public void saveOrUpdate(Address address) {
		sessionFactory.getCurrentSession().saveOrUpdate(address);
	}

	@Override
	public void delete(Address adress) {
		sessionFactory.getCurrentSession().delete(adress);
	}


	@SuppressWarnings("unchecked")
	@Override
	public List<Address> findAll(Integer userId) {
		String hql = "from com.model.Address as address where user_Id=?";
		return  (List<Address>) sessionFactory.getCurrentSession()
				.createQuery(hql).setInteger(0, userId).list();
	}

	@Override
	public Address find(int id) {
		return (Address) sessionFactory.getCurrentSession().get(Address.class,id);
	}

	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

}
