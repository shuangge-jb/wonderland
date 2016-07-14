package com.service;

import java.util.List;

import javax.annotation.Resource;
import org.springframework.stereotype.Service;

import com.dao.AddressDao;
import com.model.Address;

/**
 * 
 * @author Fang
 *
 */
@Service("addressService")
public class AddressServiceImpl implements AddressService {

	@Resource
	private AddressDao addressDao;

	@Override
	public List<Address> getAddressList(Integer userId) {
		return addressDao.findAll(userId);
	}

	@Override
	public void deleteAddress(Integer userId, int id) {
		Address ad = addressDao.find(id);
		if (ad != null && ad.getUserId().equals(userId)) {
			addressDao.delete(ad);
		} else {
			System.out.println("你不是该地址的主人");
		}
	}

	@Override
	public Address getAddress(Integer userId, int id) {
		Address address = addressDao.find(id);
		if (address!=null&&address.getUserId().equals(userId)) {
			return address;
		} else {
			return null;
		}
	}

	@Override
	public void saveOrUpdate(Address address) {
		addressDao.saveOrUpdate(address);
	}

}
