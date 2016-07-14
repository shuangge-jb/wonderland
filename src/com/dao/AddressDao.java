package com.dao;

import java.util.List;

import com.model.Address;
/**
 * 
 * @author Fang
 *
 */
public interface AddressDao {
	public void saveOrUpdate(Address address);
	public void delete(Address adress);
	public List<Address> findAll(Integer userId);
	public Address find(int id);
}
