package com.service;

import java.util.List;

import com.model.BookInfo;
import com.model.ShoppingCart;

/**
 * 购物车管理的业务逻辑层
 * @author gjb   created on 6.26
 *
 */
public interface ManageShoppingCartService {
	public static final int MAX_SIZE=5;
	public static final String ADD_SUCCESS="添加成功";
	public static final String OVERFLOW="购物车已满";
	public static final String DELETE_SUCCESS="删除成功";
	public static final String ALREADY_EXISTED="已插入购物车";
	public static final String USER_UNEXISTED="该用户不存在";
	public static final String BOOK_UNEXISTED="该书不存在";
	public static final String UNEXISTED="记录不存在";
	public static final String NOT_ENOUGH="库存不足";
	public static final String UPDATE_SUCCESS="修改成功";
	public static final String MINIMUN="购买数量不能为0";
	public static final String NULL="购物车是空的";

	
/**
 * 根据用户的ID查找所有购物车信息       modified by gjb on 6.26
 * @return  购物车列表，如果购物车为空，返回大小为0的list
 */
	public List<ShoppingCart> find(String userId);
	/**
	 * 将数据插入购物车表中，在此方法中创建对象并插入,插入前先判断记录是否存在        modified by gjb on 6.26
	 * @param userId  用户的id
	 * @param bookId 书本的id
	 * @return  插入成功返回 “添加成功”，插入失败（记录已存在）返回  错误提示
	 */
	public String add(String userId, String bookId,String number);
	/**
	 * 删除记录，先判断记录是否存在            modified by gjb on 6.26
	 * @param userId
	 * @param bookId
	 * @return   删除成功，返回 "删除成功"，若记录不存在，返回  错误提示
	 */
	public String delete(String userId, String bookId);
	/**
	 * 找出购物车中的书本信息
	 * @param cart
	 * @return
	 */
	public List<BookInfo> findBookInCart(List<ShoppingCart> cart);
	/**
	 * 在购物车中修改商品数量
	 * @param userId
	 * @param bookId
	 * @param number
	 * @return
	 */
	public String update(String userId, String bookId,String number);
	/**
	 * 对购物车的商品数量自增1
	 * @param userId
	 * @param bookId
	 * @return
	 */
	public String numberAutoIncrement(String userId, String bookId);
	/**
	 * 对购物车的商品数量自减1
	 * @param userId
	 * @param bookId
	 * @return
	 */
	public String numberAutoDecrement(String userId, String bookId);
	/**
	 * 将该用户购物车中的所有信息删掉
	 * @param userId
	 * @return
	 */
	public String deleteAll(String userId);
}
