package com.service;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.dao.BookInfoDao;
import com.dao.ShoppingCartDao;
import com.dao.UserInfoDao;
import com.model.BookInfo;
import com.model.ShoppingCart;
import com.model.UserInfo;

@Service
public class ManageShoppingCartServiceImpl implements ManageShoppingCartService {
	@Resource
	private ShoppingCartDao shoppingCartDao;
	@Resource
	private UserInfoDao userInfoDao;
	@Resource
	private BookInfoDao bookInfoDao;

	public ManageShoppingCartServiceImpl() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @return the userInfoDao
	 */
	public UserInfoDao getUserInfoDao() {
		return userInfoDao;
	}

	/**
	 * @param userInfoDao
	 *            the userInfoDao to set
	 */
	public void setUserInfoDao(UserInfoDao userInfoDao) {
		this.userInfoDao = userInfoDao;
	}

	/**
	 * @return the bookInfoDao
	 */
	public BookInfoDao getBookInfoDao() {
		return bookInfoDao;
	}

	/**
	 * @param bookInfoDao
	 *            the bookInfoDao to set
	 */
	public void setBookInfoDao(BookInfoDao bookInfoDao) {
		this.bookInfoDao = bookInfoDao;
	}

	/**
	 * @return the shoppingCartDao
	 */
	public ShoppingCartDao getShoppingCartDao() {
		return shoppingCartDao;
	}

	/**
	 * @param shoppingCartDao
	 *            the shoppingCartDao to set
	 */
	public void setShoppingCartDao(ShoppingCartDao shoppingCartDao) {
		this.shoppingCartDao = shoppingCartDao;
	}

	@Override
	public List<ShoppingCart> find(String userId) {
		return shoppingCartDao.findByUserId(Integer.valueOf(userId));
	}

	@Override
	public String add(String userId, String bookId, String number) {
		List<ShoppingCart> list = shoppingCartDao.findByUserId(Integer
				.valueOf(userId));
		if (list.size() >= MAX_SIZE) {
			return OVERFLOW;// 每个用户购物车中的商品数量有限度
		} else {
			ShoppingCart cart = shoppingCartDao.find(Integer.valueOf(userId),
					Integer.valueOf(bookId));
			if (cart != null) {
				cart.setNumber(Integer.valueOf(number));
				shoppingCartDao.update(cart);
				return UPDATE_SUCCESS;
			} else {
				UserInfo user = userInfoDao.find(Integer.valueOf(userId));
				BookInfo book = bookInfoDao.find(Integer.valueOf(bookId));
				if ((user != null) && (book != null)) {// 两个id是外键，要在对应表中有记录
					if (book.getBookNumber().intValue() < Integer
							.parseInt(number)) {// 判断有没有余量
						return NOT_ENOUGH;
					}
					ShoppingCart newCart = new ShoppingCart(
							Integer.valueOf(userId), Integer.valueOf(bookId),
							Integer.valueOf(number));
					shoppingCartDao.add(newCart);
					return ADD_SUCCESS;
				} else if (book == null) {// 对于id不存在的情况，分别给出提示
					return BOOK_UNEXISTED;
				} else {
					return USER_UNEXISTED;
				}
			}
		}
	}

	@Override
	public String delete(String userId, String bookId) {
		System.out.println("delete from shoppingCart ,bookId= " + bookId);
		ShoppingCart cart = shoppingCartDao.find(Integer.valueOf(userId),
				Integer.valueOf(bookId));// 先把对象查出来，再删除对象
		if (cart == null) {
			return BOOK_UNEXISTED;
		} else {
			shoppingCartDao.delete(cart);
			return DELETE_SUCCESS;
		}
	}

	@Override
	public List<BookInfo> findBookInCart(List<ShoppingCart> cart) {
		List<BookInfo> books = new ArrayList<BookInfo>();
		for (ShoppingCart item : cart) {
			books.add(bookInfoDao.find(item.getBookId()));
		}
		return books;
	}

	@Override
	public String update(String userId, String bookId, String number) {
		int updateNumber = Integer.valueOf(number);
		ShoppingCart cart = shoppingCartDao.find(Integer.valueOf(userId),
				Integer.valueOf(bookId));
		if (cart == null) {
			return UNEXISTED;
		}
		if(updateNumber<=0){
			return MINIMUN;
		}
		if (updateNumber >bookInfoDao.find(Integer.valueOf(bookId)).getBookNumber()
				.intValue()) {
			return NOT_ENOUGH;
		}
		cart.setNumber(updateNumber);
		shoppingCartDao.update(cart);
		return UPDATE_SUCCESS;
	}

	@Override
	public String numberAutoIncrement(String userId, String bookId) {
		ShoppingCart cart = shoppingCartDao.find(Integer.valueOf(userId),
				Integer.valueOf(bookId));
		if (cart == null)
			return UNEXISTED;
		int remain = bookInfoDao.find(Integer.valueOf(bookId)).getBookNumber()
				.intValue();
		int buyNumber = cart.getNumber().intValue();
		if (remain <= buyNumber)// 已达最大数量，不能再自增
			return NOT_ENOUGH;

		cart.setNumber(buyNumber + 1);
		shoppingCartDao.update(cart);
		return UPDATE_SUCCESS;
	}

	@Override
	public String numberAutoDecrement(String userId, String bookId) {
		ShoppingCart cart = shoppingCartDao.find(Integer.valueOf(userId),
				Integer.valueOf(bookId));
		if (cart == null)
			return UNEXISTED;
		int buyNumber = cart.getNumber().intValue();
		if (buyNumber <= 1)// 购买数量为1，不能再自减
			return MINIMUN;

		cart.setNumber(buyNumber - 1);
		shoppingCartDao.update(cart);
		return UPDATE_SUCCESS;
	}

	@Override
	public String deleteAll(String userId) {
		List<ShoppingCart> cart = find(userId);
		if (cart.size() == 0) {
			return NULL;
		}
		shoppingCartDao.deleteAll(Integer.valueOf(userId));
		return DELETE_SUCCESS;
	}

}
