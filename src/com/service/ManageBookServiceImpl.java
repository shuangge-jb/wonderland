package com.service;

import java.util.List;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.BookInfoDao;
import com.dao.ReviewInfoDao;
import com.model.BookInfo;
import com.model.ReviewInfo;
/**
 * 商品管理的实现类    modified by gjb on 6.26
 * @author gjb 
 *
 */
@Service("showBookService")
public class ManageBookServiceImpl implements ManageBookService {
	@Resource
private BookInfoDao bookInfoDao;
	@Resource 
	private ReviewInfoDao reviewInfoDao;
	public ManageBookServiceImpl() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	/**
	 * @return the bookInfoDao
	 */
	public BookInfoDao getBookInfoDao() {
		return bookInfoDao;
	}
	/**
	 * @param bookInfoDao the bookInfoDao to set
	 */
	public void setBookInfoDao(BookInfoDao bookInfoDao) {
		this.bookInfoDao = bookInfoDao;
	}
	/**
	 * @return the reviewInfoDao
	 */
	public ReviewInfoDao getReviewInfoDao() {
		return reviewInfoDao;
	}

	/**
	 * @param reviewInfoDao the reviewInfoDao to set
	 */
	public void setReviewInfoDao(ReviewInfoDao reviewInfoDao) {
		this.reviewInfoDao = reviewInfoDao;
	}

	@Override
	public List<BookInfo> findAll() {
		return bookInfoDao.findAll();
	}
	@Override
	public BookInfo find(String bookId) {
		
		return bookInfoDao.find(Integer.valueOf(bookId));
	}
	@Override
	public String delete(String bookId) {
		Integer id=Integer.valueOf(bookId);
		BookInfo bookInfo=bookInfoDao.find(id);
		if(bookInfo==null){
			return ManageBookService.BOOK_UNEXISTED;
		}else{
		bookInfoDao.delete(bookInfo);
		return ManageBookService.DELETE_SUCCESS;
		}
	}
	@Override
	public void saveBookInDb(BookInfo bookInfo) {
		bookInfoDao.saveBookInDb(bookInfo);	
	}
	@Override
	public boolean isBookExistInDb(String bookName) {	
		return bookInfoDao.isBookExistInDb(bookName);
	}

	@Override
	public List<BookInfo> findLike(String bookName,String type) {
		
		if(bookName.equals(BOOKNAME_NULL)&&type.equals(DEFAULT_TYPE)){
			List<BookInfo>list=findAll();
			return list;
		}else if(bookName.equals(BOOKNAME_NULL)){
			List<BookInfo>list=findByFirstType(type);
			return list;
		}else if(type.equals(DEFAULT_TYPE)){//没有选择分类时搜索所有书
			return bookInfoDao.findLike(bookName);
		}else{//指定分类时搜索该分类下的书
		return bookInfoDao.findLike(bookName,type);
		}
	}

	@Override
	public List<String> findBookFirstType() {
		return bookInfoDao.findBookFirstType();
	}

	@Override
	public String update(Integer bookId, Integer bookNumber, Double bookPrice) {
		BookInfo book=bookInfoDao.find(bookId);
		if(book==null)return BOOK_UNEXISTED;
		book.setBookNumber(bookNumber);
		book.setBookPrice(bookPrice);
		bookInfoDao.update(book);
		return UPDATE_SUCCESS;
	}

	@Override
	public List<BookInfo> findByFirstType(String firstType) {
		return bookInfoDao.findByType(firstType);
		
	}

	

	

}
