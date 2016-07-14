package com.service;

import java.io.Serializable;
import java.util.List;

import com.model.Address;

/**
 * 
 * @author Fang
 *
 */
public interface AddressService {
	public Address getAddress(Integer userId,int id);
	public List<Address> getAddressList(Integer userId);
	public void deleteAddress(Integer userId, int id);
	public void saveOrUpdate(Address address);
	
}
