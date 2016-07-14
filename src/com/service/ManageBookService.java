package com.service;

import java.util.List;

import com.model.BookInfo;
import com.model.ReviewInfo;

/**
 * 商品管理相关业务逻辑 modified by gjb on 6.26
 * 
 * @author gjb
 *
 */
public interface ManageBookService {
	public static final String BOOK_UNEXISTED = "该书不存在";
	public static final String DELETE_SUCCESS = "删除成功";
	public static final String UPDATE_SUCCESS="修改成功";
	public static final String DEFAULT_TYPE = "null";// 默认类型，不能为null
	public static final String BOOKNAME_NULL="null";

	/**
	 * 找出所有书的信息 modified by gjb on 6.25
	 * 
	 * @return
	 */
	public List<BookInfo> findAll();

	/**
	 * 找出该书的所有信息 modified by gjb on 6.26
	 * 
	 * @param bookId
	 * @return 找不到，返回null
	 */
	public BookInfo find(String bookId);

	/**
	 * 删除该书的信息 modified by gjb on 6.25
	 * 
	 * @param bookId
	 * @return 书不存在，返回 "该书不存在"，成功删除，返回 "删除成功"
	 */
	public String delete(String bookId);

	/**
	 * 管理员上传商品
	 * 
	 * @param bookInfo
	 *            whx
	 */
	public void saveBookInDb(BookInfo bookInfo);

	/**
	 * 判断书是否已上传到数据库 whx
	 * 
	 * @param bookName
	 * @return
	 */
	public boolean isBookExistInDb(String bookName);

	/**
	 * 模糊搜索出含有该关键词的商品 gjb
	 * 
	 * @param bookName
	 * @return
	 */
	public List<BookInfo> findLike(String bookName, String type);

	/**
	 * 查找出现过的所有一级分类  gjb
	 * 
	 * @return String list,由所有一级目录组成的列表
	 */
	public List<String> findBookFirstType();
	
	public String update( Integer bookId,Integer bookNumber,Double bookPrice );
	/**
	 * 根据一级目录查找    gjb
	 * @return
	 */
	public List<BookInfo> findByFirstType(String firstType);

}