package com.dao;

import java.io.Serializable;
import java.util.List;

import com.model.ShoppingCart;

/**
 * 处理购物车信息     created by gjb on 6.26
 * @author gjb
 *
 */
public interface ShoppingCartDao {
/**
 * 找出该用户的所有购物车数据      created by gjb on 6.26
 * @return  
 */
	public List<ShoppingCart> findByUserId(Integer userId);
	/**
	 * 根据用户ID和书ID找出唯一的记录
	 * @param userId
	 * @param bookId
	 * @return 返回一个对象，若记录不存在，返回null
	 */
	public ShoppingCart find(Integer userId,Integer bookId);
	/**
	 * 将记录插入购物车     created by gjb on 6.26
	 * @param cart
	 * @return 返回插入的对象的主键
	 */
	public Serializable add(ShoppingCart cart);
	/**
	 * 将记录删除购物车     created by gjb on 6.26
	 * @param cart
	 * 
	 */
	public void delete(ShoppingCart cart);
	
	public void update(ShoppingCart cart);
	
	/**
	 * 从数据库中删除该用户购物车所有信息  gjb
	 */
	public void deleteAll(Integer userId);
}
