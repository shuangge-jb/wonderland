package com.dao;

import java.util.List;
import com.model.BookInfo;
/**
 * 处理书的信息
 * @author modified by gjb on 6.25
 *
 */
public interface BookInfoDao {
	/**
	 * 找出所有书的信息  modified by gjb on 6.24
	 */
	public List<BookInfo> findAll();
	/**
	 * 模糊搜索出含有该关键词的商品     modified by gjb on 6.24
	 * @param 
	 * @return
	 */
	public List<BookInfo> findLike(String keyword);
	/**
	 * 根据一级分类模糊搜索出含有该关键词的商品     modified by gjb on 7.1
	 * @param 
	 * @return
	 */
	public List<BookInfo> findLike(String keyword,String bookFirstType);

	/**
	 * 找出所有该分类下的商品     modified by gjb on 6.24
	 * 
	 * @return
	 */
	public List<BookInfo> findByType(String type);
	/**
	 * 根据ID找出唯一的书
	 * @param id
	 * @return 找不到，返回null
	 */
	public BookInfo find(Integer id);
	/**
	 * 删除该书的信息        created by gjb on 6.26
	 * @param bookInfo
	 */
	public void delete(BookInfo bookInfo);
	/**
	 * 管理员上传商品，保存到数据库   whx
	 * @param bookInfo
	 */
	public void saveBookInDb(BookInfo bookInfo);
	/**
	 * 判断该书是否已经存在       whx
	 * @param bookName
	 * @return
	 */
	public boolean isBookExistInDb(String bookName);
	/**
	 * 查找所有出现过的一级分类
	 * @return  String list,由所有一级目录组成的列表
	 */
	public List<String> findBookFirstType();
	/**
	 * 修改后更新        gjb
	 * @param bookInfo
	 */
	public void update(BookInfo bookInfo);
	
}
