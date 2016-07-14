package com.service;
import java.util.List;

import com.dao.CollectInfoDao;
import com.model.BookInfo;
import com.model.CollectInfo;
/**
 * whx 
 * @author Administrator
 *
 */
public interface CollectService {
	 /**
	  * 通过用户Id查询Ta所收藏的书 whx
	  * @param userId
	  * @return
	  */
	 public List<BookInfo> findCollectBookInfo(Integer userId);
	 /**
	  * 通过用户Id和书Id 从收藏夹删除书  whx
	  * @param userId
	  * @param bookId
	  */
	 public void deleteBookInCollect(Integer userId,Integer bookId);
	 /**
	  * 把书添加到收购藏夹   whx
	  * @param collectInfo
	  */
	 public void addBookToCollect(CollectInfo collectInfo);
	 /**
	  * 验证书是否被该用户收藏过
	  * @param userId
	  * @param bookId
	  * @return
	  */
	 public boolean isBookHasCollected(Integer userId,Integer bookId);
	 

}
